<?php

namespace App\models;

use Illuminate\Database\Eloquent\Model;

class ObjectType extends Model
{
    /**
     * The database table used by the model.
     *
     * @var string
     */
    protected $table = 'object_types';

    /**
     * The table Project Comments primary key
     *
     * @var int
     */
    protected $primaryKey = 'object_type_id';


    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = ['object_type', 'model'];


    /**
     * This will get all the lga of the state using the hasMany relationship
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function likes(){
        return $this->hasMany('App\Models\Like');
    }

    /**
     * This will get all the time lines of the time line object type using the hasMany relationship
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function timeLines(){
        return $this->hasMany('App\Models\TimeLine');
    }
}
