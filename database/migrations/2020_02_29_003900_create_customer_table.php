<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCustomerTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('customer', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->integer('customer_no');
            $table->string('name');
            $table->string('email')->unique();
            $table->datetime('email_verified_at')->nullable();
            $table->string('password');
            $table->string('remember_token')->nullable();
            $table->string('customer_type');
            $table->string('pre_contract');
            $table->date('pre_contract_date');
            $table->string('purchase_contract');
            $table->timestamps();
            $table->softDeletes();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('customer');
    }
}
