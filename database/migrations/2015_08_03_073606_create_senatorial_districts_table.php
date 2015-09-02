<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Support\Facades\Schema;

class CreateSenatorialDistrictsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('senatorial_districts', function (Blueprint $table) {
            $table->increments('senatorial_district_id');
            $table->string('senatorial_district',100);
            $table->string('senatorial_district_code')->nullable();
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
        Schema::drop('senatorial_districts');
    }
}
