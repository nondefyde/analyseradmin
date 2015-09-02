<?php

namespace App\Models\Projects;

use Illuminate\Database\Eloquent\Model;

class Contractor extends Model
{
    /**
     * The database table used by the model.
     *
     * @var string
     */
    protected $table = 'contractors';

    /**
     * The table states primary key
     *
     * @var int
     */
    protected $primaryKey = 'contractor_id';
    
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'contractor', 'contractor_code', 'email', 'phone_no', 'cac_registration_no',
        'tin', 'specialization_area', 'years_experience', 'address'
    ];

    /**
     * Get All The Projects of the Contractor
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function projects()
    {
        return $this->hasMany('App\Models\Projects\Project');
    }

}
