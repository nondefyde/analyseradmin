<?php

namespace App\Http\Controllers;

use App\Models\Legislative\StateRepresentative;
use App\Models\MasterRecords\House;
use App\Models\MasterRecords\Rank;
use App\Models\State;
use App\User;
use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Controllers\Controller;

class StateRepresentativesController extends Controller
{
    /**
     * Make sure the user is logged in
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Display a listing of the State Representatives for Master Records.
     * @return Response
     */
    public function getIndex()
    {
        $state_reps = StateRepresentative::orderBy('state_rep_id')->get();
        $users = User::orderBy('first_name')->where('user_type_id', StateRepresentative::USER_TYPE)->get();
        $states = State::orderBy('state')->lists('state', 'state_id')->put('', 'Nothing Selected');
        $ranks = Rank::orderBy('rank')->where('user_type_id', StateRepresentative::USER_TYPE)->lists('rank', 'rank_id')->put('', 'Nothing Selected');
        $houses = House::orderBy('house')->where('user_type_id', StateRepresentative::USER_TYPE)->lists('house', 'house_id')->put('', 'Nothing Selected');

        return view('legislatives.state_reps.index', compact('ranks', 'houses', 'users', 'states', 'state_reps'));
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

        for($i = 0; $i < count($inputs['state_rep_id']); $i++){
            $state_rep = ($inputs['state_rep_id'][$i] > 0) ? StateRepresentative::find($inputs['state_rep_id'][$i]) : new StateRepresentative();
            $state_rep->user_id = $inputs['user_id'][$i];
            $state_rep->state_constituency_id = $inputs['state_constituency_id'][$i];
            $state_rep->rank_id = $inputs['rank_id'][$i];
            $state_rep->house_id = $inputs['house_id'][$i];
            $count = ($state_rep->save()) ? $count+1 : '';
        }
        // Set the flash message
        if($count > 0)
            $this->setFlashMessage($count . ' State Representatives has been successfully updated.', 1);
        // redirect to the create a new inmate page
        return redirect('/state-reps');
    }

    /**
     * Delete a Menu from the list of Menus using a given menu id
     * @param $id
     */
    public function getDelete($id)
    {
        $state_rep = StateRepresentative::findOrFail($id);
        //Delete The State Representative Record
        $delete = ($state_rep !== null) ? $state_rep->delete() : null;

        if($delete){
            $this->setFlashMessage('  Deleted!!! State Representative '.$state_rep->user()->first()->fullNames().' have been deleted.', 1);
        }else{
            $this->setFlashMessage('Error!!! Unable to delete record.', 2);
        }
    }

    /**
     * Get The State Reps. Given a state id
     * @param Request $request
     * @return \Illuminate\Http\RedirectResponse|\Illuminate\Routing\Redirector
     */
    public function postState(Request $request)
    {
        $inputs = $request->all();

        if($inputs['state_id'] === ''){
            $state_reps = StateRepresentative::orderBy('state_rep_id')->get();
        }else{
            $state = State::findOrFail($inputs['state_id']);
            $state_conts = $state->stateConstituencies()->lists('state_constituency_id')->toArray();
            $state_reps = StateRepresentative::whereIn('state_constituency_id', $state_conts)->orderBy('state_rep_id')->get();
        }

        $users = User::orderBy('first_name')->where('user_type_id', StateRepresentative::USER_TYPE)->get();
        $states = State::orderBy('state')->lists('state', 'state_id')->put('', 'Nothing Selected');
        $ranks = Rank::orderBy('rank')->where('user_type_id', StateRepresentative::USER_TYPE)->lists('rank', 'rank_id')->put('', 'Nothing Selected');
        $houses = House::orderBy('house')->where('user_type_id', StateRepresentative::USER_TYPE)->lists('house', 'house_id')->put('', 'Nothing Selected');

        return view('legislatives.state_reps.index', compact('ranks', 'houses', 'users', 'states', 'state_reps'));
    }
}
