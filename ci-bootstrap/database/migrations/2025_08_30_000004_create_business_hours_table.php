<?php
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;
return new class extends Migration {
    public function up(): void {
        Schema::create('business_hours', function (Blueprint $table) {
            $table->id();
            $table->unsignedTinyInteger('day');
            $table->time('open_time')->nullable();
            $table->time('close_time')->nullable();
            $table->string('note')->nullable();
            $table->timestamps();
        });
    }
    public function down(): void { Schema::dropIfExists('business_hours'); }
};
