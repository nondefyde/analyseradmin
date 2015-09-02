<?php

use Illuminate\Database\Seeder;

class StateTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {

        DB::table('states')->insert([
            ['state' => 'Lagos','state_code'=>'LAG'], ['state' => 'Anambra','state_code'=>'ANA']
        ]);
    }
}
