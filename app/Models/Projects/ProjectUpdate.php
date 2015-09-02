<?php

namespace App\Models\Projects;

use Illuminate\Database\Eloquent\Model;

class ProjectUpdate extends Model
{
    /**
     * The database table used by the model.
     *
     * @var string
     */
    protected $table = 'project_updates';

    /**
     * The table Project Updates primary key
     *
     * @var int
     */
    protected $primaryKey = 'project_update_id';

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = ['update_title', 'update_description', 'likes', 'update_picture', 'video_url', 'project_id', 'user_id'];

    /**
     * Path to the project updates images
     */
    public $image_path = 'uploads/projects/updates/';

    /**
     * Set the Object Type of a Project Update to 2
     */
    const OBJECT_TYPE_ID = 2;

    /**
     * A Project belongs to a Project
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function project(){
        return $this->belongsTo('App\Models\Projects\Project');
    }

    /**
     * A Project belongs to a User
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function user(){
        return $this->belongsTo('App\User', 'user_id');
    }

    /**
     * Project Update has many comments
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function comments(){
        return $this->hasMany('App\Models\Projects\ProjectComment');
    }

    /**
     * Project Update has many likes
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function likes(){
        return $this->hasMany('App\Models\Like', 'object_id');
    }
}
