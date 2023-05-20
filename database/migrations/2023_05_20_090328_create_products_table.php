<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('products', function (Blueprint $table) {
            $table->id();
            $table->string('code',20)->unique();
            $table->string('name');
            $table->integer('import_price');
            $table->integer('price');
            $table->string('image');
            $table->text('description');
            $table->unsignedBigInteger('cate_id');
            $table->foreign('cate_id')->references('id')->on('categories')->onDelete('cascade');
            $table->string('seo_des');
            $table->string('seo_key');
            $table->string('seo_title');
            $table->integer('vitri')->default(100);
            $table->timestamps();
            $table->softDeletes();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('products');
    }
};
