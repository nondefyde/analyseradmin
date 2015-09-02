<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateVotesAndProceedingsRollCallTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('votes_proceeding_roll_calls', function (Blueprint $table) {
            $table->integer('votes_proceeding_id')->unsigned()->index();
            $table->foreign('votes_proceeding_id')->references('votes_proceeding_id')->on('votes_proceedings');

            $table->integer('user_id')->unsigned()->index();
            $table->foreign('user_id')->references('user_id')->on('users');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::drop('votes_proceeding_roll_calls');
    }
}
