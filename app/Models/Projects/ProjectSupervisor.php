<?php

namespace App\Models\Projects;

use Illuminate\Database\Eloquent\Model;

class ProjectSupervisor extends Model
{
    /**
     * The database table used by the model.
     *
     * @var string
     */
    protected $table = 'project_supervisors';

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = ['project_id', 'supervisor_id'];

    /**
     * disable the time stamps
     * @var bool
     */
    public $timestamps = false;

    /**
     * Get the project associated with the given supervisor
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function project(){
        return $this->belongsTo('App\Models\Projects\Project', 'project_id');
    }

    /**
     * Get the supervisor associated with the given project
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function supervisor(){
        return $this->belongsTo('App\User', 'supervisor_id');
    }
}
