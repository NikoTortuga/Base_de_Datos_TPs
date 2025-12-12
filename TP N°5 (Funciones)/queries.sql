use pubs_funciones;

-- Ejercicio 1 
DELIMITER $$
CREATE FUNCTION regalía_total_autor(p_au_id INT)
RETURNS FLOAT
DETERMINISTIC
BEGIN
    DECLARE total FLOAT;
    SELECT SUM( (ta.royaltyper/100) * t.royalty * IFNULL(t.ytd_sales,0) )
    INTO total
    FROM titleauthor ta
    JOIN titles t ON ta.title_id = t.title_id
    WHERE ta.au_id = p_au_id;
    RETURN IFNULL(total,0);
END$$
DELIMITER ;

SELECT au_id, regalía_total_autor(au_id) AS total_regalias
FROM titleauthor;

-- Ejercicio 2
DELIMITER $$
CREATE FUNCTION precio_max_por_tipo(p_type VARCHAR(12))
RETURNS FLOAT
DETERMINISTIC
BEGIN
    DECLARE maximo FLOAT;
    SELECT MAX(price)
    INTO maximo
    FROM titles
    WHERE type = p_type;
    RETURN maximo;
END$$
DELIMITER ;

SELECT type, precio_max_por_tipo(type) AS precio_maximo
FROM titles
GROUP BY type;


-- Ejercicio 3
DELIMITER $$
CREATE FUNCTION ingreso_por_titulo(p_title_id INT)
RETURNS FLOAT
DETERMINISTIC
BEGIN
    DECLARE ingreso FLOAT;
    SELECT SUM(s.qty * t.price)
    INTO ingreso
    FROM sales s
    JOIN titles t ON s.title_id = t.title_id
    WHERE s.title_id = p_title_id;
    RETURN IFNULL(ingreso,0);
END$$
DELIMITER ;

SELECT title_id, title, ingreso_por_titulo(title_id) AS ingreso
FROM titles;

-- Ejercicio 4
DELIMITER $$
CREATE FUNCTION nombre_completo_empleado(p_emp_id INT)
RETURNS VARCHAR(80)
DETERMINISTIC
BEGIN
    DECLARE nombre VARCHAR(80);
    SELECT CONCAT(fname, ' ', IFNULL(minit,''), ' ', lname)
    INTO nombre
    FROM employee
    WHERE emp_id = p_emp_id;
    RETURN nombre;
END$$
DELIMITER ;

SELECT emp_id, nombre_completo_empleado(emp_id) AS nombre
FROM employee;

-- Ejercicio 5:

DELIMITER $$
CREATE FUNCTION promedio_precio_editorial(p_pub_id CHAR(4))
RETURNS FLOAT
DETERMINISTIC
BEGIN
    DECLARE promedio FLOAT;
    SELECT AVG(price)
    INTO promedio
    FROM titles
    WHERE pub_id = p_pub_id;
    RETURN promedio;
END$$
DELIMITER ;

SELECT pub_id, pub_name, promedio_precio_editorial(pub_id) AS precio_promedio
FROM publishers;



