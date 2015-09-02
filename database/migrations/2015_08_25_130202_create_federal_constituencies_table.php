<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateFederalConstituenciesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('federal_constituencies', function (Blueprint $table) {
            $table->increments('federal_constituency_id');
            $table->string('federal_constituency');
            $table->string('federal_constituency_code')->nullable();
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
        Schema::drop('federal_constituencies');
    }
}
