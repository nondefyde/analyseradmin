<?php

namespace App\Models\Legislative;

use Illuminate\Database\Eloquent\Model;

class FederalRepresentative extends Model
{
    /**
     * The table constituencies primary key
     *
     * @var int
     */
    protected $primaryKey = 'federal_rep_id';

    /**
     * The database table used by the model.
     *
     * @var string
     */
    protected $table = 'federal_representatives';

    /**
     * Set the Legislative / User Type of a User to 3
     */
    const USER_TYPE = 4;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = ['rank_id', 'federal_constituency_id', 'house_id', 'user_id'];

    /**
     * This will get the rank the federal house member belongs to
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function rank(){
        return $this->belongsTo('App\Models\MasterRecords\Rank');
    }

    /**
     * This will get the federal Constituency of the federal house member belongs to
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function federalConstituency(){
        return $this->belongsTo('App\Models\Legislative\FederalConstituency');
    }

    /**
     * This will get the Federal Rep House of the federal house member belongs to
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function house(){
        return $this->belongsTo('App\Models\MasterRecords\House');
    }

    /**
     * This will get the User of the federal house member belongs to
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function user(){
        return $this->belongsTo('App\User');
    }
}
