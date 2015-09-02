<?php

namespace App\Http\Controllers\MasterRecords;

use App\Models\MasterRecords\Rank;
use App\Models\MasterRecords\UserType;
use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Controllers\Controller;

class RankController extends Controller
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
     * Display a listing of the Ransk for Master Records.
     *
     * @return Response
     */
    public function getIndex()
    {
        $user_type_list = UserType::orderBy('user_type')->lists('user_type', 'user_type_id')->put('', 'Select User Type');
        $ranks = Rank::orderBy('rank_id')->get();

        return view('records.ranks.index', compact('ranks', 'user_type_list'));
    }

    /**
     * Insert or Update the menu items records
     * @param Request $request
     * @return \Illuminate\Http\RedirectResponse|\Illuminate\Routing\Redirector
     */
    public function postIndex(Request $request)
    {
        $inputs = $request->all();

//        dd($inputs);

        $count = 0;

        for($i = 0; $i < count($inputs['rank_id']); $i++){
            $rank = ($inputs['rank_id'][$i] > 0) ? Rank::find($inputs['rank_id'][$i]) : new Rank();
            $rank->rank = $inputs['rank'][$i];
            $rank->user_type_id = $inputs['user_type_id'][$i];
            $count = ($rank->save()) ? $count+1 : '';
        }
        // Set the flash message
        if($count > 0)
            $this->setFlashMessage($count . ' Rank has been successfully updated.', 1);
        // redirect to the create a new inmate page
        return redirect('/ranks');
    }

    /**
     * Delete a Menu from the list of Menus using a given menu id
     * @param $id
     */
    public function getDelete($id)
    {
        $rank = Rank::findOrFail($id);
        //Delete The Warder Record
        $delete = ($rank !== null) ? $rank->delete() : null;

        if($delete){
            //Delete its Equivalent Users Record
            $this->setFlashMessage('  Deleted!!! '.$rank->rank.' rank have been deleted.', 1);
        }else{
            $this->setFlashMessage('Error!!! Unable to delete record.', 2);
        }
    }

    /**
     * Get The Menu Items Given a menu id
     * @param Request $request
     * @return \Illuminate\Http\RedirectResponse|\Illuminate\Routing\Redirector
     */
    public function postMenu(Request $request)
    {
        $inputs = $request->all();
        $user_type_list = UserType::orderBy('user_type')->lists('user_type', 'user_type_id')->put('', 'Select User Type');
        ($inputs['user_type_id'] === '')
            ?  $ranks = Rank::orderBy('rank_id', 'rank')->get()
            : $ranks = Rank::where('rank_id', $inputs['rank'])->orderBy('user_type_id', 'user_type')->get();

        return view('records.menu-items.index')->with(['ranks'=>$ranks, 'user_type_list'=>$user_type_list]);
    }
}
