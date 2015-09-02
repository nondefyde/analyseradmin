<?php

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class MenuTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('menus')->insert([
            [
                'menu' => 'Dashboard',
                'menu_url' => '/',
                'sequence' => 1,
                'icon' => 'fa fa-desktop'
            ],
            [
                'menu' => 'Admin',
                'menu_url' => '#',
                'sequence' => 2,
                'icon' => 'fa fa-cogs'
            ],
            [
                'menu' => 'User',
                'menu_url' => '#',
                'sequence' => 3,
                'icon' => 'fa fa-table',
            ],
            [
                'menu' => 'Logout',
                'menu_url' => 'auth/logout',
                'sequence' => 20,
                'icon' => 'fa fa-power-off text-danger'
            ]

        ]);
    }
}
