<?php

namespace App\Models\MasterRecords;

use Illuminate\Database\Eloquent\Model;

class SubMenuItem extends Model
{
    /**
     * The database table used by the model.
     *
     * @var string
     */
    protected $table = 'sub_menu_items';

    /**
     * The table Ranks primary key
     *
     * @var int
     */
    protected $primaryKey = 'sub_menu_item_id';

    /**
     * The attributes that are mass assignable.
     * @var array
     */
    protected $fillable = ['sub_menu_item', 'sub_menu_item_url', 'sub_menu_item_icon', 'active', 'sequence', 'menu_item_id'];

    /**
     * A Menu Item belongs to a Menu
     *
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function menuItem(){
        return $this->belongsTo('App\Models\MasterRecords\SubMenuItem');
    }
}
