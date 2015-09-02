<?php

namespace App\Models\Legislative;

use Illuminate\Database\Eloquent\Model;

class FederalConstituency extends Model
{

    /**
     * The table constituencies primary key
     *
     * @var int
     */
    protected $primaryKey = 'federal_constituency_id';

    /**
     * The database table used by the model.
     *
     * @var string
     */
    protected $table = 'federal_constituencies';

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = ['federal_constituency', 'federal_constituency_code', 'state_id'];

    /**
     * A Federal Constituency belongs to a State
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function state(){
        return $this->belongsTo('App\Models\State');
    }
}
