<?php

namespace App\Models\Legislative;

use Illuminate\Database\Eloquent\Model;

class StateConstituency extends Model
{
    /**
     * The table constituencies primary key
     *
     * @var int
     */
    protected $primaryKey = 'state_constituency_id';

    /**
     * The database table used by the model.
     *
     * @var string
     */
    protected $table = 'state_constituencies';

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = ['state_constituency', 'state_constituency_code', 'state_id'];

    /**
     * A State Constituency belongs to a State
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function state(){
        return $this->belongsTo('App\Models\State');
    }
}
