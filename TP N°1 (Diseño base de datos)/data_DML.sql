use televisores;

INSERT INTO Importador (nombre, direccion, telefono) VALUES
('TechImport SA', 'Av. Libertador 1234', '2901-555111'),
('GlobalParts LLC', 'Ruta 3 km 3012', '2901-555222'),
('Fuego Components', 'San Martín 456', '2901-555333');

INSERT INTO Factura (numero_factura, fecha, id_importador) VALUES
('A-1001', '2025-01-15', 1),
('A-1002', '2025-01-20', 2),
('A-1003', '2025-01-22', 1);

INSERT INTO Pieza (nombre, tipo, costo_unitario) VALUES
('Placa Madre', 'importada', 32000.00),
('Pantalla LED 42"', 'importada', 55000.00),
('Carcasa Plástica', 'fabricada', 8000.00),
('Botonera', 'fabricada', 1500.00),
('Sintonizador', 'importada', 12000.00),
('Fuente de Poder', 'fabricada', 6000.00),
('Altavoces', 'importada', 7000.00),
('Marco Frontal', 'fabricada', 5000.00);

INSERT INTO PiezaImportada (id_factura, id_pieza, cantidad, costo_unitario) VALUES
(1, 1, 50, 32000.00),
(1, 2, 40, 55000.00),
(1, 5, 60, 12000.00),
(2, 1, 30, 31500.00),
(2, 7, 50, 7000.00),
(3, 2, 20, 54000.00),
(3, 5, 25, 11800.00);

INSERT INTO Operario (nombre, apellido, especialidad) VALUES
('Juan', 'Pérez', 'Carcasa'),
('María', 'López', 'Botonera'),
('Carlos', 'Gómez', 'Marco Plástico'),
('Lucía', 'Martínez', 'Fuente de Poder'),
('Andrés', 'Soto', 'General');

INSERT INTO HojaConfeccion (id_operario, id_pieza, fecha, cantidad_fabricada) VALUES
(1, 3, '2025-02-01', 120), 
(1, 3, '2025-02-02', 110),
(2, 4, '2025-02-01', 200), 
(2, 4, '2025-02-03', 180),
(3, 8, '2025-02-02', 90), 
(4, 6, '2025-02-01', 70), 
(4, 6, '2025-02-03', 65),
(5, 3, '2025-02-01', 50);

INSERT INTO TelevisorModelo (nombre_modelo, pulgadas, descripcion) VALUES
('TV Fuego 4200', 42, 'Modelo estándar LED'),
('TV Fuego Pro 5000', 50, 'Modelo premium con sonido envolvente');

-- Modelo 1:
INSERT INTO MapaArmado (id_modelo, id_pieza, paso_orden, ubicacion) VALUES
(1, 2, 1, 'Frontal'),
(1, 1, 2, 'Centro Interno'),
(1, 3, 3, 'Exterior'),
(1, 4, 4, 'Frontal Inferior'),
(1, 6, 5, 'Parte Trasera'),
(1, 7, 6, 'Laterales'),
(1, 8, 7, 'Marco Exterior');

-- Modelo 2:
INSERT INTO MapaArmado (id_modelo, id_pieza, paso_orden, ubicacion) VALUES
(2, 2, 1, 'Frontal'),
(2, 1, 2, 'Centro Interno'),
(2, 3, 3, 'Exterior'),
(2, 6, 4, 'Parte Trasera'),
(2, 7, 5, 'Laterales'),
(2, 5, 6, 'Módulo Adicional');