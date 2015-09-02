<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class AppUser extends Model
{
    /**
     * The database table used by the model.
     * @var string
     */
    protected $table = 'app_users';

    /**
     * The table users primary key
     *
     * @var string
     */
    protected $primaryKey = 'app_user_id';


    /**
     * Concatenate the surname and the other names to get full names
     *
     * @return mixed|string
     */
    public function fullNames()
    {
        return $this->first_name . ' ' . $this->last_name;
    }

    /**
     * Find method Override
     * @param $id
     * @param array $columns
     * @return \Illuminate\Database\Eloquent\Collection|Model|null
     */
    /*public static function find($id, $columns = ['*'])
    {
        $model = static::query()->find($id, $columns);

        // ...

        return $model;
    }*/
}
