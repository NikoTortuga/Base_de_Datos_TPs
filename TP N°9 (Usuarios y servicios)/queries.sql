use usuarios;

-- Ejercicio 1: Crear un usuario sin privilegios específicos
CREATE USER 'usuario_generico'@'localhost' IDENTIFIED BY 'contrasenia';

-- Ejercicio 2: Crear un usuario con privilegios de lectura sobre la base pubs
CREATE USER 'usuario_lectura'@'localhost' IDENTIFIED BY 'contrasenia_lectura';
GRANT SELECT ON usuarios.* TO 'usuario_lectura'@'localhost';

-- Ejercicio 3: Crear un usuario con privilegios de escritura sobre la base pubs
CREATE USER 'usuario_escritura'@'localhost' IDENTIFIED BY 'contrasenia_escritura';
GRANT INSERT, UPDATE, DELETE ON usuarios.* TO 'usuario_escritura'@'localhost';

-- Ejercicio 4: Crear un usuario con todos los privilegios sobre la base pubs
CREATE USER 'usuario_privilegio'@'localhost' IDENTIFIED BY 'contrasenia_privilegio';
GRANT ALL PRIVILEGES ON usuarios.* TO 'usuario_privilegio'@'localhost';

-- Ejercicio 5: Crear un usuario con privilegios de lectura sobre la tabla titles
CREATE USER 'usuario_lectura_tabla'@'localhost' IDENTIFIED BY 'contrasenia_lectura_tabla';
GRANT SELECT ON usuarios.titles TO 'usuario_lectura_tabla'@'localhost';

-- Ejercicio 6: Eliminar al usuario que tiene todos los privilegios sobre la base pubs
DROP USER 'usuario_privilegio'@'localhost';

-- Ejercicio 7: Eliminar a dos usuarios a la vez
DROP USER 'usuario_lectura_tabla'@'localhost', 'usuario_generico'@'localhost';

-- Ejercicio 8: Eliminar un usuario y sus privilegios asociados
DROP USER 'usuario_lectura'@'localhost';

-- Ejercicio 9: Revisar los privilegios de un usuario
SHOW GRANTS FOR 'usuario_escritura'@'localhost';
