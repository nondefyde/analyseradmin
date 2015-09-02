<?php

namespace App\Http\Controllers;

use App\Models\Lga;
use App\Models\State;
use GrahamCampbell\Flysystem\Facades\Flysystem;
use Illuminate\Support\Facades\Response;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Hash;
use Illuminate\Http\Request;

use App\Http\Requests;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Input;
use Validator;
use Intervention\Image\Facades\Image;


class ProfilesController extends Controller
{
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
            'gender.required' => 'Gender is Required!',
            'dob.required' => 'Date of Birth is Required!',
            'phone_no.required' => 'Phone Number is Required!',
            'state_id.required' => 'State is Required!',
            'lga_id.required' => 'Local Government Area is Required!',
        ];
        return Validator::make($data, [
            'first_name' => 'required|max:100|min:2',
            'last_name' => 'required|max:100|min:2',
            'gender' => 'required',
            'dob' => 'required',
            'phone_no' => 'required|min:10',
            'state_id' => 'required',
            'lga_id' => 'required',
        ], $messages);
    }
    /**
     * Display a listing of the resource.
     *
     * @return Response
     */
    public function getIndex()
    {
        $states = State::orderBy('state')->lists('state', 'state_id')->put('', 'Nothing Selected');
        $lga = Auth::user()->lga()->first();
        $lgas = ($lga !== null) ? Lga::where('state_id', $lga->state_id)->lists('lga', 'lga_id')->put('', 'Nothing Selected') : null;

        return view('profiles.index', compact('states', 'lga', 'lgas'));
    }

    /**
     * Update the users profile
     * @param Request $request
     * @return \Illuminate\Http\RedirectResponse|\Illuminate\Routing\Redirector
     */
    public function postIndex(Request $request)
    {
        $inputs = $request->all();
        $user = Auth::user();

        if ($this->validator($inputs)->fails())
        {
            $this->setFlashMessage('Error!!! You have error(s) while filling the form.', 2);
            return redirect('/profiles')->withErrors($this->validator($inputs))->withInput();
        }
        $update = $user->update($inputs);
        if($update) {
            $this->setFlashMessage(' Your profile has been successfully updated.', 1);
            // redirect to the create a new inmate page
            return redirect('/profiles');
        }
    }

    /**
     * Displays the user profiles details
     * @return \Illuminate\View\View
     */
    public function getShow()
    {
        $user = Auth::user();
        $type = 'Profile';
        return view('profiles.show', compact('user', 'type'));
    }

    /**
     * Change password of logged in user via profile modal
     * @param Request $request
     * @return \Illuminate\Http\RedirectResponse
     */
    public function postChange(Request $request)
    {
        $user = Auth::user();
        $output = array();
        $output['status'] = 0;

        //Validate if the password match the current password
        if (! Hash::check($request->password, $user->password) ) {
            $output['msg'] = 'Warning!!! '.$user->first_name.', Your Old Password Credential did not match your current';
        //validate if the new and confirm password match
        }elseif($request->password_confirmation !== $request->new_password){
            $output['msg'] = 'Warning!!! '.$user->first_name.', Your New and Confirm Password Credential did not match';
        //Store the password...
        }else{
            $user->fill(['password' => Hash::make($request->new_password)])->save();
            $output['status'] = 1;
            $output['msg'] = 'Changed!!! '.$user->username.' Your password change was successful.';
        }
        return Response::json($output);
    }

    /**
     * This will be usedto upload profile imahege of the user
     *
     * @return mixed
     */
    public function postUploadPicture()
    {
        $file = Input::file('file');

        if (!is_null($file)) {

            $filename = $file->getClientOriginalName();
            $img_ext = strtolower(pathinfo($filename, PATHINFO_EXTENSION));

            $user = Auth::user();
            $destinationPath = 'uploads/avartars/';
            $user->avatar = $destinationPath . '' . $user->user_id . '_avartar.' . $img_ext;
            Input::file('file')->move($destinationPath, $user->user_id . '_avartar.' . $img_ext);

            $result = $user->save();
            if ($result) {
                return '<div class="cropping-image-wrap"><img src="/'.$user->avatar.'" class="img-thumbnail" id="crop_image"/></div>';
            } else {
                return '<div class="alert alert-danger">This format of image is not supported</div>';
            }
        } else {
            return '<div class="alert alert-danger">How did you do that?O_o</div>';
        }
    }


    /**
     *This is used to crop the iage before upload is done
     */
    public function postCropPicture()
    {
        $inputs = Input::all();

        $imgX = $inputs['ic_x'];
        $imgY = $inputs['ic_y'];
        $imgW = $inputs['ic_w'];
        $imgH = $inputs['ic_h'];

        $user = Auth::user();

        $file = File::get($user->avatar);
        $image = Image::make($file);

//        // crop image
        $image =  $image->crop($imgW, $imgH,$imgX,$imgY);
        $result = $image->save($user->avatar,60);

        if($result){
            $file = File::get($user->avatar);
            Flysystem::connection('awss3')->put($user->avatar,$file);
            return $user->avatar . '?'.time();
//            return $user->avatar;
        }
    }
}
