CREATE DATABASE IF NOT EXISTS p2;
USE p2;

CREATE TABLE Cliente (
    dni_cliente INT PRIMARY KEY,
    nombre_cliente VARCHAR(60) NOT NULL,
    ciudad_cliente VARCHAR(60)
);

CREATE TABLE Gerente (
    dni_gerente INT PRIMARY KEY,
    nombre_gerente VARCHAR(60) NOT NULL
);

CREATE TABLE Hotel (
    cod_hotel INT PRIMARY KEY,
    direccion_hotel VARCHAR(80),
    ciudad_hotel VARCHAR(60),
    cantidad_habitaciones INT,
    dni_gerente INT,
    CONSTRAINT fk_hotel_gerente
        FOREIGN KEY (dni_gerente) REFERENCES Gerente(dni_gerente)
);

CREATE TABLE Estadia (
    dni_cliente INT,
    cod_hotel INT,
    fecha_inicio_hospedaje DATE,
    habitacion INT,
    cant_dias_hospedaje INT,
    PRIMARY KEY (dni_cliente, cod_hotel, fecha_inicio_hospedaje, habitacion),
    CONSTRAINT fk_estadia_cliente
        FOREIGN KEY (dni_cliente) REFERENCES Cliente(dni_cliente),
    CONSTRAINT fk_estadia_hotel
        FOREIGN KEY (cod_hotel) REFERENCES Hotel(cod_hotel)
);





