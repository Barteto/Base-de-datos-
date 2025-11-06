CREATE TABLE Olimpiada (
    anio_olimpiada INT PRIMARY KEY,
    pais_olimpiada VARCHAR(60) NOT NULL
);
CREATE TABLE Deportista (
    nombre_deportista VARCHAR(80) PRIMARY KEY,
    pais_deportista VARCHAR(60) NOT NULL
);
CREATE TABLE Participacion (
    anio_olimpiada INT NOT NULL,
    nombre_deportista VARCHAR(80) NOT NULL,
    nombre_disciplina VARCHAR(80) NOT NULL,
    asistente VARCHAR(80) NOT NULL,
    PRIMARY KEY (anio_olimpiada, nombre_deportista),
    FOREIGN KEY (anio_olimpiada) REFERENCES Olimpiada(anio_olimpiada),
    FOREIGN KEY (nombre_deportista) REFERENCES Deportista(nombre_deportista)
);
