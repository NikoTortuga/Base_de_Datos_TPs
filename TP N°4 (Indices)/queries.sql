use editoriales;

-- Ejercicio 1
CREATE INDEX idx_libros_id_editorial_titulo
ON libros (id_editorial, titulo);

-- Ejercicio 2
CREATE INDEX idx_libros_fecha_publicacion
ON libros (fecha_publicacion);

-- Ejercicio 3
-- DROP INDEX idx_libros_id_editorial_titulo
-- ON libros;
-- No se puede eliminar porque es necesaria para la tabla de libros por su foraing key

-- Ejercicio 4
-- CREATE UNIQUE INDEX idx_libros_id_editorial_titulo 
-- ON libros (id_editorial);
-- No se puede actualizar un indice 

-- Ejercicio 5
-- No existe un alter index

-- Ejercicio 6
CREATE UNIQUE INDEX idx_editoriales_id_editorial
ON editoriales (id_editorial);

-- Ejercicio 7
-- ALTER TABLE libros
-- ADD PRIMARY KEY (id_libro);
-- No es necesario crear una porque ya existe