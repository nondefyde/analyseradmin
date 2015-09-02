<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateContractorsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('contractors', function (Blueprint $table) {
            $table->increments('contractor_id');
            $table->string('contractor');
            $table->string('contractor_code');
            $table->string('email');
            $table->string('phone_no');
            $table->string('cac_registration_no');
            $table->string('tin');
            $table->string('specialization_area');
            $table->integer('years_experience');
            $table->text('address');
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
        Schema::drop('contractors');
    }
}
