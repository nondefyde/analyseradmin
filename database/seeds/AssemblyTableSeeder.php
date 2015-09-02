<?php

use Illuminate\Database\Seeder;

class AssemblyTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('assemblies')->insert([
            [
                'assembly' => 'National Assembly'
            ],
            [
                'assembly' => 'State House Of Assembly'
            ]
        ]);
    }
}
