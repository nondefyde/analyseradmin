<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateVotesAndProceedingsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('votes_proceedings', function (Blueprint $table) {
            $table->increments('votes_proceeding_id');
            $table->integer('volume')->unsigned();
            $table->integer('number')->unsigned();
            $table->timestamp('date');
            $table->string('session');
            $table->string('upload_url');
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
        Schema::drop('votes_proceedings');
    }
}
