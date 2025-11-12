<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class DetallesDePago extends Model
{
    protected $table = 'detalles_de_pago';
    protected $primaryKey = 'id_pago';
    public $incrementing = false;
    protected $keyType = 'int';
    public $timestamps = false;

    protected $fillable = ['id_pago','monto','fecha_pago','id_forma_pago'];
}
