-- Punto 1 
CREATE DATABASE IF NOT EXISTS tp4_banco;
use tp4_banco;

CREATE TABLE Clientes (
    numero_cliente INT PRIMARY KEY,
    dni CHAR(8) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    nombre VARCHAR(50) NOT NULL
);


CREATE TABLE Cuentas (
    numero_cuenta INT PRIMARY KEY,
    numero_cliente INT NOT NULL,
    saldo DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (numero_cliente) REFERENCES clientes(numero_cliente)
);


CREATE TABLE movimientos (
    id_movimiento INT AUTO_INCREMENT PRIMARY KEY,
    numero_cuenta INT NOT NULL,
    fecha DATE NOT NULL,
    tipo ENUM('CREDITO','DEBITO') NOT NULL,
    importe DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (numero_cuenta) REFERENCES cuentas(numero_cuenta)
);


CREATE TABLE historial_movimientos (
    id INT PRIMARY KEY,
    numero_cuenta INT NOT NULL,
    numero_movimiento INT NOT NULL,
    saldo_anterior DECIMAL(10,2) NOT NULL,
    saldo_actual DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (numero_cuenta) REFERENCES cuentas(numero_cuenta)
);

