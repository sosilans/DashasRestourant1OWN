<?php
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;
return new class extends Migration {
    public function up(): void {
        Schema::create('menu_items', function (Blueprint $table) {
            $table->id();
            $table->string('name');
            $table->text('description')->nullable();
            $table->decimal('price_decimal', 8, 2)->default(0);
            $table->string('emoji', 8)->nullable();
            $table->integer('sort')->default(0);
            $table->timestamps();
        });
    }
    public function down(): void { Schema::dropIfExists('menu_items'); }
};
