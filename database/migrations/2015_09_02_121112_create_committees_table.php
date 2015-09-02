<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateCommitteesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('committees', function (Blueprint $table) {
            $table->increments('committee_id');
            $table->string('committee');
            $table->integer('committee_type_id')->unsigned()->index();
            $table->integer('chairman_id')->unsigned()->index();
            $table->integer('vice_chairman_id')->unsigned()->index();
            $table->integer('house_id')->unsigned()->index();
            $table->date('inaugurated_at');
            $table->date('closed_at');
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
        Schema::drop('committees');
    }
}
