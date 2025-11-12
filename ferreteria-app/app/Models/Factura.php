<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Factura extends Model
{
    protected $table = 'factura';
    protected $primaryKey = 'id_factura';
    public $incrementing = false;
    protected $keyType = 'int';
    public $timestamps = false;

    protected $fillable = [
        'id_factura','fecha','id_cliente','id_forma_pago',
        'numero_items_factura','id_pago','monto_total_producto','monto_final'
    ];
}
