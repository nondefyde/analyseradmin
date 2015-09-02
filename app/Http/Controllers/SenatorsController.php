<?php

namespace App\Http\Controllers;

use App\Models\Legislative\Senator;
use App\Models\MasterRecords\House;
use App\Models\MasterRecords\Rank;
use App\Models\State;
use App\User;
use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Controllers\Controller;

class SenatorsController extends Controller
{
    /**
     * Make sure the user is logged in
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Display a listing of the Senator for Master Records.
     *
     * @return Response
     */
    public function getIndex()
    {
        $senators = Senator::orderBy('senator_id')->get();
        $users = User::orderBy('first_name')->where('user_type_id', Senator::USER_TYPE)->get();
        $states = State::orderBy('state')->lists('state', 'state_id')->put('', 'Nothing Selected');
        $ranks = Rank::orderBy('rank')->lists('rank', 'rank_id')->put('', 'Nothing Selected');
        $houses = House::orderBy('house')->lists('house', 'house_id')->put('', 'Nothing Selected');

        return view('legislatives.senators.index', compact('ranks', 'houses', 'users', 'states', 'senators'));
    }


    /**
     * Insert or Update the senator records
     * @param Request $request
     * @return \Illuminate\Http\RedirectResponse|\Illuminate\Routing\Redirector
     */
    public function postIndex(Request $request)
    {
        $inputs = $request->all();
        $count = 0;

        for($i = 0; $i < count($inputs['senator_id']); $i++){
            $senator = ($inputs['senator_id'][$i] > 0) ? Senator::find($inputs['senator_id'][$i]) : new Senator();
            $senator->user_id = $inputs['user_id'][$i];
            $senator->senatorial_district_id = $inputs['senatorial_district_id'][$i];
            $senator->rank_id = $inputs['rank_id'][$i];
            $senator->house_id = $inputs['house_id'][$i];
            $count = ($senator->save()) ? $count+1 : '';
        }
        // Set the flash message
        if($count > 0)
            $this->setFlashMessage($count . ' Senators has been successfully updated.', 1);
        // redirect to the create a new inmate page
        return redirect('/senators');
    }

    /**
     * Delete a Menu from the list of Menus using a given menu id
     * @param $id
     */
    public function getDelete($id)
    {
        $senator = Senator::findOrFail($id);
        //Delete The Senator Record
        $delete = ($senator !== null) ? $senator->delete() : null;

        if($delete){
            $this->setFlashMessage('  Deleted!!! Senator '.$senator->user()->first()->fullNames().' have been deleted.', 1);
        }else{
            $this->setFlashMessage('Error!!! Unable to delete record.', 2);
        }
    }

    /**
     * Get The Senators Given a state id
     * @param Request $request
     * @return \Illuminate\Http\RedirectResponse|\Illuminate\Routing\Redirector
     */
    public function postState(Request $request)
    {
        $inputs = $request->all();

        if($inputs['state_id'] === ''){
            $senators = Senator::orderBy('senator_id')->get();
        }else{
            $state = State::findOrFail($inputs['state_id']);
            $districts = $state->districts()->lists('senatorial_district_id')->toArray();
            $senators = Senator::whereIn('senatorial_district_id', $districts)->orderBy('senator_id')->get();
        }
        $users = User::orderBy('first_name')->where('user_type_id', Senator::USER_TYPE)->get();
        $states = State::orderBy('state')->lists('state', 'state_id')->put('', 'Nothing Selected');
        $ranks = Rank::orderBy('rank')->lists('rank', 'rank_id')->put('', 'Nothing Selected');
        $houses = House::orderBy('house')->lists('house', 'house_id')->put('', 'Nothing Selected');

        return view('legislatives.senators.index', compact('ranks', 'houses', 'users', 'states', 'senators'));
    }
}
