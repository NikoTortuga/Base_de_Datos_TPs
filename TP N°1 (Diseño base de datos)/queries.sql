use televisores;

-- Piezas fabricadas por operario
SELECT o.nombre, o.apellido, p.nombre AS pieza, SUM(hc.cantidad_fabricada) AS total_fabricado
FROM HojaConfeccion hc
JOIN Operario o ON hc.id_operario = o.id_operario
JOIN Pieza p ON hc.id_pieza = p.id_pieza
GROUP BY o.id_operario, p.id_pieza;

-- Información de piezas importadas:
SELECT f.numero_factura, imp.nombre AS importador, p.nombre AS pieza, pi.cantidad
FROM PiezaImportada pi
JOIN Factura f ON pi.id_factura = f.id_factura
JOIN Importador imp ON f.id_importador = imp.id_importador
JOIN Pieza p ON pi.id_pieza = p.id_pieza;