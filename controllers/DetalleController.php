<?php

namespace Controllers;

use Exception;
use Model\Dependencia;
use MVC\Router;

class DetalleController {

    public static function estadisticas(Router $router){
        $router->render('dependencias/estadisticas');
    }
   
    public static function detalleOperacionesAPI(){
        try{
            $sql = 'SELECT dep_nombre AS dependencia, SUM(detalle_cantidad) AS cantidad
                    FROM detalle_operaciones
                    INNER JOIN dependencias ON detalle_dependencia = dep_id
                    WHERE detalle_situacion = 1
                    GROUP BY dep_nombre';
    
            $datos = Dependencia::fetchArray($sql);
    
            echo json_encode($datos);
        } catch (Exception $e){
            echo json_encode([
                'detalle' => $e->getMessage(),
                'mensaje' => 'Ocurrió un error',
                'codigo' => 0
            ]);
        }
    }

}



