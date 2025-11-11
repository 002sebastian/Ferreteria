<?php
namespace App\Models;
use Illuminate\Database\Eloquent\Model;

class Producto extends Model
{
    protected $table = 'producto';
    protected $primaryKey = 'id_producto';
    public $incrementing = false;
    protected $keyType = 'int';
    public $timestamps = false;

    protected $fillable = ['id_producto','nombre','precio_compra','precio_venta','id_categoria','codigo','stock'];

    public function categoria(){ return $this->belongsTo(Categoria::class, 'id_categoria'); }
}
