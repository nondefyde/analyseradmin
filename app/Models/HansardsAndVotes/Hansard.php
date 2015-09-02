<?php

namespace App\Models\HansardsAndVotes;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

class Hansard extends Model
{
    /**
     * The table constituencies primary key
     * @var int
     */
    protected $primaryKey = 'hansard_id';

    /**
     * The database table used by the model.
     * @var string
     */
    protected $table = 'hansards';

    /**
     * Path to the files
     */
    public $file_path = 'uploads/hansards/';

    /**
     * The attributes that are mass assignable.
     * @var array
     */
    protected $fillable = ['volume', 'number', 'date', 'session', 'upload_url', 'house_id', 'user_id'];

    /**
     * Dates To Be Treated As Carbon Instance
     * @var array
     */
    protected $dates = ['date'];

    /**
     * This will get the Senate House the senator belongs to
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function house()
    {
        return $this->belongsTo('App\Models\MasterRecords\House');
    }

    /**
     * This will get the User that created the Hansard
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function user()
    {
        return $this->belongsTo('App\User');
    }

    /**
     * Format The Date of the Hansard Before Inserting
     * @param $date
     */
    public function setDateAttribute($date)
    {
        $this->attributes['date'] = Carbon::createFromFormat('Y-m-d', $date);
    }

    /**
     * Get the supervisors associated with the given projects
     *
     * @return \Illuminate\Database\Eloquent\Relations\BelongsToMany
     */
    public function attendances()
    {
        return $this->belongsToMany('App\User', 'hansard_roll_calls', 'hansard_id', 'user_id');
    }
}