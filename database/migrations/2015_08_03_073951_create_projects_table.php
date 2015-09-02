<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateProjectsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('projects', function (Blueprint $table) {
            $table->increments('project_id');
            $table->string('title', 200);
            $table->text('description');
            $table->text('purpose');
            $table->string('mou')->nullable();
            $table->string('award_letter')->nullable();
            $table->integer('user_id')->unsigned()->index();
            $table->integer('contractor_id')->unsigned()->index();
            $table->integer('status_id')->unsigned()->default(1);
            $table->integer('publish_id')->unsigned()->default(0);
            $table->timestamp('started_on');
            $table->timestamp('expected_on')->nullable();
            $table->timestamp('completed_on')->nullable();
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
        Schema::drop('projects');
    }
}
