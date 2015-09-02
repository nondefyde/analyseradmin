<?php

namespace App\Models\HansardsAndVotes;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

class VotesAndProceeding extends Model
{
    /**
     * The table constituencies primary key
     * @var int
     */
    protected $primaryKey = 'votes_proceeding_id';

    /**
     * The database table used by the model.
     * @var string
     */
    protected $table = 'votes_proceedings';

    /**
     * Path to the files
     */
    public $file_path = 'uploads/votes_proceedings/';

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
        return $this->belongsToMany('App\User', 'votes_proceeding_roll_calls', 'votes_proceeding_id', 'user_id');
    }
}
