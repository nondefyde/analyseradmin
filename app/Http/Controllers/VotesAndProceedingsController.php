<?php

namespace App\Http\Controllers;

use App\Models\Legislative\FederalRepresentative;
use App\Models\Legislative\Senator;
use App\Models\Legislative\StateRepresentative;
use App\Models\MasterRecords\House;
use App\Models\HansardsAndVotes\VotesAndProceeding;
use App\Models\HansardsAndVotes\VotesAndProceedingRollCall;
use GrahamCampbell\Flysystem\Facades\Flysystem;
use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Response;
use Illuminate\Support\Facades\Validator;

class VotesAndProceedingsController extends Controller
{
    /**
     * Redirects To The Contractors Default Page
     * @var string
     */
    protected $redirectTo = '/vote-proceedings';

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
            'volume.required' => 'VotesAndProceeding Volume is Required!',
            'number.required' => 'VotesAndProceeding Number is Required!',
            'date.required' => 'VotesAndProceeding Date is Required!',
            'session.required' => 'VotesAndProceeding Session is Required!',
            'upload_url.required' => 'VotesAndProceeding Attachment is Required!',
            'upload_url.mimes' => 'VotesAndProceeding Attachment must be a PDF file!',
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
        $votes_proceedings = VotesAndProceeding::all();
        return view('vote-proceedings.index', compact('votes_proceedings'));
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
        return view('vote-proceedings.create', compact('senators', 'federal_rep', 'state_rep', 'encodeId', 'houses'));
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
            return redirect('vote-proceedings/create')->withErrors($validator)->withInput();
        }
        // Store the VotesAndProceeding...
        $inputs['user_id'] = Auth::user()->user_id;
        $votes_proceeding = VotesAndProceeding::create($inputs);
        if ($votes_proceeding) {
            //upload the pdf files if available
            if ($request->hasFile('upload_url')) {
                $file = $votes_proceeding->votes_proceeding_id . '_upload.' . $request->file('upload_url')->getClientOriginalExtension();
                $request->file('upload_url')->move(base_path() . '/public/' . $votes_proceeding->file_path, $file);

                $file_hansard = File::get($votes_proceeding->file_path.$file);
                Flysystem::connection('awss3')->put($votes_proceeding->file_path.$file, $file_hansard);

                //Update File Path
                $votes_proceeding->upload_url = $file;
                $votes_proceeding->save();
            }
            // Set the flash message
            $this->setFlashMessage('  Saved!!! the VotesAndProceeding have successfully been added.', 1);
            // redirect to the create hansard page and enable the take roll call link
            $encodeId = $this->getHashIds()->encode($votes_proceeding->votes_proceeding_id);

            return redirect('/vote-proceedings/create/' . $encodeId);
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
        $vote_proceeding = (empty($decodeId)) ? abort(305) : VotesAndProceeding::findOrFail($decodeId[0]);
        $attend = $vote_proceeding->attendances()->get(['users.user_id'])->lists('user_id')->toArray();

        $rollcalls = VotesAndProceedingRollCall::where('votes_proceeding_id', $vote_proceeding->votes_proceeding_id);
        $user_type = $vote_proceeding->house()->first()->user_type_id;
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
        return view('vote-proceedings.roll-call', compact('legislatives', 'rollcalls', 'vote_proceeding', 'attend'));
    }

    /**
     * Displays the list of Chamber Members for roll call taking
     * @param Request $request
     * @return \Illuminate\View\View
     */
    public function postRollCall(Request $request)
    {
        $inputs = $request->all();
        $votes_proceeding = (empty($inputs['votes_proceeding_id'])) ? abort(305) : VotesAndProceeding::findOrFail($inputs['votes_proceeding_id']);
        if($votes_proceeding){
            //Insert the selected roll call
            $votes_proceeding->attendances()->sync($inputs['user_id']);
        }
        return redirect('vote-proceedings');
    }

    /**
     * Show the form for editing a new resource.
     * @param Strind $encodeId
     * @return Response
     */
    public function getEdit($encodeId)
    {
        $decodeId = $this->getHashIds()->decode($encodeId);
        $votes_proceeding = (empty($decodeId)) ? abort(305) : VotesAndProceeding::findOrFail($decodeId[0]);
        $senators = Senator::all()->count();
        $federal_rep = FederalRepresentative::all()->count();
        $state_rep = StateRepresentative::all()->count();
        $houses = House::orderBy('house')->get();
        return view('vote-proceedings.edit', compact('senators', 'federal_rep', 'state_rep', 'votes_proceeding', 'houses'));
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
        $votes_proceeding = (empty($decodeId)) ? abort(305) : VotesAndProceeding::findOrFail($decodeId[0]);
        $inputs = $request->all();
        //Validate Request Inputs
        $validator = $this->validator($inputs);

        if ($validator->fails()) {
            $this->setFlashMessage('  Error!!! You have error(s) while filling the form.', 2);
            return redirect('vote-proceedings/edit/' . $encodeId)->withErrors($validator)->withInput();
        }
        // Store the VotesAndProceeding...
        $updated = $votes_proceeding->update($inputs);
        if ($updated) {
            //upload the pdf files if available
            if ($request->hasFile('upload_url')) {
                $file = $votes_proceeding->votes_proceeding_id . '_upload.' . $request->file('upload_url')->getClientOriginalExtension();
                $request->file('upload_url')->move(base_path() . '/public/' . $votes_proceeding->file_path, $file);

                $file_votes_proceeding = File::get($votes_proceeding->file_path.$file);
                Flysystem::connection('awss3')->put($votes_proceeding->file_path.$file, $file_votes_proceeding);

                //Update File Path
                $votes_proceeding->upload_url = $file;
                $votes_proceeding->save();
            }
            // Set the flash message
            $this->setFlashMessage('  Updated!!! the VotesAndProceeding have successfully been updated.', 1);
            // redirect to the create votes_proceeding page and enable the take roll call link
            return redirect('/vote-proceedings');
        }
    }

    /**
     * Delete a VotesAndProceeding from the list of VotesAndProceedings votes_proceeding id
     * @param $id
     * @return Response
     */
    public function getDelete($id){
        $votes_proceeding = VotesAndProceeding::findOrFail($id);
        //Delete The Beneficiary Record
        $delete = ($votes_proceeding !== null) ? $votes_proceeding->delete() : null;

        if($delete){
            $this->setFlashMessage('  Deleted!!! Votes And Proceeding with Vol: ' . $votes_proceeding->volume . ', No: ' . $votes_proceeding->number . ', ' .$votes_proceeding->session.' have been deleted.', 1);
        }else{
            $this->setFlashMessage('Error!!! Unable to delete record.', 2);
        }
    }

    /**
     * Displays the view for votes_proceedings with out the roll call, edit and delete links
     * @return \Illuminate\View\View
     */
    public function getView(){
        $votes_proceedings = VotesAndProceeding::all();
        return view('vote-proceedings.view', compact('votes_proceedings'));
    }

    /**
     * Get the file ready for download
     * @param $encodeId
     * @return mixed
     */
    public function getDownload($encodeId){
        $decodeId = $this->getHashIds()->decode($encodeId);
        return Response::download('uploads/votes_proceedings/'.$decodeId[0].'_upload.pdf');
    }
}
