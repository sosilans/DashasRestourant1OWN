<?php
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;
return new class extends Migration {
    public function up(): void {
        Schema::create('site_blocks', function (Blueprint $table) {
            $table->id();
            $table->string('key')->unique();
            $table->boolean('enabled')->default(true);
            $table->integer('sort')->default(0);
            $table->json('json_content')->nullable();
            $table->timestamps();
        });
    }
    public function down(): void { Schema::dropIfExists('site_blocks'); }
};
