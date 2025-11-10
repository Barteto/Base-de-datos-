CREATE TABLE Sucursal (
    codigo_sucursal INT PRIMARY KEY,
    domicilio_sucursal VARCHAR(100) NOT NULL,
    telefono_sucursal VARCHAR(20) NOT NULL
);
CREATE TABLE Fosa (
    codigo_sucursal INT NOT NULL,
    codigo_fosa INT NOT NULL,
    largo_fosa DECIMAL(5,2) NOT NULL,
    ancho_fosa DECIMAL(5,2) NOT NULL,
    PRIMARY KEY (codigo_sucursal, codigo_fosa),
    FOREIGN KEY (codigo_sucursal) REFERENCES Sucursal(codigo_sucursal)
);
CREATE TABLE Cliente (
    dni_cliente INT PRIMARY KEY,
    nombre_cliente VARCHAR(60) NOT NULL,
    celular_cliente VARCHAR(20) NOT NULL
);
CREATE TABLE Auto (
    patente_auto VARCHAR(10) PRIMARY KEY,
    marca_auto VARCHAR(50) NOT NULL,
    modelo_auto VARCHAR(50) NOT NULL,
    dni_cliente INT,
    FOREIGN KEY (dni_cliente) REFERENCES Cliente(dni_cliente)
);
CREATE TABLE Mecanico (
    dni_mecanico INT PRIMARY KEY,
    nombre_mecanico VARCHAR(60) NOT NULL,
    email_mecanico VARCHAR(100) NOT NULL
);
CREATE TABLE Trabajo (
    codigo_sucursal INT NOT NULL,
    codigo_fosa INT NOT NULL,
    patente_auto VARCHAR(10) NOT NULL,
    dni_mecanico INT NOT NULL,
    PRIMARY KEY (codigo_sucursal, codigo_fosa, patente_auto, dni_mecanico),
    FOREIGN KEY (codigo_sucursal, codigo_fosa) REFERENCES Fosa(codigo_sucursal, codigo_fosa),
    FOREIGN KEY (patente_auto) REFERENCES Auto(patente_auto),
    FOREIGN KEY (dni_mecanico) REFERENCES Mecanico(dni_mecanico)
);
