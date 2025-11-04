<?php
// Configuración básica
session_start();

// Incluir configuraciones
require_once '../app/config/Database.php';

// Conectar a la base de datos
$database = new Database();
$db = $database->getConnection();

// Obtener controlador y acción
$controller = $_GET['controller'] ?? 'producto';
$action = $_GET['action'] ?? 'listar';

// Cargar controlador
$controllerFile = "../app/controllers/" . ucfirst($controller) . "Controller.php";

if (file_exists($controllerFile)) {
    require_once $controllerFile;
    
    $controllerClass = ucfirst($controller) . "Controller";
    $controllerInstance = new $controllerClass($db);
    
    if (method_exists($controllerInstance, $action)) {
        $controllerInstance->$action();
    } else {
        echo "❌ Acción no encontrada";
    }
} else {
    echo "❌ Controlador no encontrado";
}
?>


