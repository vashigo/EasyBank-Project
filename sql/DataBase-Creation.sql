-- Drops

DROP TABLE Usuario, Cuenta, Credito, Tarjeta, Transaccion;
DROP sequence auto_cuenta, auto_credito, auto_tarjeta, auto_transaccion;

-- sequences
-- Sequence: auto_cuenta
CREATE SEQUENCE auto_cuenta
      INCREMENT BY 1
      NO MINVALUE
      NO MAXVALUE
      START WITH 1
      NO CYCLE
;

-- Sequence: auto_credito
CREATE SEQUENCE auto_credito
      INCREMENT BY 1
      NO MINVALUE
      NO MAXVALUE
      START WITH 1
      NO CYCLE
;

-- Sequence: auto_tarjeta
CREATE SEQUENCE auto_tarjeta
      INCREMENT BY 1
      NO MINVALUE
      NO MAXVALUE
      START WITH 1
      NO CYCLE
;

-- Sequence: auto_transaccion
CREATE SEQUENCE auto_transaccion
      INCREMENT BY 1
      NO MINVALUE
      NO MAXVALUE
      START WITH 1
      NO CYCLE
;

-- Tables
-- Table: Credito
CREATE TABLE Credito (
    ID bigint  NOT NULL DEFAULT NEXTVAL ('auto_credito'),
    Monto bigint  NOT NULL,
    Interes bigint  NOT NULL,
    Cuenta_Numero bigint  NOT NULL,
    CONSTRAINT Credito_pk PRIMARY KEY (ID)
);

-- Table: Cuenta
CREATE TABLE Cuenta (
    Numero bigint  NOT NULL DEFAULT NEXTVAL ('auto_cuenta'),
    Tipo varchar(20)  NOT NULL,
    CuotaManejo bigint  NOT NULL,
    Balance bigint  NOT NULL,
    Usuario_Identificacion bigint  NOT NULL,
    CONSTRAINT Cuenta_pk PRIMARY KEY (Numero)
);

-- Table: Tarjeta
CREATE TABLE Tarjeta (
    Numero bigint  NOT NULL DEFAULT NEXTVAL ('auto_tarjeta'),
    Tipo varchar(20)  NOT NULL,
    CuotaManejo bigint  NOT NULL,
    Cupo bigint  NOT NULL,
    Balance bigint  NOT NULL,
    FechaExpiracion date  NOT NULL,
    Cuenta_Numero bigint  NOT NULL,
    CONSTRAINT Tarjeta_pk PRIMARY KEY (Numero)
);

-- Table: Transaccion
CREATE TABLE Transaccion (
    ID bigint  NOT NULL DEFAULT NEXTVAL ('auto_transaccion'),
    Tipo varchar(20)  NOT NULL,
    Monto bigint  NOT NULL,
    Comision bigint  NOT NULL,
    Destinatario_ID bigint  NOT NULL,
    Cuenta_Numero bigint  NOT NULL,
    CONSTRAINT Transacciones_pk PRIMARY KEY (ID)
);

-- Table: Usuario
CREATE TABLE Usuario (
    Identificacion bigint  NOT NULL,
    Tipo varchar(50)  NOT NULL,
    Nombre varchar(50)  NOT NULL,
    Correo varchar(50)  NOT NULL,
    Contrasena varchar(50)  NOT NULL,
    Celular bigint  NOT NULL,
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

-- Reference: Transaccion_Cuenta (table: Transaccion)
ALTER TABLE Transaccion ADD CONSTRAINT Transaccion_Cuenta
    FOREIGN KEY (Cuenta_Numero)
    REFERENCES Cuenta (Numero)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- End of file.

