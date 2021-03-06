<?php

namespace App\Http\Controllers\MasterRecords;

use App\Models\MasterRecords\UserType;
use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Controllers\Controller;

class UserTypeController extends Controller
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
     * Display a listing of the resource.
     *
     * @return Response
     */
    public function getIndex()
    {
        $user_types = UserType::all();
        return view('records.user-types.index', compact('user_types'));
    }

    /**
     * Insert or Update the user type records
     * @param Request $request
     * @return \Illuminate\Http\RedirectResponse|\Illuminate\Routing\Redirector
     */
    public function postIndex(Request $request)
    {
        $inputs = $request->all();
        $count = 0;

        for($i = 0; $i < count($inputs['user_type_id']); $i++){
            $user_type = ($inputs['user_type_id'][$i] > 0) ? UserType::find($inputs['user_type_id'][$i]) : new UserType();
            $user_type->user_type = $inputs['user_type'][$i];
            $count = ($user_type->save()) ? $count+1 : '';
        }
        // Set the flash message
        if($count > 0)
            $this->setFlashMessage($count . ' User Type has been successfully updated.', 1);
        // redirect to the create a new inmate page
        return redirect('/user-types');
    }

    /**
     * Delete a User type from the list of user Tyeps using a given menu id
     * @param $id
     */
    public function getDelete($id)
    {
        $user_type = UserType::findOrFail($id);
        //Delete The Warder Record
        $delete = ($user_type !== null) ? $user_type->delete() : null;

        if($delete){
            //Delete its Equivalent Users Record
            $this->setFlashMessage('  Deleted!!! '.$user_type->user_type.' menu have been deleted.', 1);
        }else{
            $this->setFlashMessage('Error!!! Unable to delete record.', 2);
        }
    }
}
