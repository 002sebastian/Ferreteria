<?php
namespace App\Models;
use Illuminate\Database\Eloquent\Model;

class FormaPago extends Model
{
    protected $table = 'forma_pago';
    protected $primaryKey = 'id_forma_pago';
    public $incrementing = false;
    protected $keyType = 'int';
    public $timestamps = false;

    protected $fillable = ['id_forma_pago','forma','descripcion'];
}
