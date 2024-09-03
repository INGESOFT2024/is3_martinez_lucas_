<?php

namespace Controllers;

use MVC\Router;

class DependenciaController {
    public static function index(Router $router){
        $router->render('dependencias/index', []);
    }

}