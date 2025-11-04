<?php
class ClienteController {
    private $clienteModel;
    
    public function __construct($db) {
        $this->clienteModel = new ClienteModel($db);
    }
    
    public function listar() {
        $clientes = $this->clienteModel->getAll();
        include '../views/clientes/listar.php';
    }
    
    public function agregar() {
        if ($_POST) {
            $data = [
                'id_ferreteria' => 1,
                'nit' => $_POST['nit'],
                'nombre' => $_POST['nombre'],
                'direccion' => $_POST['direccion'],
                'telefono' => $_POST['telefono'],
                'estado' => 'Activo',
                'fecha_registro' => date('Y-m-d')
            ];
            
            if ($this->clienteModel->create($data)) {
                header('Location: index.php?controller=cliente&action=listar&exito=1');
            } else {
                header('Location: index.php?controller=cliente&action=agregar&error=1');
            }
            exit;
        }
        include '../views/clientes/agregar.php';
    }
}
?>