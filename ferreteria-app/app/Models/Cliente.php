<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Cliente extends Model
{
    protected $table = 'cliente';
    protected $primaryKey = 'id_cliente';

    public $incrementing = false;   // PK manual
    protected $keyType = 'int';
    public $timestamps = false;     // sin created_at/updated_at

    protected $fillable = [
        'id_cliente',
        'telefono',
        'rut',
        'nombre',
        'id_ubicacion',     // FK opcional
        'email',
        'fecha_creacion',   // DATE
    ];

    // Relaciones opcionales (por si luego las usas)
    // public function ubicacion(){ return $this->belongsTo(Ubicacion::class, 'id_ubicacion'); }
}
