<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class SubUser extends Model
{
    /**
     * The database table used by the model.
     * @var string
     */
    protected $table = 'sub_users';

    /**
     * The table users primary key
     *
     * @var string
     */
    protected $primaryKey = 'sub_user_id';

    /**
     * Set the User Type of a User to 10
     */
    const USER_TYPE = 20;

    /**
     * The attributes that are mass assignable.
     * @var array
     */
    protected $fillable = ['parent_user_id', 'child_user_id'];

    /**
     * This will get the main user of this sub user
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function user(){
        return $this->belongsTo('App\User', 'parent_user_id');
    }

    /**
     * This will get the main user of this sub user
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function subUser(){
        return $this->belongsTo('App\User', 'child_user_id');
    }
}
