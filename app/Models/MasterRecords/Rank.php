<?php

namespace App\Models\MasterRecords;

use Illuminate\Database\Eloquent\Model;

class Rank extends Model
{
    /**
     * The table constituencies primary key
     *
     * @var int
     */
    protected $primaryKey = 'rank_id';

    /**
     * The database table used by the model.
     *
     * @var string
     */
    protected $table = 'ranks';

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = ['rank', 'user_type_id'];

    /**
     * This will get the user type the rank belongs to
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function userType(){
        return $this->belongsTo('App\Models\MasterRecords\UserType');
    }
}
