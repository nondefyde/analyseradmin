<?php

namespace App\Models\Committees;

use Illuminate\Database\Eloquent\Model;

class Committee extends Model
{
    /**
     * The table constituencies primary key
     * @var int
     */
    protected $primaryKey = 'committee_id';

    /**
     * The database table used by the model.
     * @var string
     */
    protected $table = 'committees';

    /**
     * The attributes that are mass assignable.
     * @var array
     */
    protected $fillable =
        [
            'committee',
            'committee_type_id',
            'chairman_id',
            'vice_chairman_id',
            'inaugurated_at',
            'closed_at'
        ];

    /**
     * Dates To Be Treated As Carbon Instance
     * @var array
     */
    protected $dates = ['inaugurated_at','closed_at'];
}
