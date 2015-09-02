<?php

namespace App\Models\HansardsAndVotes;

use Illuminate\Database\Eloquent\Model;

class HansardRollCall extends Model
{
    /**
     * The database table used by the model.
     *
     * @var string
     */
    protected $table = 'hansard_roll_calls';

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = ['hansard_id', 'user_id'];

    /**
     * disable the time stamps
     * @var bool
     */
    public $timestamps = false;

    /**
     * Get the hansard associated with the Roll Call
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function hansard(){
        return $this->belongsTo('App\Models\HansardsAndVotes\Hansard', 'hansard_id');
    }

    /**
     * Get the User associated with the Roll Call
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function user(){
        return $this->belongsTo('App\User');
    }
}
