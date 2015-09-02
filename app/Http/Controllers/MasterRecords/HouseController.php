<?php

namespace App\Http\Controllers\MasterRecords;

use App\Models\MasterRecords\House;
use App\Models\MasterRecords\UserType;
use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Controllers\Controller;

class HouseController extends Controller
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
        $houses = House::orderBy('house_id')->get();

        return view('records.houses.index', compact('houses', 'user_type_list'));
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

        for($i = 0; $i < count($inputs['house_id']); $i++){
            $house = ($inputs['house_id'][$i] > 0) ? House::find($inputs['house_id'][$i]) : new House();
            $house->house = $inputs['house'][$i];
            $house->user_type_id = $inputs['user_type_id'][$i];
            $count = ($house->save()) ? $count+1 : '';
        }
        // Set the flash message
        if($count > 0)
            $this->setFlashMessage($count . ' house has been successfully updated.', 1);
        // redirect to the create a new inmate page
        return redirect('/houses');
    }

    /**
     * Delete a Menu from the list of Menus using a given menu id
     * @param $id
     */
    public function getDelete($id)
    {
        $house = House::findOrFail($id);
        //Delete The Warder Record
        $delete = ($house !== null) ? $house->delete() : null;

        if($delete){
            //Delete its Equivalent Users Record
            $this->setFlashMessage('  Deleted!!! '.$house->house.' house have been deleted.', 1);
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
            ?  $houses = House::orderBy('house_id', 'house')->get()
            : $houses = House::where('house_id', $inputs['house'])->orderBy('user_type_id', 'user_type')->get();

        return view('records.menu-items.index')->with(['houses'=>$houses, 'user_type_list'=>$user_type_list]);
    }
}
