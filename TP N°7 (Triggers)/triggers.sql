USE triggers;
USE testDisparador;

--TRIGGER 1

DELIMITER $$
CREATE TRIGGER trigger_check_nota_before_insert
BEFORE INSERT ON alumnos
FOR EACH ROW 
BEGIN 
IF NEW.nota < 0 THEN
 SET NEW.nota = 0 ;
ELSEIF NEW.nota > 10 THEN
 SET NEW.nota = 10;
 END if;
 END $$
DELIMITER ;

-- TRIGGER 2

DELIMITER $$
CREATE TRIGGER trigger_check_nota_before_update
BEFORE UPDATE ON alumnos
FOR EACH ROW 
BEGIN 
IF NEW.nota < 0 THEN
 SET NEW.nota = 0 ;
ELSEIF NEW.nota > 10 THEN
 SET NEW.nota = 10;
 END if;
 END $$
DELIMITER ;

INSERT INTO alumnos(id_alumno, nombre, apellido, nota)
values (1, "Niko", "Arias",-12);

INSERT INTO alumnos(id_alumno, nombre, apellido, nota)
Values (2, "juan", "Saenz", 21);

UPDATE alumnos
SET nota = 14
WHERE id_alumno = 1;

