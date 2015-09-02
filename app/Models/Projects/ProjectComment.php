<?php

namespace App\Models\Projects;

use Illuminate\Database\Eloquent\Model;

class ProjectComment extends Model
{
    /**
     * The database table used by the model.
     *
     * @var string
     */
    protected $table = 'project_comments';

    /**
     * The table Project Comments primary key
     *
     * @var int
     */
    protected $primaryKey = 'project_comment_id';

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = ['update_comment', 'project_update_id', 'app_user_id'];

    /**
     * A Comment belongs to a User
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function appUser(){
        return $this->belongsTo('App\Models\AppUser', 'app_user_id');
    }

    /**
     * A Comment belongs to a Project Update
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function projectUpdate(){
        return $this->belongsTo('App\Models\Projects\ProjectUpdate');
    }
}