<?php

namespace App\Models\Committees;

use Illuminate\Database\Eloquent\Model;

class CommitteeType extends Model
{
    /**
     * The table constituencies primary key
     * @var int
     */
    protected $primaryKey = 'committee_type_id';

    /**
     * The database table used by the model.
     * @var string
     */
    protected $table = 'committee_types';

    /**
     * The attributes that are mass assignable.
     * @var array
     */
    protected $fillable = ['committee_type'];
}
