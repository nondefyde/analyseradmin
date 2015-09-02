<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateHansardRollCallsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('hansard_roll_calls', function (Blueprint $table) {
            $table->integer('hansard_id')->unsigned()->index();
            $table->foreign('hansard_id')->references('hansard_id')->on('hansards');

            $table->integer('user_id')->unsigned()->index();
            $table->foreign('user_id')->references('user_id')->on('users');

//            $table->integer('attendance')->unsigned();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::drop('hansard_roll_calls');
    }
}
