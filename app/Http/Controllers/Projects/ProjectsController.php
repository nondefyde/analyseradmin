<?php

namespace App\Http\Controllers\Projects;

use App\Http\Controllers\Controller;
use App\Models\Projects\Beneficiary;
use App\Models\Projects\Domain;
use App\Models\Projects\Project;
use App\Models\Projects\Contractor;
use App\Models\Projects\ProjectSector;
use App\Models\Projects\ProjectSupervisor;
use App\Models\MasterRecords\Sector;
use App\Models\State;
use GrahamCampbell\Flysystem\Facades\Flysystem;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\File;

use App\Http\Requests;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Response;
use Illuminate\Support\Facades\Validator;

class ProjectsController extends Controller
{
    /**
     * Redirects To The Contractors Default Page
     * @var string
     */
    protected $redirectTo = '/projects';

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
     * @return \Illuminate\Contracts\Validation\Validator
     */
    protected function validator(array $data)
    {
        $method = $this->getRouter()->getCurrentRequest()->getMethod();
        $messages = [
            'title.required' => 'The Project Title is Required!',
            'contractor_id.required' => 'The Contractor Handling the Project is Required!',
            'sector_id.required' => 'The Project Sector(s) is Required!',
            'description.required' => 'The Project Description is Required!',
            'supervisor_id.required' => 'Project Project Supervisor(s) is Required!',
            'sector.required' => 'The Project Sector is Required!',
            'purpose.required' => 'Purpose of the Project is Required!',
            'mou.required' => 'Memorandum of Understanding is Required!',
            'mou.mimes' => 'Memorandum of Understanding must be a PDF file!',
            'mou.max' => 'Memorandum of Understanding file must be a less than 5MB!',
            'award_letter.required' => 'Contract Award Letter is Required!',
            'award_letter.mimes' => 'Contract Award Letter  must be a PDF file!',
            'award_letter.max' => 'Contract Award Letter file must be a less than 5MB!',
            'started_on.required' => 'Project Start Date is Required!',
            'expected_on.required' => 'Proposed Completion Date of Project is Required!'
        ];
        switch($method)
        {
            case 'GET' :
            case 'DELETE' : return [];
            case 'POST' :
                return Validator::make($data, [
                    'title' => 'required',
                    'contractor_id' => 'required',
                    'sector_id' => 'required',
                    'started_on' => 'required',
                    'expected_on' => 'required',
                    'award_letter' => 'required|mimes:pdf|max:5120',
                    'mou' => 'required|mimes:pdf|max:5120',
                    'supervisor_id' => 'required',
                    'description' => 'required',
                    'purpose' => 'required',
                ], $messages);
            case 'PUT' :
            case 'PATCH' :
            return Validator::make($data, [
                'title' => 'required',
                'contractor_id' => 'required',
                'sector_id' => 'required',
                'started_on' => 'required',
                'expected_on' => 'required',
                'supervisor_id' => 'required',
                'description' => 'required',
                'purpose' => 'required',
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
        $projects = Project::where('status_id', 1)->where('user_id', Auth::user()->user_id)->orderBy('created_at')->get();
        $contractors = Contractor::orderBy('contractor')->get();

        return view('projects.index', compact('projects', 'contractors'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return Response
     */
    public function create()
    {
        $contractors = Contractor::orderBy('contractor')->get();
        $sectors = Sector::orderBy('sector')->get();
        $supervisors = Auth::user()->subUsers()->get();

        return view('projects.create', compact('contractors', 'sectors', 'supervisors'));
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
            return redirect('projects/create')->withErrors($validator)->withInput();
        }
        // Store the Contractor...
        $inputs['user_id'] = Auth::user()->user_id;
        $project = Project::create($inputs);
        if($project)
        {
            //Insert the selected sectors
            $sectors = $inputs['sector_id'];
            foreach($sectors as $sector){
                $project->sectors()->attach($sector);
            }
            //Insert the selected supervisors
            $supervisors = $inputs['supervisor_id'];
            foreach($supervisors as $supervisor){
                $project->supervisors()->attach($supervisor);
            }
            //upload the pdf files if available
            if($request->hasFile('mou') and $request->hasFile('award_letter'))
            {
                $fileMou = $project->project_id . '_mou.' . $request->file('mou')->getClientOriginalExtension();
                $fileAward = $project->project_id . '_award_letter.' . $request->file('award_letter')->getClientOriginalExtension();
                $request->file('mou')->move(base_path() . '/public/' . $project->file_path . '/mou/', $fileMou);
                $request->file('award_letter')->move(base_path() . '/public/' . $project->file_path . '/award_letter/', $fileAward);
                //Update File Path

                $mou_file = File::get($project->file_path.$fileMou);
                Flysystem::connection('awss3')->put($project->file_path.$fileMou, $mou_file);

                $award_file = File::get($project->file_path.$fileAward);
                Flysystem::connection('awss3')->put($project->file_path.$fileAward, $award_file);


                $project->mou = '/mou/'.$fileMou;
                $project->award_letter = '/award_letter/'.$fileAward;
                $project->save();
            }
            // Set the flash message
            $this->setFlashMessage('  Saved!!! '.$project->title.' have successfully been added.', 1);
            // redirect to the create new warder page
            return redirect('projects');
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  Project $project
     * @return Response
     */
    public function show(Project $project)
    {
        $project->likes = $this->likes($project->project_id, Project::OBJECT_TYPE_ID);
        $project->dislikes = $this->dislikes($project->project_id, Project::OBJECT_TYPE_ID);

        return view('projects.show', compact('project'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  Project $project
     * @return Response
     */
    public function edit(Project $project)
    {
        $contractors = Contractor::orderBy('contractor')->get();
        $sectors = Sector::orderBy('sector')->get();
        $supervisors = Auth::user()->subUsers()->get();
        $project_sectors = ProjectSector::where('project_id', $project->project_id)->lists('sector_id')->toArray();
        $project_supervisors = ProjectSupervisor::where('project_id', $project->project_id)->lists('supervisor_id')->toArray();

        return view('projects.edit', compact('project', 'contractors', 'sectors', 'project_sectors', 'supervisors', 'project_supervisors'));
    }

    /**
     * Update the specified resource in storage.
     * @param Request $request
     * @param Project $project
     * @return Response
     */
    public function update(Project $project, Request $request)
    {
        $projectId = $project->project_id;
        $inputs = $request->all();
        //Validate Request Inputs
        $validator = $this->validator($inputs);

        if ($validator->fails())
        {
            $id = $this->getHashIds()->encode($projectId);
            $this->setFlashMessage('  Error!!! You have error(s) while filling the form.', 2);
            return redirect('projects/'.$id.'/edit')->withErrors($validator)->withInput();
        }
        // Update the Project...
        $saved = $project->update($inputs);
        if($saved)
        {
            //Sync all the sectors to the project
            $project->sectors()->sync($inputs['sector_id']);

            //Sync all the supervisors of the project
            $project->supervisors()->sync($inputs['supervisor_id']);

            if($request->hasFile('mou'))
            {
                $fileMou = $projectId . '_mou.' . $request->file('mou')->getClientOriginalExtension();
                $request->file('mou')->move(base_path() . '/public' . $project->file_path . '/mou/', $fileMou);
                //Update File Path
                $project->mou = '/mou/'.$fileMou;

                $mou_file = File::get($project->file_path.$fileMou);
                Flysystem::connection('awss3')->put($project->file_path.$fileMou, $mou_file);

            }

            if($request->hasFile('award_letter'))
            {
                $fileAward = $projectId . '_award_letter.' . $request->file('award_letter')->getClientOriginalExtension();
                $request->file('award_letter')->move(base_path() . '/public' . $project->file_path . '/award_letter/', $fileAward);
                //Update File Path
                $project->award_letter = '/award_letter/'.$fileAward;

                $award_file = File::get($project->file_path.$fileAward);
                Flysystem::connection('awss3')->put($project->file_path.$fileAward, $award_file);
            }

            $project->save();
            // Set the flash message
            $this->setFlashMessage('  Updated!!! '.$project->title.' have successfully been updated.', 1);
            // redirect to the create new warder page
            return redirect('projects');
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
        //
    }

    /**
     * Archive the project by disabling the status = 2
     * @param  int  $id
     * @return Response
     */
    public function archive($id)
    {
        $project = Project::findOrFail($id);
        //Remove The Project Record
        if($project !== null) {
            $project->status_id = 0;
            //Save The Project
            ($project->save())
                ? $this->setFlashMessage(' Removed!!! '.$project->title.' Project have been removed.', 1)
                : $this->setFlashMessage('Error!!! Unable to Remove record.', 2);
        }
    }

    /**
     * Publish or Unpublish a project to or from time line publish : 1, unpublish : 0
     * @param  int  $id
     * @param  int  $publish_id
     * @return Response
     */
    public function publish($id, $publish_id)
    {
        $project = Project::findOrFail($id);
        if($project !== null) {
            $project->publish_id = $publish_id;
            //Save The Project
            if($project->save()){
                ($publish_id === '1')
                    ? $this->setFlashMessage(' Published!!! '.$project->title.' Project have been published.', 1)
                    : $this->setFlashMessage(' Unpublished!!! '.$project->title.' Project have been unpublished.', 1);
            }else{
                $this->setFlashMessage('Error!!! Unable to perform task try again.', 2);
            }

        }
    }

    /**
     *  Show the contractor handling the project
     * @param String $encoded_id
     * @return Response
     */
    public function contractor($encoded_id)
    {
        $decodeId = $this->getHashIds()->decode($encoded_id);
        $contractor = (empty($decodeId)) ? abort(304) : Contractor::findOrFail($decodeId[0]);

        return view('projects.contractor', compact('contractor'));
    }

    /**
     *  Show the domains the project belongs to
     * @param String $encoded_id
     * @return Response
     */
    public function domain($encoded_id)
    {
        $decodeId = $this->getHashIds()->decode($encoded_id);
        $project = (empty($decodeId)) ? abort(304) : Project::findOrFail($decodeId[0]);
        $states = State::orderBy('state')->get();
        $domains = $project->domains()->get();

        return view('projects.domain.index', compact('states', 'domains', 'project'));
    }

    /**
     *  store the domains the project belongs to
     * @param Request $request
     * @return Response
     */
    public function saveDomain(Request $request)
    {
        $inputs = $request->all();
        $count = 0;
        $project_id = $inputs['project_id'];
        $encodeId = $this->getHashIds()->encode($project_id);

        for($i = 0; $i < count($inputs['domain_id']); $i++){
            $domain = ($inputs['domain_id'][$i] > 0) ? Domain::find($inputs['domain_id'][$i]) : new Domain();
            $domain->town = $inputs['town'][$i];
            $domain->lga_id = $inputs['lga_id'][$i];
            $domain->location_address = $inputs['location_address'][$i];
            $domain->project_id = $project_id;
            $count = ($domain->save()) ? $count+1 : '';
        }
        // Set the flash message
        if($count > 0)
            $this->setFlashMessage($count . ' Domain(s) has been successfully updated.', 1);

        return redirect('/projects/domain/' . $encodeId);
    }

    /**
     * Delete a Domain from the list of Project Domains using a given project id
     * @param $project_id
     * @param $id
     * @return Response
     */
    public function deleteDomain($id, $project_id){
        $domain = Domain::findOrFail($id);
        //Delete The Beneficiary Record
        $delete = ($domain !== null) ? $domain->delete() : null;

        if($delete){
            $this->setFlashMessage('  Deleted!!! '.$domain->town.' domain have been deleted.', 1);
        }else{
            $this->setFlashMessage('Error!!! Unable to delete record.', 2);
        }
        return $this->getHashIds()->encode($project_id);
    }

    /**
     *  Show the beneficiaries the project belongs to
     * @param String $encoded_id
     * @return Response
     */
    public function beneficiary($encoded_id)
    {
        $decodeId = $this->getHashIds()->decode($encoded_id);
        $project = (empty($decodeId)) ? abort(304) : Project::findOrFail($decodeId[0]);
        $beneficiaries = $project->beneficiaries()->get();

        return view('projects.beneficiary.index', compact('beneficiaries', 'project'));
    }

    /**
     *  store the beneficiaries the project belongs to
     * @param Request $request
     * @return Response
     */
    public function saveBeneficiary(Request $request)
    {
        $inputs = $request->all();
        $count = 0;
        $project_id = $inputs['project_id'];
        $encodeId = $this->getHashIds()->encode($project_id);

        for($i = 0; $i < count($inputs['beneficiary_id']); $i++){
            $beneficiary = ($inputs['beneficiary_id'][$i] > 0) ? Beneficiary::find($inputs['beneficiary_id'][$i]) : new Beneficiary();
            $beneficiary->name = $inputs['name'][$i];
            $beneficiary->address = $inputs['address'][$i];
            $beneficiary->project_id = $project_id;
            $count = ($beneficiary->save()) ? $count+1 : '';
        }
        // Set the flash message
        if($count > 0)
            $this->setFlashMessage($count . ' Beneficiaries has been successfully updated.', 1);

        return redirect('/projects/beneficiary/' . $encodeId);
    }

    /**
     * Delete a Beneficiary from the list of Project Beneficiaries using a given project id
     * @param $project_id
     * @param $id
     * @return Response
     */
    public function deleteBeneficiary($id, $project_id){
        $beneficiary = Beneficiary::findOrFail($id);
        //Delete The Beneficiary Record
        $delete = ($beneficiary !== null) ? $beneficiary->delete() : null;

        if($delete){
            $this->setFlashMessage('  Deleted!!! '.$beneficiary->name.' beneficiary have been deleted.', 1);
        }else{
            $this->setFlashMessage('Error!!! Unable to delete record.', 2);
        }
        return $this->getHashIds()->encode($project_id);
    }
}