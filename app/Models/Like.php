<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Like extends Model
{
    /**
     * The database table used by the model.
     *
     * @var string
     */
    protected $table = 'likes';

    /**
     * The table lgas primary key
     *
     * @var int
     */
    protected $primaryKey = 'like_id';

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = ['like', 'object_id', 'app_user_id', 'object_type_id'];


    /**
     * This will get the like type of the like using the belongTo relationship
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function objectType(){
        return $this->belongsTo('App\Models\ObjectType');
    }
}
