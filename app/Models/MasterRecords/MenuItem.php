<?php

namespace App\Models\MasterRecords;

use Illuminate\Database\Eloquent\Model;

class MenuItem extends Model
{
    /**
     * The database table used by the model.
     *
     * @var string
     */
    protected $table = 'menu_items';

    /**
     * The table Ranks primary key
     *
     * @var int
     */
    protected $primaryKey = 'menu_item_id';

    /**
     * The attributes that are mass assignable.
     * @var array
     */
    protected $fillable = ['menu_item', 'menu_item_url', 'menu_item_icon', 'active', 'sequence', 'menu_id'];

    /**
     * A Menu Item belongs to a Menu
     *
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function menu(){
        return $this->belongsTo('App\Models\MasterRecords\Menu');
    }

    /**
     * A Menu item has many sub Menu Items
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function subMenuItems(){
        return $this->hasMany('App\Models\MasterRecords\SubMenuItem');
    }
}
