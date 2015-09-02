<?php

namespace App\Http\Controllers\MasterRecords;

use App\Models\MasterRecords\Sector;
use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Controllers\Controller;

class SectorController extends Controller
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
        $sectors = Sector::all();
//        dd($sectors);
        return view('records.sectors.index', compact('sectors'));
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

        for($i = 0; $i < count($inputs['sector_id']); $i++){
            $sector = ($inputs['sector_id'][$i] > 0) ? Sector::find($inputs['sector_id'][$i]) : new Sector();
            $sector->sector = $inputs['sector'][$i];
            $count = ($sector->save()) ? $count+1 : '';
        }
        // Set the flash message
        if($count > 0)
            $this->setFlashMessage($count . ' Sector has been successfully updated.', 1);
        // redirect to the create a new inmate page
        return redirect('/sectors');
    }

    /**
     * Delete a User type from the list of user Tyeps using a given menu id
     * @param $id
     */
    public function getDelete($id)
    {
        $sector = Sector::findOrFail($id);
        //Delete The Warder Record
        $delete = ($sector !== null) ? $sector->delete() : null;

        if($delete){
            //Delete its Equivalent Users Record
            $this->setFlashMessage('  Deleted!!! '.$sector->sector.' sector have been deleted.', 1);
        }else{
            $this->setFlashMessage('Error!!! Unable to delete record.', 2);
        }
    }
}
