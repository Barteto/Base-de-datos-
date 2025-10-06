CREATE TABLE Clientes (
    dni VARCHAR(20) PRIMARY KEY NOT NULL,
    nombre VARCHAR(100),
    direccion VARCHAR(255)
);

CREATE TABLE Asuntos (
numero_expediente INT PRIMARY KEY NOT NULL,
dni_cliente VARCHAR(20),
fecha_inicio DATE,
fecha_fin DATE,
estado VARCHAR(50),
FOREIGN KEY (dni_cliente) REFERENCES Clientes(dni)
);

Create Table Procuradores (
  id_procurador INT PRIMARY KEY,
  nombre VARCHAR(100),
  direccion VARCHAR(255)
);

Create TABLE Asuntos_Procuradores (
  numero_expediente INT,
  id_procurador INT,
  PRIMARY KEY (numero_expediente,id_procurador),
  FOREIGN KEY (numero_expediente) REFERENCES Asuntos(numero_expediente),
  FOREIGN KEY (id_procurador) REFERENCES Procuradores(id_procurador)
)
