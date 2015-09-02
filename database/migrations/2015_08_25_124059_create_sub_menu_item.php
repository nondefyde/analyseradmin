<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateSubMenuItem extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('sub_menu_items', function (Blueprint $table) {
            $table->increments('sub_menu_item_id');
            $table->string('sub_menu_item', 150);
            $table->string('sub_menu_item_url', 150);
            $table->string('sub_menu_item_icon', 100);
            $table->integer('active')->unsigned()->default(1);
            $table->string('sequence');
            $table->integer('menu_item_id')->unsigned()->index();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::drop('sub_menu_items');
    }
}
