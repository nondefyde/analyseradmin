<?php

namespace App\Models\MasterRecords;

use Illuminate\Database\Eloquent\Model;

class UserType extends Model
{
    /**
     * The database table used by the model.
     *
     * @var string
     */
    protected $table = 'user_types';


    /**
     * The table user_details primary key
     *
     * @var int
     */
    protected $primaryKey = 'user_type_id';

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = ['user_type'];
}
