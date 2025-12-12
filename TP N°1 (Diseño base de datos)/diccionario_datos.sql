use televisores;
USE information_schema;

SELECT 
    TABLE_NAME AS 'Tabla',
    COLUMN_NAME AS 'Columna',
    DATA_TYPE AS 'Tipo de Dato',
    IS_NULLABLE AS 'Puede ser Nulo',
    COLUMN_KEY AS 'Clave'
FROM 
    COLUMNS
WHERE 
    TABLE_SCHEMA = 'televisores'
ORDER BY 
    TABLE_NAME, ORDINAL_POSITION;