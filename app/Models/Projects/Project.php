<?php

namespace App\Models\Projects;

use Illuminate\Database\Eloquent\Model;
use Carbon\Carbon;

class Project extends Model
{
    /**
     * The database table used by the model.
     *
     * @var string
     */
    protected $table = 'projects';

    /**
     * The table projects primary key
     *
     * @var int
     */
    protected $primaryKey = 'project_id';

    /**
     * Dates To Be Treated As Carbon Instance
     * @var array
     */
    protected $dates = ['started_on', 'expected_on', 'completed_on'];

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'title',
        'description',
        'purpose',
        'mou',
        'award_letter',
        'user_id',
        'contractor_id',
        'status_id',
        'publish_id',
        'started_on',
        'expected_on',
        'completed_on',
    ];

    /**
     * Path to the files
     */
    public $file_path = '/uploads/projects';

    /**
     * Set the Object Type of a Project to 1
     */
    const OBJECT_TYPE_ID = 1;

    /**
     * Format The Started On Before Inserting
     * @param $date
     */
    public function setStartedOnAttribute($date)
    {
        $this->attributes['started_on'] = Carbon::createFromFormat('Y-m-d', $date);
    }

    /**
     * Format The Expected On Before Inserting
     * @param $date
     */
    public function setExpectedOnAttribute($date)
    {
        $this->attributes['expected_on'] = Carbon::createFromFormat('Y-m-d', $date);
    }

    /**
     * Format The Completed On Before Inserting
     * @param $date
     */
    public function setCompletedOnAttribute($date)
    {
        $this->attributes['completed_on'] = ($date) ? Carbon::createFromFormat('Y-m-d', $date) : null;
    }

    /**
     * Get the Owner of the project
     *
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function user()
    {
        return $this->belongsTo('App\Models\AdminUser');
    }

    /**
     * contractor handling the project
     *
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function contractor()
    {
        return $this->belongsTo('App\Models\Projects\Contractor');
    }

    /**
     * Get the section associated with the given projects
     *
     * @return \Illuminate\Database\Eloquent\Relations\BelongsToMany
     */
    public function sectors(){
        return $this->belongsToMany('App\Models\MasterRecords\Sector');
    }

    /**
     * Get the supervisors associated with the given projects
     *
     * @return \Illuminate\Database\Eloquent\Relations\BelongsToMany
     */
    public function supervisors(){
        return $this->belongsToMany('App\User', 'project_supervisors', 'project_id', 'supervisor_id');
    }

    /**
     * get all the beneficiaries of the project
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function beneficiaries(){
        return $this->hasMany('App\Models\Projects\Beneficiary');
    }

    /**
     * get all the domains of the project
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function domains(){
        return $this->hasMany('App\Models\Projects\Domain');
    }

    /**
     * Project has many updates
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function updates(){
        return $this->hasMany('App\Models\Projects\ProjectUpdate');
    }

    /**
     * Project has many comments
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function comments(){
        return $this->hasMany('App\Models\Projects\ProjectComment');
    }
}
