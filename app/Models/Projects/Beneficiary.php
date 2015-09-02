<?php

namespace App\Models\Projects;

use Illuminate\Database\Eloquent\Model;

class Beneficiary extends Model
{
    /**
     * The table lgas primary key
     *
     * @var int
     */
    protected $primaryKey = 'beneficiary_id';

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = ['name', 'address', 'project_id'];


    /**
     * This will get the project of the beneficiary using the belongTo relationship
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function project(){
        return $this->belongsTo('App\Models\Projects\Project');
    }
}
