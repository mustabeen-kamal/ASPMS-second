<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('promotion_requests', function (Blueprint $table) {

            $table->uuid('request_id')->primary();

            $table->uuid('user_id');

            $table->uuid('cycle_id');

            $table->string('academic_rank');

            $table->text('description')->nullable();

            $table->enum('status', [
                'PENDING',
                'APPROVED',
                'REJECTED'
            ])->default('PENDING');

            $table->timestamps();


            $table->foreign('user_id')
                ->references('id')
                ->on('users')
                ->cascadeOnDelete();


            $table->foreign('cycle_id')
                ->references('cycle_id')
                ->on('promotion_cycles')
                ->cascadeOnDelete();

        });
    }


    public function down(): void
    {
        Schema::dropIfExists('promotion_requests');
    }
};
