<?php

namespace App\Models\MasterRecords;

use Illuminate\Database\Eloquent\Model;

class House extends Model
{
    /**
     * The database table used by the model.
     *
     * @var string
     */
    protected $table = 'houses';

    /**
     * The table Menus primary key
     *
     * @var int
     */
    protected $primaryKey = 'house_id';
    /**
     * The attributes that are mass assignable.
     * @var array
     */
    protected $fillable = ['house', 'user_type_id'];

    /**
     * A House belongs to a user type
     * @return \Illuminate\Database\Eloquent\Relations\belongsTo
     */
    public function userType(){
        return $this->belongsTo('App\Models\MasterRecords\UserType');
    }
}