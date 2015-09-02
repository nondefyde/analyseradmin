<?php

namespace App\Http\Controllers;

use App\Models\HansardsAndVotes\Hansard;
use App\Models\HansardsAndVotes\HansardRollCall;
use App\Models\Legislative\FederalRepresentative;
use App\Models\Legislative\Senator;
use App\Models\Legislative\StateRepresentative;
use App\Models\MasterRecords\House;
use GrahamCampbell\Flysystem\Facades\Flysystem;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\File;

use App\Http\Requests;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Response;
use Illuminate\Support\Facades\Validator;

class HansardsController extends Controller
{
    /**
     * Redirects To The Contractors Default Page
     * @var string
     */
    protected $redirectTo = '/hansards';

    /**
     * Make sure the user is logged in
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Get a validator for an incoming registration request.
     * @param  array $data
     * @return \Illuminate\Contracts\Validation\Validator
     */
    protected function validator(array $data)
    {
        $method = $this->getRouter()->getCurrentRequest()->getMethod();
        $messages = [
            'volume.required' => 'Hansard Volume is Required!',
            'number.required' => 'Hansard Number is Required!',
            'date.required' => 'Hansard Date is Required!',
            'session.required' => 'Hansard Session is Required!',
            'upload_url.required' => 'Hansard Attachment is Required!',
            'upload_url.mimes' => 'Hansard Attachment must be a PDF file!',
            'house_id.required' => 'House is Required!',
        ];
        switch ($method) {
            case 'GET' :
            case 'DELETE' :
                return [];
            case 'POST' :
                return Validator::make($data, [
                    'volume' => 'required',
                    'number' => 'required',
                    'date' => 'required',
                    'session' => 'required',
                    'house_id' => 'required',
                    'upload_url' => 'required|mimes:pdf',
                ], $messages);
            case 'PUT' :
            case 'PATCH' :
                return Validator::make($data, [
                    'volume' => 'required',
                    'number' => 'required',
                    'date' => 'required',
                    'session' => 'required',
                    'house_id' => 'required',
                    'upload_url' => 'mimes:pdf',
                ], $messages);
            default :
                break;
        }
    }

    /**
     * Display a listing of the resource.
     *
     * @return Response
     */
    public function getIndex()
    {
        $hansards = Hansard::all();
        return view('hansards.index', compact('hansards'));
    }

    /**
     * Show the form for creating a new resource.
     * @param Strind $encodeId
     * @return Response
     */
    public function getCreate($encodeId = null)
    {
        $senators = Senator::all()->count();
        $federal_rep = FederalRepresentative::all()->count();
        $state_rep = StateRepresentative::all()->count();
        $houses = House::orderBy('house')->get();
        return view('hansards.create', compact('senators', 'federal_rep', 'state_rep', 'encodeId', 'houses'));
    }

    /**
     * Store the form for creating a new resource.
     * @param  Request $request
     * @return Response
     */
    public function postCreate(Request $request)
    {
        $inputs = $request->all();
        //Validate Request Inputs
        $validator = $this->validator($inputs);

        if ($validator->fails()) {
            $this->setFlashMessage('  Error!!! You have error(s) while filling the form.', 2);
            return redirect('hansards/create')->withErrors($validator)->withInput();
        }
        // Store the Hansard...
        $inputs['user_id'] = Auth::user()->user_id;
        $hansard = Hansard::create($inputs);
        if ($hansard) {
            //upload the pdf files if available
            if ($request->hasFile('upload_url')) {
                $file = $hansard->hansard_id . '_upload.' . $request->file('upload_url')->getClientOriginalExtension();
                $request->file('upload_url')->move(base_path() . '/public/' . $hansard->file_path, $file);

                $file_hansard = File::get($hansard->file_path.$file);
                Flysystem::connection('awss3')->put($hansard->file_path.$file, $file_hansard);

                //Update File Path
                $hansard->upload_url = $file;
                $hansard->save();
            }
            // Set the flash message
            $this->setFlashMessage('  Saved!!! the Hansard have successfully been added.', 1);
            // redirect to the create hansard page and enable the take roll call link
            $encodeId = $this->getHashIds()->encode($hansard->hansard_id);

            return redirect('hansards/create/' . $encodeId);
        }
    }

