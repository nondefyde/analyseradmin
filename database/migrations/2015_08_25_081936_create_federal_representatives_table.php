<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateFederalRepresentativesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('federal_representatives', function (Blueprint $table) {
            $table->increments('federal_rep_id');
            $table->integer('rank_id')->unsigned()->index();
            $table->integer('federal_constituency_id')->unsigned()->index();
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
        Schema::drop('federal_representatives');
    }
}
