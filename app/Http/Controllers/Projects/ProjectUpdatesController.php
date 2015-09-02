<?php

namespace App\Http\Controllers\Projects;

use App\Models\Projects\Project;
use App\Models\Projects\ProjectComment;
use App\Models\Projects\ProjectUpdate;
use App\models\TimeLine;
use GrahamCampbell\Flysystem\Facades\Flysystem;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\File;

use App\Http\Requests;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;

class ProjectUpdatesController extends Controller
{
    /**
     * Make sure the user is logged in
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Get a validator for an incoming registration request.
     * @param  array  $data
     * @return \Illuminate\Contracts\Validation\Validator
     */
    protected function validator(array $data)
    {
        $messages = [
            'update_title.required' => 'Project Update Title is Required!',
            'update_picture.mimes' => 'Update Picture must be either jpeg, bmp or png!',
            'update_picture.max' => 'Update Picture must be a less than 1MB!',
        ];
        return Validator::make($data, [
            'update_title' => 'required|max:255',
            'update_picture' => 'mimes:jpeg,bmp,png|max:1024',
        ], $messages);
    }

    /**
     * Display a listing of the resource.
     * @param String $encodeId
     * @return Response
     */
    public function index($encodeId)
    {
        $decodeId = $this->getHashIds()->decode($encodeId);
        $project = (empty($decodeId)) ? abort(305) : Project::findOrFail($decodeId[0]);
        $updates = $project->updates()->orderBy('created_at', 'desc')->get();
        $project->likes = $this->likes($project->project_id, Project::OBJECT_TYPE_ID);
        $project->dislikes = $this->dislikes($project->project_id, Project::OBJECT_TYPE_ID);

        return view('projects.updates.index', compact('updates', 'project'));
    }

    /**
     * Update Threads on projects
     * @param Request $request
     * @return \Illuminate\Http\RedirectResponse|\Illuminate\Routing\Redirector
     */
    public function updateThread(Request $request)
    {
        $inputs = $request->all();
        $encodeId = $this->getHashIds()->encode($inputs['project_id']);
        //Validate Request Inputs
        $validator = $this->validator($inputs);
        if ($validator->fails())
        {
            $this->setFlashMessage('  Error!!! You have error(s) while filling the form.', 2);
            return redirect('/projects/timeline/' . $encodeId)->withErrors($validator)->withInput();
        }
        //Set the user as the update owner
        $inputs['user_id'] = Auth::user()->user_id;
        $project_update = ProjectUpdate::create($inputs);

        // Set the flash message
        if($project_update) {
            //Insert the project update id into the time line table
            TimeLine::create([
                'object_type_id'=>ProjectUpdate::OBJECT_TYPE_ID,
                'object_id'=>$project_update->project_update_id
            ]);

            if($request->hasFile('update_picture'))
            {
                $image = $project_update->project_update_id . '_update.' . $request->file('update_picture')->getClientOriginalExtension();
                $request->file('update_picture')->move(base_path() . '/public/' . $project_update->image_path . '/', $image);

                $file = File::get($project_update->image_path.$image);
                Flysystem::connection('awss3')->put($project_update->image_path.$image, $file);
                //Update File Path
                $project_update->update_picture = $image;
                $project_update->save();
            }
            $this->setFlashMessage(' Thread on project updates has been successful.', 1);
        }else{
            $this->setFlashMessage(' Error!!! Unable to update try again later.', 1);
        }
        // redirect to the create a new inmate page
        return redirect('/projects/timeline/' . $encodeId);
    }

    /**
     * Comments on Updates of Project Threads
     * @param Request $request
     * @return \Illuminate\Http\RedirectResponse|\Illuminate\Routing\Redirector
     */
    public function comment(Request $request)
    {
        $inputs = $request->all();
        $encodeId = $this->getHashIds()->encode($inputs['project_id']);
        //Set the user as the update owner
        $inputs['user_id'] = Auth::user()->user_id;
        $project_comment = ProjectComment::create($inputs);
        // Set the flash message
        ($project_comment)
            ? $this->setFlashMessage(' Thread on project updates has been successful.', 1)
            : $this->setFlashMessage(' Error!!! Unable to update try again later.', 1);
        // redirect to the create a new inmate page
        return redirect('/projects/timeline/' . $encodeId);
    }
}