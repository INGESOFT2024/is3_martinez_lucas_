create database IS3_martinez_lucas;

CREATE TABLE dependencias (
    dep_id SERIAL NOT NULL,
    dep_nombre VARCHAR (50) NOT NULL,
    dep_situacion SMALLINT DEFAULT 1,
    PRIMARY KEY (dep_id)
);

INSERT INTO dependencias (dep_nombre) values ('PRIMERA BRIGADA DE INFANTERIA');
INSERT INTO dependencias (dep_nombre) values ('SEGUNDA BRIGADA DE INFANTERIA');
INSERT INTO dependencias (dep_nombre) values ('TERCERA BRIGADA DE INFANTERIA');
INSERT INTO dependencias (dep_nombre) values ('CUARTA BRIGADA DE INFANTERIA');
SELECT * FROM dependencias;

CREATE TABLE operaciones (
    op_id SERIAL NOT NULL,
    op_fecha DATETIME YEAR TO MINUTE,
    op_situacion SMALLINT DEFAULT 1 NOT NULL,
    PRIMARY KEY (op_id)
);

INSERT INTO operaciones (op_fecha) values (current);
INSERT INTO operaciones (op_fecha) values (current);

CREATE TABLE detalle_operaciones (
    detalle_id SERIAL NOT NULL,
    detalle_operacion INTEGER,
    detalle_dependencia INTEGER,
    detalle_cantidad INTEGER,
    detalle_situacion SMALLINT DEFAULT 1,
    PRIMARY KEY (detalle_id),
    FOREIGN KEY (detalle_operacion) REFERENCES operaciones (op_id),
    FOREIGN KEY (detalle_dependencia) REFERENCES dependencias (dep_id)
);
INSERT INTO detalle_operaciones (detalle_operacion, detalle_dependencia, detalle_cantidad) values (1,1,100);
INSERT INTO detalle_operaciones (detalle_operacion, detalle_dependencia, detalle_cantidad) values (1,2,112);
INSERT INTO detalle_operaciones (detalle_operacion, detalle_dependencia, detalle_cantidad) values (2,3,98);
INSERT INTO detalle_operaciones (detalle_operacion, detalle_dependencia, detalle_cantidad) values (2,4,125);

SELECT * FROM detalle_operaciones;

SELECT dep_nombre AS dependencia, SUM(detalle_cantidad) AS cantidad
FROM detalle_operaciones
INNER JOIN dependencias ON detalle_dependencia = dep_id
WHERE detalle_situacion = 1
GROUP BY dep_nombre;
