<?php

use Illuminate\Database\Seeder;

class LgaTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('lgas')->insert([
            [
                'lga' => 'Alimosho',
                'lga_code' => 'ALI',
                'state_id' => 1,
                'constituency_id' => 1
            ]
            ,
            [
                'lga' => 'Surulere',
                'state_code' => 'SUR',
                'state_id' => 1,
                'constituency_id' => 1
            ]
        ]);
    }
}
