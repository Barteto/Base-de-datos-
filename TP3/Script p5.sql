CREATE DATABASE IF NOT EXISTS p5;
USE p5;

CREATE TABLE Torneo (
    cod_torneo INT PRIMARY KEY,
    nombre_torneo VARCHAR(80) NOT NULL
);

CREATE TABLE Sponsor (
    sponsor VARCHAR(80) PRIMARY KEY,
    dni_presidente_sponsor INT,
    dni_medico INT
);

CREATE TABLE Corredor_Torneo (
    cod_torneo INT,
    cod_corredor INT,
    nyap_corredor VARCHAR(80),
    PRIMARY KEY (cod_torneo, cod_corredor),
    FOREIGN KEY (cod_torneo) REFERENCES Torneo(cod_torneo)
);

CREATE TABLE Bicicleta_Torneo (
    cod_torneo INT,
    cod_bicicleta INT,
    marca_bicicleta VARCHAR(60),
    PRIMARY KEY (cod_torneo, cod_bicicleta),
    FOREIGN KEY (cod_torneo) REFERENCES Torneo(cod_torneo)
);

CREATE TABLE Participacion (
    cod_torneo INT,
    cod_corredor INT,
    cod_bicicleta INT,
    sponsor VARCHAR(80),
    PRIMARY KEY (cod_torneo, cod_corredor, cod_bicicleta, sponsor),
    FOREIGN KEY (cod_torneo, cod_corredor)
        REFERENCES Corredor_Torneo(cod_torneo, cod_corredor),
    FOREIGN KEY (cod_torneo, cod_bicicleta)
        REFERENCES Bicicleta_Torneo(cod_torneo, cod_bicicleta),
    FOREIGN KEY (sponsor) REFERENCES Sponsor(sponsor)
);
