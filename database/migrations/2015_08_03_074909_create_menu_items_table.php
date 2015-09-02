<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateMenuItemsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('menu_items', function (Blueprint $table) {
            $table->increments('menu_item_id');
            $table->string('menu_item', 150);
            $table->string('menu_item_url', 150);
            $table->string('menu_item_icon', 100);
            $table->integer('active')->unsigned()->default(1);
            $table->string('sequence');
            $table->integer('menu_id')->unsigned()->index();
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
        Schema::drop('menu_items');
    }
}
