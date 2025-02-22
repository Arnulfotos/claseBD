CREATE PROCEDURE AgendarCita
    @PacienteID INT,
    @DoctorID INT,
    @FechaHora DATETIME,
    @Status NVARCHAR(50)
AS
BEGIN
    INSERT INTO Appointments(PatientID, DoctorID, AppointmentDateTime, Status)
    VALUES (@PacienteID, @DoctorID, @FechaHora, @Status);
END;

EXEC AgendarCita 5,8,'2025-02-17','Confirmada';

SELECT * FROM Appointments


CREATE PROCEDURE GenerarBiling
    @CitaID INT,
    @Monto DECIMAL(10,2),
	@StatusPago NVARCHAR(50),
	@TipoPago NVARCHAR(50)
AS
BEGIN
    INSERT INTO Billing(AppointmentID,TotalAmount,PaymentStatus,BillingDate,TipoDePago)
    VALUES (@CitaID, @Monto,@StatusPago, GETDATE(),@TipoPago);
END;

EXEC GenerarBiling 13, 1200,'Liquidado','Efectivo'

SELECT * FROM Billing


CREATE PROCEDURE RegistrarCliente
    @Nombre NVARCHAR(100),
    @Apellido NVARCHAR(100),
    @FechaNacimiento DATE,
    @Telefono NVARCHAR(20),
	@Correo NVARCHAR(50),
	@Direccion NVARCHAR(50),
	@Aseg INT 
AS
BEGIN
    INSERT INTO  Clients(FirstName,LastName,DateOfBirth,PhoneNumber,Email,Address,InsuranceID)
    VALUES (@Nombre, @Apellido, @FechaNacimiento, @Telefono,@Correo,@Direccion,@Aseg);
END;


EXEC RegistrarCliente 'Arnulfo', 'Leon', '1996-08-23', '6642259769','manuelleon1996@gmail.com','Emiliano Zapata 7622', 1

SELECT * FROM Clients



CREATE TRIGGER trg_GenerarBilling
ON Appointments
AFTER INSERT
AS
BEGIN
    INSERT INTO Billing(AppointmentID,TotalAmount,PaymentStatus,BillingDate,TipoDePago)
    SELECT inserted.AppointmentID,1500,'Pendiente',GETDATE(),'Efectivo' FROM inserted
END;


CREATE TRIGGER trg_Cliente_Crear_Paciente
ON Clients
AFTER INSERT
AS
BEGIN
    INSERT INTO [dbo].[Patients]
           ([ClientID]
           ,[FirstName]
           ,[LastName]
           ,[DateOfBirth]
           ,[PhoneNumber]
           ,[Email]
           ,[Address]
)
    SELECT ins.ClientID,ins.FirstName,ins.LastName,ins.DateOfBirth,ins.PhoneNumber,ins.Email,ins.Address FROM inserted AS ins
END;




CREATE VIEW Vista_Detalle_Cita_Dr AS
SELECT a.AppointmentID, a.AppointmentDateTime, a.Status,p.FirstName,p.LastName,d.Specialty
FROM Appointments as a
INNER JOIN Patients as p
ON a.PatientID = p.PatientID
INNER JOIN Doctors as d
ON a.DoctorID = d.DoctorID

SELECT * FROM Vista_Detalle_Cita_Dr

CREATE VIEW Vista_Cliente_Aseguranza AS
SELECT c.FirstName, c.LastName, c.PhoneNumber, i.ProviderName, i.CoverageDetails
FROM Clients as c
INNER JOIN Insurance as i
ON c.InsuranceID = I.InsuranceID

SELECT * FROM Vista_Cliente_Aseguranza

SELECT * FROM MedicalRecords
SELECT * FROM Appointments
SELECT * FROM Billing
SELECT * FROM Prescriptions
SELECT * FROM Billing
SELECT * FROM Prescriptions