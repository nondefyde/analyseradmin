<?php

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;

class UserTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('users')->insert([
            'email' => 'admin@gmail.com',
            'first_name' => 'Emmanuel',
            'last_name'=> 'Okafor',
            'status' => 1,
            'password' => Hash::make('password')
        ]);
    }
}
