<?php

namespace App\Models\Projects;

use Illuminate\Database\Eloquent\Model;

class Domain extends Model
{
    /**
     * The table lgas primary key
     *
     * @var int
     */
    protected $primaryKey = 'domain_id';

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = ['town', 'location_address', 'lga_id', 'project_id'];


    /**
     * This will get the project of the domain using the belongTo relationship
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function project(){
        return $this->belongsTo('App\Models\Projects\Project');
    }

    /**
     * This will get the domains L.G.A using the belongTo relationship
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function lga(){
        return $this->belongsTo('App\Models\Lga');
    }
}
