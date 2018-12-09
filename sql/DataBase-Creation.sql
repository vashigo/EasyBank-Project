-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2018-12-09 19:20:58.627

-- tables
-- Table: Credito
CREATE TABLE Credito (
    ID int  NOT NULL,
    Monto int  NOT NULL,
    Interes int  NOT NULL,
    Cuenta_Numero int  NOT NULL,
    CONSTRAINT Credito_pk PRIMARY KEY (ID)
);

-- Table: Cuenta
CREATE TABLE Cuenta (
    Numero int  NOT NULL,
    Tipo varchar(20)  NOT NULL,
    CuotaManejo int  NOT NULL,
    Balance int  NOT NULL,
    Usuario_Identificacion int  NOT NULL,
    CONSTRAINT Cuenta_pk PRIMARY KEY (Numero)
);

-- Table: Tarjeta
CREATE TABLE Tarjeta (
    Numero int  NOT NULL,
    Tipo varchar(20)  NOT NULL,
    CuotaManejo int  NOT NULL,
    Cupo int  NOT NULL,
    Balance int  NOT NULL,
    FechaExpiracion date  NOT NULL,
    Cuenta_Numero int  NOT NULL,
    CONSTRAINT Tarjeta_pk PRIMARY KEY (Numero)
);

-- Table: Transacciones
CREATE TABLE Transacciones (
    ID int  NOT NULL,
    Tipo int  NOT NULL,
    Monto int  NOT NULL,
    Comision int  NOT NULL,
    Destinatario_ID int  NOT NULL,
    Cuenta_Numero int  NOT NULL,
    CONSTRAINT Transacciones_pk PRIMARY KEY (ID)
);

-- Table: Usuario
CREATE TABLE Usuario (
    Identificacion int  NOT NULL,
    Tipo varchar(50)  NOT NULL,
    Nombre varchar(50)  NOT NULL,
    Correo varchar(50)  NOT NULL,
    Contrasena varchar(50)  NOT NULL,
    Celular int  NOT NULL,
    Direccion varchar(50)  NOT NULL,
    FechaNacimiento date  NOT NULL,
    Trabajo varchar(50)  NOT NULL,
    CIFIN_Reportado boolean  NOT NULL,
    LavadoActivos boolean  NOT NULL,
    CONSTRAINT Usuario_pk PRIMARY KEY (Identificacion)
);

-- foreign keys
-- Reference: Credito_Cuenta (table: Credito)
ALTER TABLE Credito ADD CONSTRAINT Credito_Cuenta
    FOREIGN KEY (Cuenta_Numero)
    REFERENCES Cuenta (Numero)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Cuenta_Usuario (table: Cuenta)
ALTER TABLE Cuenta ADD CONSTRAINT Cuenta_Usuario
    FOREIGN KEY (Usuario_Identificacion)
    REFERENCES Usuario (Identificacion)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Tarjeta_Cuenta (table: Tarjeta)
ALTER TABLE Tarjeta ADD CONSTRAINT Tarjeta_Cuenta
    FOREIGN KEY (Cuenta_Numero)
    REFERENCES Cuenta (Numero)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Transacciones_Cuenta (table: Transacciones)
ALTER TABLE Transacciones ADD CONSTRAINT Transacciones_Cuenta
    FOREIGN KEY (Cuenta_Numero)
    REFERENCES Cuenta (Numero)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- End of file.

