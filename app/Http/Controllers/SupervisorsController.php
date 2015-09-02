<?php

namespace App\Http\Controllers;

use App\Models\Projects\ProjectSupervisor;
use App\Models\SubUser;
use App\User;
use Illuminate\Support\Facades\Hash;
use Illuminate\Http\Request;

use App\Http\Requests;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Mail;
use Response;
use Validator;

class SupervisorsController extends Controller
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
     *
     * @param  array  $data
     * @return \Illuminate\Contracts\Validation\Validator
     */
    protected function validator(array $data)
    {
        $messages = [
            'first_name.required' => 'The First Name is Required!',
            'last_name.required' => 'The Last Name is Required!',
            'phone_no.required' => 'Phone Number is Required!',
            'email.required' => 'Supervisor e-mail Address is Required!',
            'email.email' => 'A Valid e-mail Address is Required!',
        ];
        return Validator::make($data, [
            'first_name' => 'required|max:100|min:2',
            'last_name' => 'required|max:100|min:2',
            'phone_no' => 'required|min:10',
            'email' => 'required|email|max:255|unique:users,email',
        ], $messages);
    }
    /**
     * Display a listing of the resource.
     *
     * @return Response
     */
    public function getIndex()
    {
        $subUsers = Auth::user()->subUsers()->get();
        return view('supervisors.index',compact('subUsers'));
    }

    /**
     * Display a listing of the resource.
     *
     * @return Response
     */
    public function getCreate()
    {
        return view('supervisors.create');
    }

    /**
     * create a new sub user as supervisor
     * @param Request $request
     * @return \Illuminate\Http\RedirectResponse|\Illuminate\Routing\Redirector
     */
    public function postCreate(Request $request)
    {
        $inputs = $request->all();
        if ($this->validator($inputs)->fails())
        {
            $this->setFlashMessage('Error!!! You have error(s) while filling the form.', 2);
            return redirect('/supervisors/create')->withErrors($this->validator($inputs))->withInput();
        }
        //Set the verification code to any random 40 characters and password to random 8 characters
        $verification_code = str_random(40);
        $password = str_random(8);
        $inputs['verification_code'] = $verification_code;
        $inputs['password'] = $password; $temp = '.';
        // Store the User...
        $user = $this->newUser($inputs);
        ///////////////////////////////////////////////////////// mail sending using $user object ///////////////////////////////////////////
        if($user){
            //Verification Mail Sending
            $content = 'Welcome to analyzer application, kindly click on the verify link below to complete your registration. Thank You';
            $content .= "Here are your credentials <br> Username: <strong>" . $user->email . "</strong> <br>";
            $content .= "Password: <strong>" . $password . "</strong> ";
            $result = Mail::send('emails.verification', ['user'=>$user, 'content'=>$content], function($message) use($user) {
                $message->from(env('APP_MAIL'), env('APP_NAME'));
                $message->subject("Account Verification");
                $message->to($user->email);
            });
            if($result) $temp = ' and a mail has been sent to '.$user->email;
        }
        if($user){
            SubUser::create(['parent_user_id'=>Auth::user()->user_id, 'child_user_id'=>$user->user_id]);
            // Set the flash message
            $this->setFlashMessage(' Saved!!! Supervisor '.$user->fullNames().' have successfully been added'.$temp, 1);
            // redirect to the create new warder page
            return redirect('/supervisors');
        }
    }

    /**
     * Displays the supervisors profiles details
     * @param String $encodeId
     * @return \Illuminate\View\View
     */
    public function getShow($encodeId)
    {
        $decodeId = $this->getHashIds()->decode($encodeId);
        $user = (empty($decodeId)) ? abort(305) : User::findOrFail($decodeId[0]);
        $type = 'Supervisor';
        return view('profiles.show', compact('user', 'type'));
    }

    /**
     * delete supervisor user and its equivalent sub users record
     * @param  int  $id
     * @return Response
     */
    public function getDelete($id)
    {
        $subUser = SubUser::findOrFail($id);
        //Delete The Supervisors Record
        $deletedSubUser = ($subUser !== null) ? $subUser->delete() : null;
        //Remove The equivalent Users Record
        if($deletedSubUser) {
            $User = User::findOrFail($subUser->child_user_id);
            $deletedUser = ($User !== null) ? $User->delete() : null;
            ($deletedUser)
                ? $this->setFlashMessage(' Removed!!! Supervisor '.$User->fullNames().' have been removed.', 1)
                : $this->setFlashMessage('Error!!! Unable to Remove record.', 2);
        }
    }

    /**
     * Enable or Disable a Supervisor Enable : 1, Disable : 0
     * @param  int  $user_id
     * @param  int  $status
     * @return Response
     */
    public function getStatus($user_id, $status)
    {
        $user = User::findOrFail($user_id);
        if($user !== null) {
            $user->status = $status;
            //Update the Supervisor User Status
            if($user->save()){
                ($status === '1')
                    ? $this->setFlashMessage(' Enabled!!! '.$user->fullNames().' Supervisor have been enabled.', 1)
                    : $this->setFlashMessage(' Disabled!!! '.$user->fullNames().' Supervisor have been disabled.', 1);
            }else{
                $this->setFlashMessage('Error!!! Unable to perform task try again.', 2);
            }

        }
    }

    /**
     * Display a listing of the resource.
     *
     * @return Response
     */
    public function getProjects()
    {
        $projectSupervisors = ProjectSupervisor::where('supervisor_id', Auth::user()->user_id)->get();
//        dd($projectSupervisors);
        return view('supervisors.projects', compact('projectSupervisors'));
    }

    /**
     * Create a new user instance after a valid registration.
     * @param  array  $data
     * @return User
     */
    private function newUser(array $data)
    {
        return User::create([
            'email' => $data['email'],
            'password' => Hash::make($data['password']),
            'first_name' => $data['first_name'],
            'last_name' => $data['last_name'],
            'phone_no' => $data['phone_no'],
            'user_type_id' => SubUser::USER_TYPE,
            'verification_code' => $data['verification_code']
        ]);
    }
}