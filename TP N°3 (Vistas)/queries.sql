use vistas;
-- Ejercicio 1
CREATE OR REPLACE VIEW vista_titulo_autor_precio AS
SELECT 
    t.title AS titulo,
    CONCAT(a.au_fname, ' ', a.au_lname) AS autor,
    t.price AS precio
FROM titles t
LEFT JOIN titleauthor ta ON t.title_id = ta.title_id
LEFT JOIN authors a ON ta.au_id = a.au_id;

select * from vista_titulo_autor_precio;

-- Ejercicio 2
CREATE OR REPLACE VIEW vista_titulo_autor_precio_tipo AS
SELECT 
    t.title AS titulo,
    CONCAT(a.au_fname, ' ', a.au_lname) AS autor,
    t.price AS precio,
    t.type AS tipo
FROM titles t
LEFT JOIN titleauthor ta ON t.title_id = ta.title_id
LEFT JOIN authors a ON ta.au_id = a.au_id;

select * from vista_titulo_autor_precio_tipo;

-- Ejercicio 3
CREATE OR REPLACE VIEW vista_titulo_autor_precio_fecha AS
SELECT 
    t.title AS titulo,
    CONCAT(a.au_fname, ' ', a.au_lname) AS autor,
    t.price AS precio,
    t.pubdate AS fecha_publicacion
FROM titles t
LEFT JOIN titleauthor ta ON t.title_id = ta.title_id
LEFT JOIN authors a ON ta.au_id = a.au_id;

select * from vista_titulo_autor_precio_fecha;

-- Ejercicio 4
CREATE OR REPLACE VIEW vista_libros_ventas AS
SELECT 
    t.title AS titulo,
    CONCAT(a.au_fname, ' ', a.au_lname) AS autor,
    t.price AS precio,
    SUM(s.qty) AS cantidad_vendida
FROM titles t
LEFT JOIN titleauthor ta ON t.title_id = ta.title_id
LEFT JOIN authors a ON ta.au_id = a.au_id
LEFT JOIN sales s ON t.title_id = s.title_id
GROUP BY t.title, autor, t.price;

select * from vista_libros_ventas;

-- Ejercicio 5
CREATE OR REPLACE VIEW vista_ventas_por_tienda AS
SELECT 
    st.stor_name AS tienda,
    t.title AS titulo,
    CONCAT(a.au_fname, ' ', a.au_lname) AS autor,
    t.price AS precio,
    SUM(s.qty) AS cantidad_vendida
FROM sales s
JOIN stores st ON s.stor_id = st.stor_id
JOIN titles t ON s.title_id = t.title_id
LEFT JOIN titleauthor ta ON t.title_id = ta.title_id
LEFT JOIN authors a ON ta.au_id = a.au_id
GROUP BY tienda, titulo, autor, precio;

select * from vista_ventas_por_tienda;

-- Ejercicio 6
CREATE OR REPLACE VIEW vista_ventas_por_tipo AS
SELECT
    t.type AS tipo,
    t.title AS titulo,
    CONCAT(a.au_fname, ' ', a.au_lname) AS autor,
    t.price AS precio,
    SUM(s.qty) AS cantidad_vendida
FROM titles t
JOIN sales s ON s.title_id = t.title_id
LEFT JOIN titleauthor ta ON t.title_id = ta.title_id
LEFT JOIN authors a ON ta.au_id = a.au_id
GROUP BY tipo, titulo, autor, precio;

select * from vista_ventas_por_tipo;

-- Ejercicio 7
CREATE OR REPLACE VIEW vista_ventas_tienda_tipo AS
SELECT
    st.stor_name AS tienda,
    t.type AS tipo,
    t.title AS titulo,
    CONCAT(a.au_fname, ' ', a.au_lname) AS autor,
    t.price AS precio,
    SUM(s.qty) AS cantidad_vendida
FROM sales s
JOIN stores st ON s.stor_id = st.stor_id
JOIN titles t ON s.title_id = t.title_id
LEFT JOIN titleauthor ta ON t.title_id = ta.title_id
LEFT JOIN authors a ON ta.au_id = a.au_id
GROUP BY tienda, tipo, titulo, autor, precio;

select * from vista_ventas_tienda_tipo;

-- Ejercicio 8
CREATE OR REPLACE VIEW vista_ventas_tienda_anio AS
SELECT
    st.stor_name AS tienda,
    YEAR(t.pubdate) AS anio_publicacion,
    t.title AS titulo,
    CONCAT(a.au_fname, ' ', a.au_lname) AS autor,
    t.price AS precio,
    SUM(s.qty) AS cantidad_vendida
FROM sales s
JOIN stores st ON s.stor_id = st.stor_id
JOIN titles t ON s.title_id = t.title_id
LEFT JOIN titleauthor ta ON t.title_id = ta.title_id
LEFT JOIN authors a ON ta.au_id = a.au_id
GROUP BY tienda, anio_publicacion, titulo, autor, precio;

select * from vista_ventas_tienda_anio;

-- Ejercicio 9
CREATE OR REPLACE VIEW vista_ventas_tienda_tipo_anio AS
SELECT
    st.stor_name AS tienda,
    t.type AS tipo,
    YEAR(t.pubdate) AS anio_publicacion,
    t.title AS titulo,
    CONCAT(a.au_fname, ' ', a.au_lname) AS autor,
    t.price AS precio,
    SUM(s.qty) AS cantidad_vendida
FROM sales s
JOIN stores st ON s.stor_id = st.stor_id
JOIN titles t ON s.title_id = t.title_id
LEFT JOIN titleauthor ta ON t.title_id = ta.title_id
LEFT JOIN authors a ON ta.au_id = a.au_id
GROUP BY tienda, tipo, anio_publicacion, titulo, autor, precio;

