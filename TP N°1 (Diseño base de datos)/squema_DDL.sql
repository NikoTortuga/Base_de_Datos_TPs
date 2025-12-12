drop database if exists televisores;
create database televisores;
use televisores;

CREATE TABLE Importador (
    id_importador INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    direccion VARCHAR(200),
    telefono VARCHAR(50)
    );
    
    CREATE TABLE Factura (
    id_factura INT AUTO_INCREMENT PRIMARY KEY,
    numero_factura VARCHAR(50),
    fecha DATE,
    id_importador INT,
    FOREIGN KEY (id_importador) REFERENCES Importador(id_importador)
);

CREATE TABLE Pieza (
    id_pieza INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    tipo ENUM('importada','fabricada'),
    costo_unitario DECIMAL(10,2)
);


CREATE TABLE PiezaImportada (
    id_factura INT,
    id_pieza INT,
    cantidad INT,
    costo_unitario DECIMAL(10,2),
    PRIMARY KEY (id_factura, id_pieza),
    FOREIGN KEY (id_factura) REFERENCES Factura(id_factura),
    FOREIGN KEY (id_pieza) REFERENCES Pieza(id_pieza)
);

CREATE TABLE Operario (
    id_operario INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    apellido VARCHAR(100),
    especialidad VARCHAR(100)
);

CREATE TABLE HojaConfeccion (
    id_confeccion INT AUTO_INCREMENT PRIMARY KEY,
    id_operario INT,
    id_pieza INT,
    fecha DATE,
    cantidad_fabricada INT,
    FOREIGN KEY (id_operario) REFERENCES Operario(id_operario),
    FOREIGN KEY (id_pieza) REFERENCES Pieza(id_pieza)
);

CREATE TABLE TelevisorModelo (
    id_modelo INT AUTO_INCREMENT PRIMARY KEY,
    nombre_modelo VARCHAR(100),
    pulgadas INT,
    descripcion TEXT
);

CREATE TABLE MapaArmado (
    id_modelo INT,
    id_pieza INT,
    paso_orden INT,
    ubicacion VARCHAR(100),
    PRIMARY KEY (id_modelo, id_pieza),
    FOREIGN KEY (id_modelo) REFERENCES TelevisorModelo(id_modelo),
    FOREIGN KEY (id_pieza) REFERENCES Pieza(id_pieza)
);

