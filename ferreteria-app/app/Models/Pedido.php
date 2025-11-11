<?php
namespace App\Models;
use Illuminate\Database\Eloquent\Model;

class Pedido extends Model
{
    protected $table = 'pedido';
    protected $primaryKey = 'id_pedido';
    public $incrementing = false;
    protected $keyType = 'int';
    public $timestamps = false;

    protected $fillable = ['id_pedido','id_cliente','fecha_pedido','id_estado','id_ferreteria'];

    public function detalles(){ return $this->hasMany(DetallePedido::class, 'id_pedido'); }
}