select * from vista_ventas_tienda_tipo_anio;

-- Ejercicio 10
CREATE OR REPLACE VIEW vista_ventas_tienda_tipo_anio_mes AS
SELECT
    st.stor_name AS tienda,
    t.type AS tipo,
    YEAR(t.pubdate) AS anio_publicacion,
    MONTH(t.pubdate) AS mes_publicacion,
    t.title AS titulo,
    CONCAT(a.au_fname, ' ', a.au_lname) AS autor,
    t.price AS precio,
    SUM(s.qty) AS cantidad_vendida
FROM sales s
JOIN stores st ON s.stor_id = st.stor_id
JOIN titles t ON s.title_id = t.title_id
LEFT JOIN titleauthor ta ON t.title_id = ta.title_id
LEFT JOIN authors a ON ta.au_id = a.au_id
GROUP BY tienda, tipo, anio_publicacion, mes_publicacion, titulo, autor, precio;

select * from vista_ventas_tienda_tipo_anio_mes;

-- Ejercicio 11
CREATE OR REPLACE VIEW vista_ventas_mas_10 AS
SELECT 
    t.title,
    CONCAT(a.au_fname, ' ', a.au_lname) AS autor,
    t.price,
    s.qty AS cantidad_vendida,
    st.stor_name AS tienda,
    t.type AS tipo_libro,
    YEAR(t.pubdate) AS anio_publicacion
FROM sales s
JOIN titles t ON s.title_id = t.title_id
JOIN titleauthor ta ON t.title_id = ta.title_id
JOIN authors a ON ta.au_id = a.au_id
JOIN stores st ON s.stor_id = st.stor_id
WHERE s.qty > 10;

select * from vista_ventas_mas_10;

-- Ejercicio 12
CREATE OR REPLACE VIEW vista_ventas_1990 AS
SELECT 
    t.title,
    CONCAT(a.au_fname, ' ', a.au_lname) AS autor,
    t.price,
    s.qty AS cantidad_vendida,
    st.stor_name AS tienda,
    t.type AS tipo_libro,
    YEAR(t.pubdate) AS anio_publicacion
FROM sales s
JOIN titles t ON s.title_id = t.title_id
JOIN titleauthor ta ON t.title_id = ta.title_id
JOIN authors a ON ta.au_id = a.au_id
JOIN stores st ON s.stor_id = st.stor_id
WHERE YEAR(s.ord_date) = 1990;

select * from vista_ventas_1990;

-- Ejercicio 13
CREATE OR REPLACE VIEW vista_ventas_90_94 AS
SELECT 
    t.title,
    CONCAT(a.au_fname, ' ', a.au_lname) AS autor,
    t.price,
    s.qty AS cantidad_vendida,
    st.stor_name AS tienda,
    t.type AS tipo_libro,
    YEAR(t.pubdate) AS anio_publicacion
FROM sales s
JOIN titles t ON s.title_id = t.title_id
JOIN titleauthor ta ON t.title_id = ta.title_id
JOIN authors a ON ta.au_id = a.au_id
JOIN stores st ON s.stor_id = st.stor_id
WHERE YEAR(s.ord_date) BETWEEN 1990 AND 1994;

select * from vista_ventas_90_94;

-- Ejercicio 14
CREATE OR REPLACE VIEW vista_ventas_tienda_7066 AS
SELECT 
    t.title,
    CONCAT(a.au_fname, ' ', a.au_lname) AS autor,
    t.price,
    s.qty AS cantidad_vendida,
    st.stor_name AS tienda,
    t.type AS tipo_libro,
    YEAR(t.pubdate) AS anio_publicacion
FROM sales s
JOIN titles t ON s.title_id = t.title_id
JOIN titleauthor ta ON t.title_id = ta.title_id
JOIN authors a ON ta.au_id = a.au_id
JOIN stores st ON s.stor_id = st.stor_id
WHERE s.stor_id = 7066;

select * from vista_ventas_tienda_7066;

-- Ejercicio 15
CREATE OR REPLACE VIEW vista_ventas_autor_172 AS
SELECT 
    t.title,
    CONCAT(a.au_fname, ' ', a.au_lname) AS autor,
    t.price,
    s.qty AS cantidad_vendida,
    st.stor_name AS tienda,
    t.type AS tipo_libro,
    YEAR(t.pubdate) AS anio_publicacion
FROM sales s
JOIN titles t ON s.title_id = t.title_id
JOIN titleauthor ta ON t.title_id = ta.title_id
JOIN authors a ON ta.au_id = a.au_id
JOIN stores st ON s.stor_id = st.stor_id
WHERE a.au_id = 172;

select * from vista_ventas_autor_172;

-- Ejercicio 16
CREATE OR REPLACE VIEW vista_update_precio AS
SELECT title_id, title, price
FROM titles;

select * from vista_update_precio;

-- Ejercicio 17
CREATE OR REPLACE VIEW vista_update_autor AS
SELECT au_id, au_fname, au_lname
FROM authors;

select * from vista_update_autor;

-- Ejercicio 18
CREATE OR REPLACE VIEW vista_update_sales AS
SELECT stor_id, ord_num, title_id, qty
FROM sales;

select * from vista_update_sales;

-- Ejercicio 19
CREATE OR REPLACE VIEW vista_update_pubdate AS
SELECT title_id, title, pubdate
FROM titles;

select * from vista_update_pubdate;

-- Ejercicio 20
CREATE OR REPLACE VIEW vista_update_tipo AS
SELECT title_id, title, type
FROM titles;

select * from vista_update_tipo;