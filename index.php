<?php
require_once __DIR__ . '/app/bootstrap.php';

$controller = isset($_GET['controller']) ? strtolower($_GET['controller']) : 'home';
$action = isset($_GET['action']) ? $_GET['action'] : 'index';

// Cargar controlador
load_controller($controller);
$controllerClass = ucfirst($controller) . 'Controller';
if (!class_exists($controllerClass)) {
    echo "Controlador no encontrado: $controllerClass";
    exit;
}

$db = (new Database())->getConnection();
$ctrl = new $controllerClass($db);

if (!method_exists($ctrl, $action)) {
    echo "Acción no encontrada: $action";
    exit;
}

$ctrl->$action();

?>
