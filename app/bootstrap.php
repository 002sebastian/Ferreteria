<?php
// Bootstrap del pequeño framework
define('BASE_PATH', realpath(__DIR__ . '/..') . DIRECTORY_SEPARATOR);
define('APP_PATH', BASE_PATH . 'app' . DIRECTORY_SEPARATOR);
define('VIEW_PATH', BASE_PATH . 'view' . DIRECTORY_SEPARATOR);

// Cargar configuración de BD
require_once __DIR__ . '/Config/Database.php';

// Función simple de carga de modelos/controladores si se necesita
function load_model($name){
    $file = __DIR__ . '/models/' . strtolower($name) . '.php';
    if(file_exists($file)) require_once $file;
}

function load_controller($name){
    $file = __DIR__ . '/Controllers/' . ucfirst(strtolower($name)) . 'Controller.php';
    if(file_exists($file)) require_once $file;
}

// Evitar salida extra
ob_start();

?>
