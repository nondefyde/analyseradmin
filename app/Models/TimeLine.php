<?php

namespace App\models;

use Illuminate\Database\Eloquent\Model;

class TimeLine extends Model
{
    /**
     * The database table used by the model.
     *
     * @var string
     */
    protected $table = 'time_lines';

    /**
     * The table Project Comments primary key
     *
     * @var int
     */
    protected $primaryKey = 'time_line_id';

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = ['object_type_id', 'object_id', 'active'];

    /**
     * This will get the time line object type of the time line using the belongTo relationship
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function objectType(){
        return $this->belongsTo('App\Models\ObjectType');
    }
}
