<?php

namespace App\Http\Controllers;

use App\Models\Legislative\FederalRepresentative;
use App\Models\MasterRecords\House;
use App\Models\MasterRecords\Rank;
use App\Models\State;
use App\User;
use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Controllers\Controller;

class FederalRepresentativesController extends Controller
{
    /**
     * Make sure the user is logged in
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Display a listing of the Federal Representatives for Master Records.
     * @return Response
     */
    public function getIndex()
    {
        $federal_reps = FederalRepresentative::orderBy('federal_rep_id')->get();
        $users = User::orderBy('first_name')->where('user_type_id', FederalRepresentative::USER_TYPE)->get();
        $states = State::orderBy('state')->lists('state', 'state_id')->put('', 'Nothing Selected');
        $ranks = Rank::orderBy('rank')->lists('rank', 'rank_id')->put('', 'Nothing Selected');
        $houses = House::orderBy('house')->lists('house', 'house_id')->put('', 'Nothing Selected');

        return view('legislatives.federal_reps.index', compact('ranks', 'houses', 'users', 'states', 'federal_reps'));
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

        for($i = 0; $i < count($inputs['federal_rep_id']); $i++){
            $federal_rep = ($inputs['federal_rep_id'][$i] > 0) ? FederalRepresentative::find($inputs['federal_rep_id'][$i]) : new FederalRepresentative();
            $federal_rep->user_id = $inputs['user_id'][$i];
            $federal_rep->federal_constituency_id = $inputs['federal_constituency_id'][$i];
            $federal_rep->rank_id = $inputs['rank_id'][$i];
            $federal_rep->house_id = $inputs['house_id'][$i];
            $count = ($federal_rep->save()) ? $count+1 : '';
        }
        // Set the flash message
        if($count > 0)
            $this->setFlashMessage($count . ' Federal Representatives has been successfully updated.', 1);
        // redirect to the create a new inmate page
        return redirect('/federal-reps');
    }

    /**
     * Delete a Menu from the list of Menus using a given menu id
     * @param $id
     */
    public function getDelete($id)
    {
        $federal_rep = FederalRepresentative::findOrFail($id);
        //Delete The Federal Representative Record
        $delete = ($federal_rep !== null) ? $federal_rep->delete() : null;

        if($delete){
            $this->setFlashMessage('  Deleted!!! Federal Representative '.$federal_rep->user()->first()->fullNames().' have been deleted.', 1);
        }else{
            $this->setFlashMessage('Error!!! Unable to delete record.', 2);
        }
    }

    /**
     * Get The Federal Reps. Given a state id
     * @param Request $request
     * @return \Illuminate\Http\RedirectResponse|\Illuminate\Routing\Redirector
     */
    public function postState(Request $request)
    {
        $inputs = $request->all();

        if($inputs['state_id'] === ''){
            $federal_reps = FederalRepresentative::orderBy('federal_rep_id')->get();
        }else{
            $state = State::findOrFail($inputs['state_id']);
            $federal_conts = $state->federalConstituencies()->lists('federal_constituency_id')->toArray();
            $federal_reps = FederalRepresentative::whereIn('federal_constituency_id', $federal_conts)->orderBy('federal_rep_id')->get();
        }

        $users = User::orderBy('first_name')->where('user_type_id', FederalRepresentative::USER_TYPE)->get();
        $states = State::orderBy('state')->lists('state', 'state_id')->put('', 'Nothing Selected');
        $ranks = Rank::orderBy('rank')->lists('rank', 'rank_id')->put('', 'Nothing Selected');
        $houses = House::orderBy('house')->lists('house', 'house_id')->put('', 'Nothing Selected');

        return view('legislatives.federal_reps.index', compact('ranks', 'houses', 'users', 'states', 'federal_reps'));
    }
}
