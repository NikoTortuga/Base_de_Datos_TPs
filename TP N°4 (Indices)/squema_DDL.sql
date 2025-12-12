drop database if exists editoriales;
create database editoriales; 
use editoriales; 

CREATE TABLE editoriales ( 
id_editorial INT PRIMARY KEY,
 nombre_editorial VARCHAR(255) NOT NULL );
 
 CREATE TABLE libros ( 
 id_libro INT PRIMARY KEY, 
 id_editorial INT, 
 titulo VARCHAR(255) NOT NULL, 
 fecha_publicacion DATE, 
 FOREIGN KEY (id_editorial) REFERENCES editoriales(id_editorial) );

show index from editoriales;
show index from libros;