DROP DATABASE if exists transacciones;
CREATE DATABASE transacciones;
use transacciones; 

CREATE TABLE cuentas (
numero_cuenta VARCHAR (10) PRIMARY KEY,
saldo DECIMAL (10, 2) 
);

INSERT INTO cuentas (numero_cuenta, saldo) VALUES 
('A', 1000.00),
('B', 750.00), 
('C', 1200.00), 
('D', 500.00), 
('E', 2000.00); 

-- Ejercicio 1:
DELIMITER //
CREATE PROCEDURE TransferirFondos()
BEGIN
    DECLARE saldoA DECIMAL(10,2);
    
start transaction;

UPDATE cuentas
SET saldo = saldo - 100
WHERE numero_cuenta = 'A';

UPDATE cuentas
SET saldo = saldo + 100
WHERE numero_cuenta = 'B';

    IF saldoA >= 0 THEN
        COMMIT;
    ELSE ROLLBACK;
    END IF;
END;
//
DELIMITER ;

call TransferirFondos;

-- EJERCICIO 2

CREATE TABLE inventario (
    producto_id VARCHAR (10) PRIMARY KEY,
    cantidad INT
);

INSERT INTO inventario (producto_id, cantidad) VALUES
    ('Producto1', 50),
    ('Producto2', 30),
    ('Producto3', 70),
    ('Producto4', 20),
    ('Producto5', 60);
    
    
    DELIMITER //
CREATE PROCEDURE ActualizarInventario (
    IN p_producto_id VARCHAR (10),
    IN cantidad_a_restar INT
)
BEGIN
    DECLARE nueva_cantidad INT;

    START TRANSACTION;

    -- Obtene la cantidad actual del producto
    SELECT cantidad INTO nueva_cantidad 
    FROM inventario
    WHERE producto_id = p_producto_id;

    -- Verifica si la cantidad restada es válida
    -- Si el producto no existe
    IF nueva_cantidad IS NULL THEN
        SELECT 'El producto no existe. Operación cancelada.' AS mensaje;
        ROLLBACK;
        -- Se termina el procedimiento automáticamente aquí
    ELSEIF nueva_cantidad - cantidad_a_restar < 0 THEN
        -- No hay suficiente inventario
        SELECT 'La cantidad restada resultaría en inventario negativo. Operación cancelada.' AS mensaje;
        ROLLBACK;
    ELSE
        -- Todo OK → Actualizar inventario
        UPDATE inventario
        SET cantidad = nueva_cantidad - cantidad_a_restar
        WHERE producto_id = p_producto_id;

        COMMIT;
        SELECT 'Inventario actualizado correctamente.' AS mensaje;
           END IF;
END;
//
DELIMITER ;

CALL ActualizarInventario('Producto1', 15);
CALL ActualizarInventario('Producto1', 1500);

-- EJERCICIO 3:

CREATE TABLE cuentas_clientes (
    numero_cuenta VARCHAR (10) PRIMARY KEY,
    saldo DECIMAL (10, 2)
);

INSERT INTO cuentas_clientes (numero_cuenta, saldo) VALUES
    ('Cuenta1', 1000.00),
    ('Cuenta2', 750.00),
    ('Cuenta3', 1200.00),
    ('Cuenta4', 500.00),
    ('Cuenta5', 2000.00);

CREATE TABLE transacciones (
    id INT AUTO_INCREMENT PRIMARY KEY,
    numero_cuenta VARCHAR (10),
    monto DECIMAL (10, 2)
);

DELIMITER //

CREATE PROCEDURE RegistrarCompra (
    IN p_cuenta VARCHAR(10),
    IN p_monto DECIMAL(10,2)
)
BEGIN
    DECLARE saldo_actual DECIMAL(10,2);

    START TRANSACTION;

    -- Obtener saldo actual de la cuenta
    SELECT saldo INTO saldo_actual
    FROM cuentas_clientes
    WHERE numero_cuenta = p_cuenta;

    -- Si la cuenta no existe
    IF saldo_actual IS NULL THEN
        SELECT 'La cuenta no existe. Operación cancelada.' AS mensaje;
        ROLLBACK;
        
    ELSEIF saldo_actual < p_monto THEN
        -- Saldo insuficiente
        SELECT 'Saldo insuficiente. La compra se cancela.' AS mensaje;
        ROLLBACK;

    ELSE
        -- Operación válida → actualizar saldo
        UPDATE cuentas_clientes
        SET saldo = saldo_actual - p_monto
        WHERE numero_cuenta = p_cuenta;

        -- Registrar transacción
        INSERT INTO transacciones (numero_cuenta, monto)
        VALUES (p_cuenta, p_monto);

        COMMIT;
        SELECT 'Compra registrada correctamente.' AS mensaje;
    END IF;

END;
//
DELIMITER ;

CALL RegistrarCompra('Cuenta1', 300);

