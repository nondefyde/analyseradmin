<?php

namespace App;

use Carbon\Carbon;
use Illuminate\Auth\Authenticatable;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Auth\Passwords\CanResetPassword;
use Illuminate\Contracts\Auth\Authenticatable as AuthenticatableContract;
use Illuminate\Contracts\Auth\CanResetPassword as CanResetPasswordContract;

class User extends Model implements AuthenticatableContract, CanResetPasswordContract
{
    use Authenticatable, CanResetPassword;

    /**
     * The database table used by the model.
     * @var string
     */
    protected $table = 'users';

    /**
     * The table users primary key
     *
     * @var string
     */
    protected $primaryKey = 'user_id';

    /**
     * Dates To Be Treated As Carbon Instance
     * @var array
     */
    protected $dates = ['dob'];

    /**
     * The attributes that are mass assignable.
     * @var array
     */
    protected $fillable = [
        'email',
        'password',
        'first_name',
        'last_name',
        'middle_name',
        'gender',
        'phone_no',
        'dob',
        'avatar',
        'lga_id',
        'user_type_id',
        'verification_code',
        'status',
        'verified'
    ];

    /**
     * The attributes excluded from the model's JSON form.
     *
     * @var array
     */
    protected $hidden = ['password', 'remember_token', 'verification_code', 'verified', 'staus'];

    /**
     * Format The Date of Birth Before Inserting
     * @param $date
     */
    public function setDobAttribute($date)
    {
        $this->attributes['dob'] = Carbon::createFromFormat('Y-m-d', $date);
    }

    /**
     * This will get the user type the user belongs to
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function userType(){
        return $this->belongsTo('App\Models\MasterRecords\UserType');
    }

    /**
     * User has many Sub User
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function subUsers(){
        return $this->hasMany('App\Models\SubUser', 'parent_user_id');
    }

    /**
     * This will get the lga of the user
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function lga(){
        return $this->belongsTo('App\Models\Lga');
    }

    /**
     * User has many comments
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function comments(){
        return $this->hasMany('App\Models\ProjectComment');
    }

    /**
     * Concatenate the surname and the other names to get full names
     *
     * @return mixed|string
     */
    public function fullNames()
    {
        return $this->first_name . ' ' . $this->last_name . ' ' . $this->middle_name ;
    }
}
