drop database if exists integridad_referencial;
Create database integridad_referencial;
use integridad_referencial;

CREATE TABLE editoriales (
    id_editorial INT AUTO_INCREMENT,
    nombre_editorial VARCHAR(100) NOT NULL,
    PRIMARY KEY (id_editorial)
);

CREATE TABLE empleados (
    id_empleado INT AUTO_INCREMENT,
    nombre_empleado VARCHAR(100) NOT NULL,
    id_editorial INT NOT NULL,
    PRIMARY KEY (id_empleado),
    CONSTRAINT fk_empleado_editorial 
        FOREIGN KEY (id_editorial)
        REFERENCES editoriales(id_editorial)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE libros (
    id_libro INT AUTO_INCREMENT,
    titulo_libro VARCHAR(200) NOT NULL,
    id_editorial INT NOT NULL,
    PRIMARY KEY (id_libro),
    CONSTRAINT fk_libro_editorial
        FOREIGN KEY (id_editorial)
        REFERENCES editoriales(id_editorial) 
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

