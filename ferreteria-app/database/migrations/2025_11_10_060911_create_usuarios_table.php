public function up(): void
{
    Schema::create('usuarios', function (Illuminate\Database\Schema\Blueprint $table) {
        $table->id(); // BIGINT auto-increment
        $table->string('nombre', 150);
        $table->string('email', 150)->unique();
        $table->string('password'); // hash
        $table->timestamps(); // created_at / updated_at
    });
}
