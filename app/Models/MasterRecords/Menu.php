<?php

namespace App\Models\MasterRecords;

use Illuminate\Database\Eloquent\Model;

class Menu extends Model
{
    /**
     * The database table used by the model.
     *
     * @var string
     */
    protected $table = 'menus';

    /**
     * The table Menus primary key
     *
     * @var int
     */
    protected $primaryKey = 'menu_id';
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = ['menu', 'menu_url','icon', 'active', 'sequence'];

    /**
     * A Menu has many Menu Items
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */

    public function menuItems(){
        return $this->hasMany('App\Models\MasterRecords\MenuItem');
    }
}
