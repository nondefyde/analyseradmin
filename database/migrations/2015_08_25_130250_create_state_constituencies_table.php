<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateStateConstituenciesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('state_constituencies', function (Blueprint $table) {
            $table->increments('state_constituency_id');
            $table->string('state_constituency');
            $table->string('state_constituency_code')->nullable();
            $table->integer('state_id')->unsigned()->index();
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
        Schema::drop('state_constituencies');
    }
}
