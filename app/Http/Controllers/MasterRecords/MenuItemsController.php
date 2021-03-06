<?php

namespace App\Http\Controllers\MasterRecords;

use Illuminate\Http\Request;
use App\models\MasterRecords\Menu;
use App\models\MasterRecords\MenuItem;

use App\Http\Requests;
use App\Http\Controllers\Controller;

class MenuItemsController extends Controller
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
     * Display a listing of the Menu Items for Master Records.
     *
     * @return Response
     */
    public function getIndex()
    {
        $menu_lists = Menu::orderBy('menu')->lists('menu', 'menu_id')->put('', 'Select Menu');
        $menu_items = MenuItem::orderBy('menu_id', 'sequence')->get();

        return view('records.menu-items.index', compact('menu_items', 'menu_lists'));
    }

    /**
     * Insert or Update the menu items records
     * @param Request $request
     * @return \Illuminate\Http\RedirectResponse|\Illuminate\Routing\Redirector
     */
    public function postIndex(Request $request)
    {
        $inputs = $request->all();
        $count = 0;

        for($i = 0; $i < count($inputs['menu_item_id']); $i++){
            $menu_item = ($inputs['menu_item_id'][$i] > 0) ? MenuItem::find($inputs['menu_item_id'][$i]) : new MenuItem();
            $menu_item->menu_item = $inputs['menu_item'][$i];
            $menu_item->menu_item_url = $inputs['menu_item_url'][$i];
            $menu_item->menu_item_icon = $inputs['menu_item_icon'][$i];
            $menu_item->active = $inputs['active'][$i];
            $menu_item->sequence = $inputs['sequence'][$i];
            $menu_item->menu_id = $inputs['menu_id'][$i];
            $count = ($menu_item->save()) ? $count+1 : '';
        }
        // Set the flash message
        if($count > 0)
            $this->setFlashMessage($count . ' Menu Items has been successfully updated.', 1);
        // redirect to the create a new inmate page
        return redirect('/menu-items');
    }

    /**
     * Delete a Menu from the list of Menus using a given menu id
     * @param $id
     */
    public function getDelete($id)
    {
        $menu_item = MenuItem::findOrFail($id);
        //Delete The Warder Record
        $delete = ($menu_item !== null) ? $menu_item->delete() : null;

        if($delete){
            //Delete its Equivalent Users Record
            $this->setFlashMessage('  Deleted!!! '.$menu_item->menu_item.' menu item have been deleted.', 1);
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
        $menu_lists = Menu::orderBy('menu')->lists('menu', 'menu_id')->put('', 'Select Menu');
        ($inputs['menu_id'] === '')
            ?  $menu_items = MenuItem::orderBy('menu_id', 'sequence')->get()
            : $menu_items = MenuItem::where('menu_id', $inputs['menu_id'])->orderBy('menu_id', 'sequence')->get();

        return view('records.menu-items.index')->with(['menu_items'=>$menu_items, 'menu_lists'=>$menu_lists]);
    }
}
