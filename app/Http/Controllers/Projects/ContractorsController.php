<?php

namespace App\Http\Controllers\Projects;

use App\Models\Projects\Contractor;
use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Validator;

class ContractorsController extends Controller
{
    /**
     * Redirects To The Contractors Default Page
     * @var string
     */
    protected $redirectTo = '/contractors';

    /**
     *
     * Make sure the user is logged in
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Get a validator for an incoming registration request.
     *
     * @param  array  $data
     * @param int $id
     * @return \Illuminate\Contracts\Validation\Validator
     */
    protected function validator(array $data, $id=null)
    {
        $method = $this->getRouter()->getCurrentRequest()->getMethod();
        $messages = [
            'contractor.required' => 'The Name of Contractor is Required!',
            'contractor_code.required' => 'The Contractors Registration Code is Required!',
            'contractor_code.unique' => 'The Contractor has been registered already!',
            'phone_no.required' => 'Contractors Phone Number is Required!',
            'email.required' => 'Contractors Valid e-mail Address is Required!',
            'cac_registration_no.required' => 'Contractors C.A.C Registration Number is Required!',
            'tin.required' => 'Contractors T.I.N is Required!',
            'specialization_area.required' => 'Area of Specialization is Required!',
            'years_experience.required' => 'Years of Experience is Required!',
            'address.required' => 'Next Of Kin\'s contact Address is Required!'
        ];
        switch($method)
        {
            case 'GET' :
            case 'DELETE' : return [];
            case 'POST' :
                return Validator::make($data, [
                    'contractor_code' => 'required|max:255|unique:contractors,contractor_code',
                    'contractor' => 'required|max:255',
                    'email' => 'required|email|max:255|unique:contractors,email',
                    'phone_no' => 'required',
                    'cac_registration_no' => 'required',
                    'tin' => 'required',
                    'specialization_area' => 'required',
                    'years_experience' => 'required|integer',
                    'address' => 'required'
                ], $messages);
            case 'PUT' :
            case 'PATCH' :
                return Validator::make($data, [
                    'contractor_code' => 'required|max:255|unique:contractors,contractor_code,'.$id.',contractor_id',
                    'contractor' => 'required|max:255',
                    'email' => 'required|email|max:255|unique:contractors,email,'.$id.',contractor_id',
                    'phone_no' => 'required',
                    'cac_registration_no' => 'required',
                    'tin' => 'required',
                    'specialization_area' => 'required',
                    'years_experience' => 'required|integer',
                    'address' => 'required',
                ], $messages);
            default : break;
        }
    }

    /**
     * Display a listing of the resource.
     *
     * @return Response
     */
    public function index()
    {
        $contractors = Contractor::orderBy('contractor')->get();
        return view('contractors.index', compact('contractors'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return Response
     */
    public function create()
    {
        return view('contractors.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  Request  $request
     * @return Response
     */
    public function store(Request $request)
    {
        $inputs = $request->all();
        //Validate Request Inputs
        $validator = $this->validator($inputs);

        if ($validator->fails())
        {
            $this->setFlashMessage('  Error!!! You have error(s) while filling the form.', 2);
            return redirect('contractors/create')->withErrors($validator)->withInput();
        }
        // Store the Contractor...
        $contractor = Contractor::create($inputs);
        if($contractor)
        {
            // Set the flash message
            $this->setFlashMessage('  Saved!!! '.$contractor->contractor.' have successfully been added.', 1);
            // redirect to the create new warder page
            return redirect('contractors');
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  Contractor $contractor
     * @return Response
     */
    public function show(Contractor $contractor)
    {
        return view('contractors.show', compact('contractor'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  Contractor $contractor
     * @return Response
     */
    public function edit(Contractor $contractor)
    {
        return view('contractors.edit', compact('contractor'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  Request  $request
     * @param  Contractor $contractor
     * @return Response
     */
    public function update(Request $request, Contractor $contractor)
    {
        $contractorId = $contractor->contractor_id;
        $inputs = $request->all();
        //Validate Request Inputs
        $validator = $this->validator($inputs, $contractorId);

        if ($validator->fails())
        {
            $id = $this->getHashIds()->encode($contractorId);
            $this->setFlashMessage('  Error!!! You have error(s) while filling the form.', 2);
            return redirect('contractors/'.$id.'/edit')->withErrors($validator)->withInput();
        }
        // Update the Contractor...
        $saved = $contractor->update($inputs);
        if($saved)
        {
            // Set the flash message
            $this->setFlashMessage('  Updated!!! '.$contractor->contractor.' have successfully been updated.', 1);
            // redirect to the list of Contractors page
            return redirect('contractors');
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return Response
     */
    public function destroy($id)
    {
        $contractor = Contractor::findOrFail($id);
        //Delete The Contractor Record
        $delete = ($contractor !== null) ? $contractor->delete() : null;

        if($delete){
            $this->setFlashMessage('Deleted!!! '.$contractor->contractor.' have been removed.', 1);
        }else{
            $this->setFlashMessage('Error!!! Unable to delete record.', 2);
        }
    }

    /**
     *  Show the projects handled by the contractor
     * @param String $encoded_id
     * @return Response
     */
    public function projects($encoded_id)
    {
        $decodeId = $this->getHashIds()->decode($encoded_id);
        $contractor = (empty($decodeId)) ? abort(304) : Contractor::findOrFail($decodeId[0]);

        $projects = (empty($contractor)) ? null : $contractor->projects()->get();
        return view('contractors.projects', compact('projects'));
    }
}
