<?php

namespace App\Models\Projects;

use Illuminate\Database\Eloquent\Model;

class ProjectSector extends Model
{
    /**
     * The database table used by the model.
     *
     * @var string
     */
    protected $table = 'project_sector';

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = ['project_id', 'sector_id'];

    /**
     * disable the time stamps
     * @var bool
     */
    public $timestamps = false;
}
