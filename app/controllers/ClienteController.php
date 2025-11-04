<?php
require_once __DIR__ . '/../models/clientemodel.php';

class ClienteController {
    private $clienteModel;

    public function __construct($db) {
        $this->clienteModel = new ClienteModel($db);
    }

    public function listar() {
        $clientes = $this->clienteModel->getAll();
        include VIEW_PATH . 'Clientes/listar.php';
    }

    public function agregar() {
        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            $data = [
                'id_ferreteria' => 1,
                'nit' => filter_input(INPUT_POST, 'nit', FILTER_SANITIZE_STRING),
                'nombre' => filter_input(INPUT_POST, 'nombre', FILTER_SANITIZE_STRING),
                'direccion' => filter_input(INPUT_POST, 'direccion', FILTER_SANITIZE_STRING),
                'telefono' => filter_input(INPUT_POST, 'telefono', FILTER_SANITIZE_STRING),
                'estado' => 1,
                'fecha_registro' => date('Y-m-d H:i:s')
            ];

            if ($this->clienteModel->create($data)) {
                header('Location: index.php?controller=home&action=index&exito=1');
            } else {
                header('Location: index.php?controller=cliente&action=agregar&error=1');
            }
            exit;
        }

        include VIEW_PATH . 'Clientes/agregar.php';
    }
}
?>