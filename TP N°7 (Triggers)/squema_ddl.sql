DROP DATABASE IF EXISTS testDisparador;
CREATE DATABASE testDisparador;

USE testDisparador;

CREATE TABLE alumnos (
id_alumno int unsigned auto_increment primary key,
nombre VARCHAR(50),
apellido VARCHAR(50),
nota DECIMAL (4,2)
)
