<?php

namespace Model;

class Dependencia extends ActiveRecord
{
    protected static $tabla = 'dependencias';
    protected static $idTabla = 'dep_id';
    protected static $columnasDB = ['dep_nombre', 'producto_situacion' ];

    public $dep_id;
    public $dep_nombre;
    public $dep_situacion;


    public function __construct($args = [])
    {
        $this->dep_id = $args['dep_id'] ?? null;
        $this->dep_nombre = $args['dep_nombre'] ?? '';
        $this->dep_situacion = $args['dep_situacion'] ?? 0;
    }
}