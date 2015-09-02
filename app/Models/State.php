<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class State extends Model
{
    /**
     * The table states primary key
     *
     * @var int
     */
    protected $primaryKey = 'state_id';
    
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = ['state', 'state_code'];


    /**
     * This will get all the lga of the state using the hasMany relationship
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function lgas(){
        return $this->hasMany('App\Models\Lga');
    }

    /**
     * This will get all the districts of the state using the hasMany relationship
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function districts(){
        return $this->hasMany('App\Models\Legislative\SenatorialDistrict');
    }

    /**
     * This will get all the Federal Constituencies of the state using the hasMany relationship
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function federalConstituencies(){
        return $this->hasMany('App\Models\Legislative\FederalConstituency');
    }

    /**
     * This will get all the State Constituencies of the state using the hasMany relationship
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function stateConstituencies(){
        return $this->hasMany('App\Models\Legislative\StateConstituency');
    }
}
