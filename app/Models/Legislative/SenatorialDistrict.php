<?php

namespace App\Models\Legislative;

use Illuminate\Database\Eloquent\Model;

class SenatorialDistrict extends Model
{
    /**
     * The table senatorial_districts primary key
     *
     * @var int
     */
    protected $primaryKey = 'senatorial_district_id';

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = ['senatorial_district', 'senatorial_district_code', 'state_id'];

    /**
     * This will get the state of the senatorial district belongs to
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function state(){
        return $this->belongsTo('App\Models\State');
    }
}
