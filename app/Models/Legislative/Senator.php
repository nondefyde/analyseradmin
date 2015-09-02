<?php

namespace App\Models\Legislative;

use Illuminate\Database\Eloquent\Model;

class Senator extends Model
{
    /**
     * The table constituencies primary key
     *
     * @var int
     */
    protected $primaryKey = 'senator_id';

    /**
     * The database table used by the model.
     *
     * @var string
     */
    protected $table = 'senators';

    /**
     * Set the Legislative / User Type of a User to 3
     */
    const USER_TYPE = 3;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = ['rank_id', 'senatorial_district_id', 'house_id', 'user_id'];

    /**
     * This will get the rank the senator belongs to
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function rank(){
        return $this->belongsTo('App\Models\MasterRecords\Rank');
    }

    /**
     * This will get the Senatorial District the senator belongs to
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function senatorialDistrict(){
        return $this->belongsTo('App\Models\Legislative\SenatorialDistrict');
    }

    /**
     * This will get the Senate House the senator belongs to
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function house(){
        return $this->belongsTo('App\Models\MasterRecords\House');
    }

    /**
     * This will get the User the senator belongs to
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function user(){
        return $this->belongsTo('App\User');
    }
}
