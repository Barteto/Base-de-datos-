
CREATE DATABASE IF NOT EXISTS programas_radio;
USE programas_radio;


CREATE TABLE RADIO_ANIO (
    radio VARCHAR(50) NOT NULL,
    anio YEAR NOT NULL,
    frecuencia_radio VARCHAR(20) NOT NULL,
    gerente VARCHAR(100) NOT NULL,
    PRIMARY KEY (radio, anio)
);


CREATE TABLE PROGRAMA (
    radio VARCHAR(50) NOT NULL,
    anio YEAR NOT NULL,
    programa VARCHAR(100) NOT NULL,
    conductor VARCHAR(100) NOT NULL,
    PRIMARY KEY (radio, anio, programa),
    FOREIGN KEY (radio, anio) REFERENCES RADIO_ANIO(radio, anio)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);
