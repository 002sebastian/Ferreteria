<?php
class HomeController {
    private $db;
    public function __construct($db){
        $this->db = $db;
    }

    public function index(){
        // Cargar modelos
        require_once __DIR__ . '/../models/productomodel.php';
        require_once __DIR__ . '/../models/clientemodel.php';

        $p = new ProductoModel($this->db);
        $c = new ClienteModel($this->db);

        $products = $p->getAll();
        $clients = $c->getAll();

        include VIEW_PATH . 'dashboard.php';
    }
}

?>
