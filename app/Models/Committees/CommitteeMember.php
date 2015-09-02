<?php

namespace App\Models\Committees;

use Illuminate\Database\Eloquent\Model;

class CommitteeMember extends Model
{
    /**
     * The table constituencies primary key
     * @var int
     */
    protected $primaryKey = 'committee_member_id';

    /**
     * The database table used by the model.
     * @var string
     */
    protected $table = 'committee_members';

    /**
     * The attributes that are mass assignable.
     * @var array
     */
    protected $fillable = ['committee_id','user_id'];
}
