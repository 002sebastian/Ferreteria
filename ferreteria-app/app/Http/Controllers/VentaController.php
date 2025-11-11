<?php
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Models\Producto;
use App\Models\Categoria; 
use App\Models\Cliente;
use App\Models\FormaPago;
use App\Models\Pedido;
use App\Models\DetallePedido;
use App\Models\DetallesDePago;
use App\Models\Factura;

class VentaController extends Controller
{
    // Helpers: obtener siguiente ID (porque NO hay AUTO_INCREMENT)
    private function nextId($modelClass, $pk)
    {
        return (int) ($modelClass::max($pk) ?? 0) + 1;
    }

    // Mostrar carrito (desde sesión) y catálogo reducido para agregar rápido
    public function index(Request $req)
    {
        $cart = $req->session()->get('cart', []); // [id_producto => ['nombre','precio','iva','cantidad']]
        $productos = Producto::with('categoria')->orderBy('nombre')->limit(20)->get();
        return view('venta.index', compact('cart','productos'));
    }

    // Agregar producto al carrito
    public function agregar(Request $req)
    {
        $data = $req->validate([
            'id_producto' => 'required|integer|exists:producto,id_producto',
            'cantidad'    => 'required|integer|min:1',
        ]);

        $p = Producto::with('categoria')->findOrFail($data['id_producto']);
        $iva = $p->categoria?->iva ?? 0; // porcentaje (ej. 19.00)
        $cart = $req->session()->get('cart', []);

        if(isset($cart[$p->id_producto])){
            $cart[$p->id_producto]['cantidad'] += $data['cantidad'];
        } else {
            $cart[$p->id_producto] = [
                'nombre'   => $p->nombre,
                'precio'   => (float)$p->precio_venta,
                'iva'      => (float)$iva,
                'cantidad' => (int)$data['cantidad'],
            ];
        }

        $req->session()->put('cart', $cart);
        return back()->with('ok','Producto agregado');
    }

    // Actualizar cantidades del carrito
    public function actualizar(Request $req)
    {
        $items = $req->input('items', []); // items[id_producto] = cantidad
        $cart  = $req->session()->get('cart', []);

        foreach($items as $idProd => $cant){
            if(isset($cart[$idProd])){
                $cant = (int)$cant;
                if($cant < 1) $cant = 1;
                $cart[$idProd]['cantidad'] = $cant;
            }
        }
        $req->session()->put('cart', $cart);
        return back()->with('ok','Cantidades actualizadas');
    }

    // Quitar un producto del carrito
    public function quitar(Request $req)
    {
        $id = (int)$req->input('id_producto');
        $cart = $req->session()->get('cart', []);
        unset($cart[$id]);
        $req->session()->put('cart', $cart);
        return back()->with('ok','Producto quitado');
    }

    // Pantalla de checkout: totales + elección de cliente y forma de pago
    public function checkout(Request $req)
    {
        $cart = $req->session()->get('cart', []);
        if(empty($cart)) return redirect()->route('venta.index')->with('ok','Carrito vacío');

        // Cargar combos
        $clientes   = Cliente::orderBy('nombre')->get(['id_cliente','nombre']);
        $formasPago = FormaPago::orderBy('forma')->get(['id_forma_pago','forma']);

        // Calcular totales
        $resumen = $this->totales($cart);

        return view('venta.checkout', compact('cart','clientes','formasPago','resumen'));
    }

    // Calcular subtotal, impuestos y total final (IVA por ítem según categoría)
    private function totales(array $cart)
    {
        $subtotal = 0; $ivaTotal = 0;
        foreach($cart as $id => $it){
            $line = $it['precio'] * $it['cantidad'];
            $subtotal += $line;
            $ivaTotal += $line * (($it['iva'] ?? 0)/100);
        }
        $total = $subtotal + $ivaTotal;
        $items = array_sum(array_column($cart, 'cantidad'));
        return compact('subtotal','ivaTotal','total','items');
    }

    // FACTURAR: crea pedido, sus detalles, (opcional pago), y la factura
    public function facturar(Request $req)
    {
        $req->validate([
            'id_cliente'    => 'nullable|integer|exists:cliente,id_cliente',
            'id_forma_pago' => 'nullable|integer|exists:forma_pago,id_forma_pago',
        ]);

        $cart = $req->session()->get('cart', []);
        if(empty($cart)) return redirect()->route('venta.index')->with('ok','Carrito vacío');

        $resumen = $this->totales($cart);

        DB::beginTransaction();
        try {
            // Crear pedido (cabecera). Campos opcionales (id_estado, id_ferreteria) los dejamos null si no los usas aún
            $idPedido = $this->nextId(Pedido::class, 'id_pedido');
            $pedido = Pedido::create([
                'id_pedido'    => $idPedido,
                'id_cliente'   => $req->input('id_cliente'),
                'fecha_pedido' => now()->format('Y-m-d H:i:s'),
                'id_estado'    => null,
                'id_ferreteria'=> null,
            ]);

            // Detalles del pedido (respeta columna generada 'total')
            $idDetalle = $this->nextId(DetallePedido::class, 'id_detalle_pedido');
            foreach($cart as $idProd => $it){
                DetallePedido::create([
                    'id_detalle_pedido' => $idDetalle++,
                    'id_pedido'         => $pedido->id_pedido,
                    'id_producto'       => (int)$idProd,
                    'cantidad'          => (int)$it['cantidad'],
                    'precio_unitario'   => (float)$it['precio'],
                    'descuento'         => 0,
                ]);
            }

            // (Opcional) Crear registro de pago (si eligió forma de pago)
            $idPago = null;
            if($req->filled('id_forma_pago')){
                $idPago = $this->nextId(DetallesDePago::class, 'id_pago');
                DetallesDePago::create([
                    'id_pago'       => $idPago,
                    'monto'         => $resumen['total'],
                    'fecha_pago'    => now()->toDateString(),
                    'id_forma_pago' => (int)$req->input('id_forma_pago'),
                ]);
            }

            // Crear factura
            $idFactura = $this->nextId(Factura::class, 'id_factura');
            Factura::create([
                'id_factura'           => $idFactura,
                'fecha'                => now()->toDateString(),
                'id_cliente'           => $req->input('id_cliente'),
                'id_forma_pago'        => $req->input('id_forma_pago'),
                'numero_items_factura' => $resumen['items'],
                'id_pago'              => $idPago,
                'monto_total_producto' => $resumen['subtotal'], // sin IVA
                'monto_final'          => $resumen['total'],    // con IVA
            ]);

            DB::commit();
            // Limpiar carrito
            $req->session()->forget('cart');

            return redirect()->route('productos.index')->with('ok',"Factura #$idFactura creada");
        } catch (\Throwable $e){
            DB::rollBack();
            report($e);
            return back()->withErrors('No se pudo facturar: '.$e->getMessage());
        }
    }
}
