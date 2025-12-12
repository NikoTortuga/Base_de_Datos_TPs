use tp_procedimientos

-- Ejercicio 1:
DELIMITER //
CREATE PROCEDURE total_ventas_por_producto()
BEGIN
    SELECT p.id, p.nombre, SUM(v.cantidad) AS total_vendido
    FROM productos p
    JOIN ventas v ON p.id = v.producto_id
    GROUP BY p.id, p.nombre;
END //
DELIMITER ;

call total_ventas_por_producto;

-- Ejercicio 2:
DELIMITER //
CREATE PROCEDURE actualizar_stock(
    IN p_id INT,
    IN nuevo_stock INT,
    OUT stock_actualizado INT
)
BEGIN
    UPDATE productos SET stock = nuevo_stock WHERE id = p_id;
    SELECT stock INTO stock_actualizado FROM productos WHERE id = p_id;
END //
DELIMITER ;

call actualizar_stock(2, 150, @stock_actualizado);

-- Ejercicio 3:
DELIMITER //
CREATE PROCEDURE productos_stock_bajo(IN limite INT)
BEGIN
    SELECT id, nombre, stock
    FROM productos
    WHERE stock < limite;
END //
DELIMITER ;

call productos_stock_bajo(50);

-- Ejercicio 4:
DELIMITER //
CREATE PROCEDURE compras_cliente_rango(
    IN c_id INT,
    IN fecha_ini DATE,
    IN fecha_fin DATE
)
BEGIN
    SELECT cl.nombre,
           SUM(v.cantidad) AS total_comprado
    FROM ventas v
    JOIN clientes cl ON cl.id = v.cliente_id
    WHERE v.cliente_id = c_id
      AND v.fecha BETWEEN fecha_ini AND fecha_fin;
END //
DELIMITER ;

-- Ejercicio 5:
DELIMITER //
CREATE PROCEDURE promedio_precio_cliente(IN c_id INT)
BEGIN
    SELECT AVG(p.precio) AS promedio_precios
    FROM ventas v
    JOIN productos p ON p.id = v.producto_id
    WHERE v.cliente_id = c_id;
END //
DELIMITER ;

call promedio_precio_cliente(1);

-- Ejercicio 6:
DELIMITER //
CREATE PROCEDURE clientes_por_producto(IN prod_id INT)
BEGIN
    SELECT DISTINCT c.id, c.nombre
    FROM ventas v
    JOIN clientes c ON c.id = v.cliente_id
    WHERE v.producto_id = prod_id;
END //
DELIMITER ;

call clientes_por_producto(3);

-- Ejercicio 7:
DELIMITER //
CREATE PROCEDURE actualizar_precio(
    IN p_id INT,
    IN nuevo_precio DECIMAL(10,2),
    OUT precio_actualizado DECIMAL(10,2)
)
BEGIN
    UPDATE productos SET precio = nuevo_precio WHERE id = p_id;
    SELECT precio INTO precio_actualizado FROM productos WHERE id = p_id;
END //
DELIMITER ;

call actualizar_precio(4, 29.99, @precio_actualizado);

-- Ejercicio 8:
DELIMITER //
CREATE PROCEDURE productos_vendidos_rango(
    IN fecha_ini DATE,
    IN fecha_fin DATE
)
BEGIN
    SELECT DISTINCT p.nombre, p.stock
    FROM productos p
    JOIN ventas v ON p.id = v.producto_id
    WHERE v.fecha BETWEEN fecha_ini AND fecha_fin;
END //
DELIMITER ;

call productos_vendidos_rango('2022-01-01', '2022-01-31');

-- Ejercicio 9:
DELIMITER //
CREATE PROCEDURE total_ventas_por_cliente()
BEGIN
    SELECT c.id, c.nombre, SUM(v.cantidad) AS total_comprado
    FROM clientes c
    JOIN ventas v ON c.id = v.cliente_id
    GROUP BY c.id, c.nombre;
END //
DELIMITER ;

call total_ventas_por_cliente();

-- Ejercicio 10:
DELIMITER //
CREATE PROCEDURE productos_ordenados_precio()
BEGIN
    SELECT id, nombre, precio
    FROM productos
    ORDER BY precio DESC;
END //
DELIMITER ;

call productos_ordenados_precio();