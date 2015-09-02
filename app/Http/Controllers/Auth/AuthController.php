<?php

namespace App\Http\Controllers\Auth;

use App\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Mail;
use Validator;
use Illuminate\Support\Facades\Hash;
use App\Http\Controllers\Controller;
use Illuminate\Foundation\Auth\ThrottlesLogins;
use Illuminate\Foundation\Auth\AuthenticatesAndRegistersUsers;

class AuthController extends Controller
{

    /*
    |--------------------------------------------------------------------------
    | Registration & Login Controller
    |--------------------------------------------------------------------------
    |
    | This controller handles the registration of new users, as well as the
    | authentication of existing users. By default, this controller uses
    | a simple trait to add these behaviors. Why don't you explore it?
    |
    */

    use AuthenticatesAndRegistersUsers, ThrottlesLogins;

    protected $redirectTo = '/';

    /**
     * Create a nw authentication controller instance.
     */
    public function __construct()
    {
        $this->middleware('guest', ['except' => 'getLogout']);

        $this->middleware('auth', ['except' => ['getLogin', 'postLogin', 'getVerify', 'getResetPassword', 'postResetPassword']]);
    }

    /**
     * Get a validator for an incoming registration request.
     *
     * @param  array  $data
     * @return \Illuminate\Contracts\Validation\Validator
     */
    protected function validator(array $data)
    {
        return Validator::make($data, [
            'email' => 'required|email|max:255|unique:users',
            'password' => 'required|confirmed|min:6',
        ]);
    }

    /**
     * Create a new user instance after a valid registration.
     *
     * @param  array  $data
     * @return User
     */
    protected function create(array $data)
    {
        return User::create([
            'email' => $data['email'],
            'password' => Hash::make('password'),
            'user_type_id' => $data['user_type_id'],
            'verification_code' => $data['verification_code']
        ]);
    }

    /**
     * Verify the uses email and log them in
     * @param $user_id
     * @param $verification_code
     * @return \Illuminate\Http\RedirectResponse|\Illuminate\Routing\Redirector
     */
    public function getVerify($user_id, $verification_code){
        $hashIds = $this->getHashIds();
        $user = User::findOrFail($hashIds->decode($user_id))->first();

        if($user and ($user->verification_code === $verification_code)){
            $user->verified = 1;
            if($user->save()){
                Auth::login($user);
                $this->setFlashMessage(' Verification Completed!!! <strong>Important!</strong> Update your profile to enjoy the full features of the Analyser.', 1);
                return redirect('/profiles');
            }
        }else{
            $this->setFlashMessage(' Invalid Registration Verification Attempt!!!', 2);
        }
    }

    /**
     * Show the application reset password form.
     *
     * @return \Illuminate\Http\Response
     */
    public function getResetPassword()
    {
        return view('auth.reset-password');
    }

    /**
     * Handle a registration request for the application.
     * @param  Request  $request
     * @return \Illuminate\Http\Response
     */
    public function postResetPassword(Request $request)
    {
        $inputs = $request->all();

        $validator = Validator::make($inputs, [
            'email' => 'required|email'
        ], ['email.required' => 'An E-Mail Address is Required!', 'email.email' => 'A Valid E-Mail Address is Required!!']);

        if ($validator->fails())
        {
            $this->setFlashMessage('Error!!! You have error(s) while filling the form.', 2);
            return redirect('/auth/reset-password')->withErrors($this->validator($inputs))->withInput();
        }
        //////////////////////////////////////////////////////////////////////// starts: KHEENGZ CUSTOM CODE////////////////////////////////////////////////////////
        //Set the verification code to any random 40 characters
        $password = str_random(8);
        $result = User::where('email', $inputs['email']);
        $user = ($result !== null) ? $result->first() : null;

        if($user){
            $user->password = Hash::make($password);
            if($user->save()) {
                //Password Reset Mail Sending
                $content = "Welcome to analyzer application, kindly login to the link below to access the application. Thank You \n";
                $content .= "Here is your new password: <strong>" . $password . "</strong> ";
                $result = Mail::send('emails.reset', ['user' => $user, 'content' => $content], function ($message) use ($user) {
                    $message->from(env('APP_MAIL'), env('APP_NAME'));
                    $message->subject("Password Reset");
                    $message->to($user->email);
                });
                if($result)
                    $this->setFlashMessage(' Reset Successful!!! Your Password has been reset' . ' kindly login to ' . $user->email . ' to view your new password', 1);
            }
            return redirect('/auth/login');
        }else{
            $this->setFlashMessage(' Failed!!! Reset was not successful with this email '.$inputs['email'] . ' kindly enter your registered email', 2);
            return redirect('/auth/reset-password');
        }
        ///////////////////////////////////////////////////////////////////////// ends: KHEENGZ CUSTOM CODE////////////////////////////////////////////////////////
    }
}
