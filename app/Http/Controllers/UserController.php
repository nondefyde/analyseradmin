<?php

namespace App\Http\Controllers;

use App\Models\MasterRecords\UserType;
use App\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Mail;
use Validator;
use Illuminate\Support\Facades\Auth;

use App\Http\Requests;
use App\Http\Controllers\Controller;

class UserController extends Controller
{
    /**
     * Redirects To The Inmates Default Page
     * @var string
     */
    protected $redirectTo = '/users';

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
        $messages = [
            'first_name.required' => 'The First Name is Required!',
            'last_name.required' => 'The Last Name is Required!',
            'user_type_id.required' => 'The User Type is Required!',
            'email.required' => 'A Valid E-Mail Address is Required!',
            'email.unique' => 'This E-Mail Address Has Been Taken or Assigned Already!',
        ];
        return Validator::make($data, [
            'first_name' => 'required|max:100|min:2',
            'last_name' => 'required|max:100|min:2',
            'email' => 'required|email|max:255|unique:users,email',
            'user_type_id' => 'required',
        ], $messages);
    }

    /**
     * Display a listing of the Users.
     *
     * @return Response
     */
    public function index()
    {
        $users = User::all();
        return view('users.index', compact('users'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return Response
     */
    public function getCreate()
    {
        $user_types = UserType::all();
        return view('users.create', compact('user_types'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  Request  $request
     * @return Response
     */
    public function postCreate(Request $request)
    {
        $input = $request->all();
        //Validate Request Inputs
        if ($this->validator($input)->fails())
        {
            $this->setFlashMessage('Error!!! You have error(s) while filling the form.', 2);
            return redirect('users/create')->withErrors($this->validator($input))->withInput();
        }
        //Set the verification code to any random 40 characters and password to random 8 characters
        $verification_code = str_random(40);
        $password = str_random(8);
        $input['verification_code'] = $verification_code;
        $input['password'] = $password; $temp = '.';

        // Store the User...
        $user = $this->newUser($input);
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
        // Set the flash message
        $this->setFlashMessage('Saved!!! '.$user->email.' have successfully been saved'.$temp, 1);
        // redirect to the create new warder page
        return redirect('users/create');
    }

    /**
     * Display the password change form
     * @return \Illuminate\View\View
     */
    public function getChange()
    {
        return view('users.change-password');
    }

    /**
     * Change password form via logged in user
     * @param Request $request
     * @return \Illuminate\Http\RedirectResponse
     */
    public function postChange(Request $request)
    {
        $user = Auth::user();

        //Validate if the password match the current password
        if (! Hash::check($request->password, $user->password) ) {
            return redirect('users/password-change')->withErrors([
                'password' => 'Warning!!! '.$user->first_name.', Your Old Password Credential did not match your current'
            ]);
        }
        if($request->password_confirmation !== $request->new_password){
            return redirect('users/change')->withErrors([
                'password' => 'Warning!!! '.$user->first_name.', Your New and Confirm Password Credential did not match'
            ]);
        }
//         Store the password...
        $user->fill(['password' => Hash::make($request->new_password)])->save();
        // Set the flash message
        $this->setFlashMessage('Changed!!! '.$user->first_name.' Your password change was successful.', 1);
        // redirect to the create a new inmate page
        return redirect('/');
    }

    /**
     * Create a new user instance after a valid registration.
     * @param  array  $data
     * @return User
     */
    protected function newUser(array $data)
    {
        return User::create([
            'email' => $data['email'],
            'password' => Hash::make($data['password']),
            'first_name' => $data['first_name'],
            'last_name' => $data['last_name'],
            'gender' => $data['gender'],
            'user_type_id' => $data['user_type_id'],
            'verification_code' => $data['verification_code']
        ]);
    }
}
