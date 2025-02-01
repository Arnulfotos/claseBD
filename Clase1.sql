CREATE DATABASE xNomina;
GO
USE xNomina;

CREATE TABLE empleados (
EmpleadoID INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
Nombre VARCHAR(50) NOT NULL,
PrimerApellido VARCHAR(50) NOT NULL,
SegundoApellido VARCHAR(50),
FechaNacimiento DATE NOT NULL,
Contacto VARCHAR(10) NOT NULL,
FechaAlta DATE NOT NULL,
NSS VARCHAR(10) NOT NULL
);


CREATE TABLE trabajos (
TrabajoID INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
Nombre VARCHAR(50) NOT NULL,
SalarioMinimo DECIMAL(8,2) NOT NULL,
SalarioMaximo DECIMAL(8,2),
DepartamentoID INT,
CONSTRAINT AK_Nombre UNIQUE(Nombre)
)

CREATE TABLE empleado_trabajo (
EmpleadoTrabajoID INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
EmpleadoID INT NOT NULL,
TrabajoID INT NOT NULL,
FechaInicio DATE NOT NULL,
FechaFinal DATE,
 CONSTRAINT FK_empleado_from_emp_trb FOREIGN KEY (EmpleadoID)
        REFERENCES empleados(EmpleadoID)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
	 CONSTRAINT FK_trabajo FOREIGN KEY (TrabajoID)
        REFERENCES trabajos(TrabajoID)
    ON DELETE CASCADE
    ON UPDATE CASCADE
)


CREATE TABLE departamentos (
DptoID INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
Nombre VARCHAR(50) UNIQUE,
CONSTRAINT AK_DptoNombre UNIQUE(Nombre)

);

CREATE TABLE historial_salarios(
HistorialSalarialID INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
EmpleadoTrabajoID INT NOT NULL,
SalarioAnterior INT,
SalarioActual INT NOT NULL, 
FechaMovimiento DATE NOT NULL,
 CONSTRAINT FK_relacion_empl_trab FOREIGN KEY (EmpleadoTrabajoID)
        REFERENCES empleado_trabajo(EmpleadoTrabajoID)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
)


CREATE TABLE estudios(
EstudioID INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
Nivel VARCHAR(50) NOT NULL,
Descripcion VARCHAR(50) NOT NULL
)

CREATE TABLE empleado_estudio(
EmpleadoEstudioID INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
EmpleadoID INT NOT NULL,
EstudioID INT NOT NULL,
 CONSTRAINT FK_empleado_from_emp_est FOREIGN KEY (EmpleadoID)
        REFERENCES empleados(EmpleadoID)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
	 CONSTRAINT FK_estudios FOREIGN KEY (EstudioID)
        REFERENCES estudios(EstudioID)
    ON DELETE CASCADE
    ON UPDATE CASCADE
)

ALTER TABLE trabajos
ADD CONSTRAINT FK_departamentos FOREIGN KEY(DepartamentoID)
        REFERENCES departamentos(DptoID)
    ON DELETE CASCADE
    ON UPDATE CASCADE