    /**
     * Displays the list of Chamber Members for roll call taking
     * @param $encodeId
     * @return \Illuminate\View\View
     */
    public function getRollCall($encodeId)
    {
        $decodeId = $this->getHashIds()->decode($encodeId);
        $hansard = (empty($decodeId)) ? abort(305) : Hansard::findOrFail($decodeId[0]);
        $attend = $hansard->attendances()->get(['users.user_id'])->lists('user_id')->toArray();

        $rollcalls = HansardRollCall::where('hansard_id', $hansard->hansard_id);
        $user_type = $hansard->house()->first()->user_type_id;
        $legislatives = null;

        if ($user_type === Senator::USER_TYPE) {
            $legislatives = Senator::all();
            $legislatives->column_header = 'Senatorial Districts';
        } elseif ($user_type === FederalRepresentative::USER_TYPE) {
            $legislatives = FederalRepresentative::all();
            $legislatives->column_header = 'Federal Constituency';
        } elseif ($user_type === StateRepresentative::USER_TYPE) {
            $legislatives = StateRepresentative::all();
            $legislatives->column_header = 'State Constituency';
        }

        for ($i = 0; $i < count($legislatives); $i++) {
            $temp = null;
            switch($legislatives[$i]->house()->first()->user_type_id){
                case Senator::USER_TYPE:
                    $temp = $legislatives[$i]->senatorialDistrict()->first()->senatorial_district;
                    break;
                case FederalRepresentative::USER_TYPE:
                    $temp = $legislatives[$i]->federalConstituency()->first()->federal_constituency;
                    break;
                case StateRepresentative::USER_TYPE:
                    $temp = $legislatives[$i]->stateConstituency()->first()->state_constituency;
                    break;
            }
            $legislatives[$i]['legislative_zone'] = $temp;
        }
        return view('hansards.roll-call', compact('legislatives', 'rollcalls', 'hansard', 'attend'));
    }

    /**
     * Displays the list of Chamber Members for roll call taking
     * @param Request $request
     * @return \Illuminate\View\View
     */
    public function postRollCall(Request $request)
    {
        $inputs = $request->all();
        $hansard = (empty($inputs['hansard_id'])) ? abort(305) : Hansard::findOrFail($inputs['hansard_id']);
        if($hansard){
            //Insert the selected roll call
            $hansard->attendances()->sync($inputs['user_id']);
        }
        return redirect('hansards');
    }

    /**
     * Show the form for editing a new resource.
     * @param Strind $encodeId
     * @return Response
     */
    public function getEdit($encodeId)
    {
        $decodeId = $this->getHashIds()->decode($encodeId);
        $hansard = (empty($decodeId)) ? abort(305) : Hansard::findOrFail($decodeId[0]);
        $senators = Senator::all()->count();
        $federal_rep = FederalRepresentative::all()->count();
        $state_rep = StateRepresentative::all()->count();
        $houses = House::orderBy('house')->get();
        return view('hansards.edit', compact('senators', 'federal_rep', 'state_rep', 'hansard', 'houses'));
    }

    /**
     * Store the form for creating a new resource.
     * @param  Request $request
     * @param  String $encodeId
     * @return Response
     */
    public function patchEdit(Request $request, $encodeId)
    {
        $decodeId = $this->getHashIds()->decode($encodeId);
        $hansard = (empty($decodeId)) ? abort(305) : Hansard::findOrFail($decodeId[0]);
        $inputs = $request->all();
        //Validate Request Inputs
        $validator = $this->validator($inputs);

        if ($validator->fails()) {
            $this->setFlashMessage('  Error!!! You have error(s) while filling the form.', 2);
            return redirect('hansards/edit/' . $encodeId)->withErrors($validator)->withInput();
        }
        // Store the Hansard...
        $updated = $hansard->update($inputs);
        if ($updated) {
            //upload the pdf files if available
            if ($request->hasFile('upload_url')) {
                $file = $hansard->hansard_id . '_upload.' . $request->file('upload_url')->getClientOriginalExtension();
                $request->file('upload_url')->move(base_path() . '/public/' . $hansard->file_path, $file);

                $file_hansard = File::get($hansard->file_path.$file);
                Flysystem::connection('awss3')->put($hansard->file_path.$file, $file_hansard);

                //Update File Path
                $hansard->upload_url = $file;
                $hansard->save();
            }
            // Set the flash message
            $this->setFlashMessage('  Updated!!! the Hansard have successfully been updated.', 1);
            // redirect to the create hansard page and enable the take roll call link
            return redirect('/hansards');
        }
    }

    /**
     * Delete a Hansard from the list of Hansards hansard id
     * @param $id
     * @return Response
     */
    public function getDelete($id){
        $hansard = Hansard::findOrFail($id);
        //Delete The Beneficiary Record
        $delete = ($hansard !== null) ? $hansard->delete() : null;

        if($delete){
            $this->setFlashMessage('  Deleted!!! Hansard with Vol: ' . $hansard->volume . ', No: ' . $hansard->number . ', ' .$hansard->session.' have been deleted.', 1);
        }else{
            $this->setFlashMessage('Error!!! Unable to delete record.', 2);
        }
    }

    /**
     * Displays the view for hansards with out the roll call, edit and delete links
     * @return \Illuminate\View\View
     */
    public function getView(){
        $hansards = Hansard::all();
        return view('hansards.view', compact('hansards'));
    }

    /**
     * Get the file ready for download
     * @param $encodeId
     * @return mixed
     */
    public function getDownload($encodeId){
        $decodeId = $this->getHashIds()->decode($encodeId);
        return Response::download('uploads/hansards/'.$decodeId[0].'_upload.pdf');
    }
}
