<?php

namespace App\Models\MasterRecords;

use Illuminate\Database\Eloquent\Model;

class Sector extends Model
{
    /**
     * The database table used by the model.
     *
     * @var string
     */
    protected $table = 'sectors';


    /**
     * The table user_details primary key
     *
     * @var int
     */
    protected $primaryKey = 'sector_id';

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = ['sector'];


    /**
     * Get the projects associated with the given projects
     *
     * @return \Illuminate\Database\Eloquent\Relations\BelongsToMany
     */
    public function projects(){
        return $this->belongsToMany('App\Models\Project');
    }
}
