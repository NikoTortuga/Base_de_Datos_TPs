use integridad_referencial;
-- Ejercicios sobre integridad referencial

-- 1 Eliminar una editorial: Si se elimina una editorial de la tabla editoriales
-- ¿qué sucede con los libros asociados? Escriba una consulta SQL que elimine una editorial y sus libros relacionados.
DELETE FROM editoriales
WHERE id_editorial = 1;
-- Se eliminan de todas las tablas correspondientes

-- 2 Actualizar el nombre de una editorial: Si se actualiza el nombre de una editorial en la tabla editoriales,
-- ¿qué sucede con los libros relacionados?
UPDATE editoriales
SET nombre_editorial = 'Editorial Buenos Aires'
WHERE id_editorial = 2;
-- Los libros no se ven afectados porque estan relacionados mediante el id

-- 3 Eliminar un empleado: Si se elimina un empleado de la tabla empleados, 
-- ¿qué sucede con los libros relacionados con esa editorial?
DELETE FROM empleados
WHERE id_empleado = 1;
-- Los libros no se ven afectados

-- 4 Actualizar el nombre de un empleado: Si se actualiza el nombre de un empleado en la tabla empleados, 
-- ¿qué sucede con los libros relacionados con esa editorial?
UPDATE empleados
SET nombre_empleado = 'Juan Torres'
WHERE id_empleado = 2;
-- Los libros no se ven afectados

-- 5 Eliminar un libro: Si se elimina un libro de la tabla libros,
-- ¿qué sucede con la relación con la editorial?
DELETE FROM libros WHERE id_libro = 5;
-- Ya no tiene relacion con la editorial

-- 6 Cambiar la editorial de un libro: Si se cambia la editorial a la que está asociado un libro en la tabla libros,
-- ¿qué sucede con la relación con la editorial anterior?
UPDATE libros SET id_editorial = 3 WHERE id_libro = 1;
-- Cambia la editorial del libro

-- 7 Eliminar una editorial con empleados:
-- Si se intenta eliminar una editorial que tiene empleados asociados, ¿qué sucede?
DELETE FROM editoriales
WHERE id_editorial = 4;
-- Se elimina la editorial, los empleados y los libros.

-- 8 Eliminar un empleado con libros:
-- Si se intenta eliminar un empleado que tiene libros asociados, ¿qué sucede?
DELETE FROM empleados
WHERE id_empleado = 5;
-- Solo se elimina el empleado, los libros permanecen

-- 9 Eliminar una editorial y sus empleados:
-- ¿Cómo se eliminaría una editorial y todos sus empleados?
DELETE FROM editoriales
WHERE id_editorial = 6;
-- Se elimina todo editorial, empleados y libros.

-- 10 Eliminar una editorial y transferir sus empleados a otra editorial:
-- ¿Cómo se eliminaría una editorial y reasignaría a sus empleados a otra editorial?
UPDATE empleados
SET id_editorial = 2
WHERE id_editorial = 7;
DELETE FROM editoriales
WHERE id_editorial = 7;
-- Se transfieren correctamente. 

-- Verificar
show tables;
select * from editoriales;
select * from empleados;
select * from libros;