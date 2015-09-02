<?php

namespace App\Http\Controllers\MasterRecords;

use App\models\MasterRecords\Menu;
use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Controllers\Controller;

class MenusController extends Controller
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
     * Display a listing of the Menus for Master Records.
     *
     * @return Response
     */
    public function getIndex()
    {
        $menus = Menu::orderBy('sequence')->get();
        return view('records.menus.index', compact('menus'));
    }


    /**
     * Insert or Update the menu records
     * @param Request $request
     * @return \Illuminate\Http\RedirectResponse|\Illuminate\Routing\Redirector
     */
    public function postIndex(Request $request)
    {
        $inputs = $request->all();
        $count = 0;

        for($i = 0; $i < count($inputs['menu_id']); $i++){
            $menu = ($inputs['menu_id'][$i] > 0) ? Menu::find($inputs['menu_id'][$i]) : new Menu();
            $menu->menu = $inputs['menu'][$i];
            $menu->menu_url = $inputs['menu_url'][$i];
            $menu->icon = $inputs['icon'][$i];
            $menu->active = $inputs['active'][$i];
            $menu->sequence = $inputs['sequence'][$i];
            $count = ($menu->save()) ? $count+1 : '';
        }
        // Set the flash message
        if($count > 0)
            $this->setFlashMessage($count . ' Menus has been successfully updated.', 1);
        // redirect to the create a new inmate page
        return redirect('/menus');
    }

    /**
     * Delete a Menu from the list of Menus using a given menu id
     * @param $id
     */
    public function getDelete($id)
    {
        $menu = Menu::findOrFail($id);
        //Delete The Warder Record
        $delete = ($menu !== null) ? $menu->delete() : null;

        if($delete){
            //Delete its Equivalent Users Record
            $this->setFlashMessage('  Deleted!!! '.$menu->menu.' menu have been deleted.', 1);
        }else{
            $this->setFlashMessage('Error!!! Unable to delete record.', 2);
        }
    }
}
