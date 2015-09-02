<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateSenatorsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('senators', function (Blueprint $table) {
            $table->increments('senator_id');
            $table->integer('rank_id')->unsigned()->index();
            $table->integer('senatorial_district_id')->unsigned()->index();
            $table->integer('house_id')->unsigned()->index();
            $table->integer('user_id')->unsigned()->index();
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
        Schema::drop('senators');
    }
}
