<?php

namespace App\Models\Legislative;

use Illuminate\Database\Eloquent\Model;

class StateRepresentative extends Model
{
    /**
     * The table constituencies primary key
     *
     * @var int
     */
    protected $primaryKey = 'state_rep_id';

    /**
     * The database table used by the model.
     *
     * @var string
     */
    protected $table = 'state_representatives';

    /**
     * Set the Legislative / User Type of a User to 3
     */
    const USER_TYPE = 5;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = ['rank_id', 'state_constituency_id', 'house_id', 'user_id'];

    /**
     * This will get the rank the state house member belongs to
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function rank(){
        return $this->belongsTo('App\Models\MasterRecords\Rank');
    }

    /**
     * This will get the state Constituency of the state house member belongs to
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function stateConstituency(){
        return $this->belongsTo('App\Models\Legislative\StateConstituency');
    }

    /**
     * This will get the State Rep House of the state house member belongs to
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function house(){
        return $this->belongsTo('App\Models\MasterRecords\House');
    }

    /**
     * This will get the User of the state house member belongs to
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function user(){
        return $this->belongsTo('App\User');
    }
}
