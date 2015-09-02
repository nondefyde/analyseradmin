<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Lga extends Model
{
    /**
     * The table lgas primary key
     *
     * @var int
     */
    protected $primaryKey = 'lga_id';

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = ['lga', 'lga_code', 'state_id','constituency_id'];


    /**
     * This will get the state of the lga using the belongTo relationship
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function state(){
        return $this->belongsTo('App\Models\State');
    }
}
