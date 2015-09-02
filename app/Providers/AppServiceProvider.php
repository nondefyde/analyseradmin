<?php

namespace App\Providers;

use Illuminate\Support\Facades\View;
use Illuminate\Support\ServiceProvider;
use App\Models\MasterRecords\Menu;
use Hashids\Hashids;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
        //Make All The Menus Global To The Views
        $active_menus = Menu::where('active', 1)->orderBy('sequence')->get();
        if($active_menus)
            View::share('active_menus', $active_menus);

        //Set The HashIds Secret Key, Length and Possible Characters Combinations To Be Accessible to every View
        View::share('hashIds', new Hashids(env('APP_KEY'), 15, env('APP_CHAR')));
    }

    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        //
    }
}
