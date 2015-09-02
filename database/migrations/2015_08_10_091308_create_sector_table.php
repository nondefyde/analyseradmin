<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateSectorTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('sectors', function (Blueprint $table) {
            $table->increments('sector_id');
            $table->string('sector', 150);
            $table->timestamps();
        });

        Schema::create('project_sector', function (Blueprint $table) {
            $table->integer('project_id')->unsigned()->index();
            $table->foreign('project_id')->references('project_id')->on('projects')->onDelete('cascade');

            $table->integer('sector_id')->unsigned()->index();
            $table->foreign('sector_id')->references('sector_id')->on('sectors')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::drop('project_sector');
        Schema::drop('sectors');
    }
}
