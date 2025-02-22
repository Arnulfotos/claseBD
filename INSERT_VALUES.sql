-- Poblar la tabla Insurance
INSERT INTO Insurance (ProviderName, CoverageDetails) VALUES
('GNP', 'Cobertura total en consultas generales'),
('AXA', 'Cobertura del 80% en hospitalización'),
('CHUBB', 'Cobertura en medicamentos y emergencias'),
('QUALITAS', 'Cobertura completa en especialistas'),
('INBURSA', 'Cobertura básica en urgencias'),
('MAPFRE', 'Cobertura en revisiones anuales'),
('ZURICH', 'Cobertura del 90% en cirugías'),
('BBVA SEGUROS', 'Cobertura dental y oftalmológica'),
('HDI', 'Cobertura parcial en medicina preventiva'),
('BANORTE SEGUROS', 'Cobertura en tratamientos especializados');

-- Poblar la tabla Clients
INSERT INTO Clients (FirstName, LastName, DateOfBirth, PhoneNumber, Email, Address, InsuranceID) VALUES
('Juan', 'Perez', '1985-03-15', '5551234567', 'juan.perez@example.com', 'Av. Siempre Viva 742', 1),
('Ana', 'Gomez', '1990-07-22', '5559876543', 'ana.gomez@example.com', 'Calle Falsa 123', 2),
('Luis', 'Martinez', '1978-11-05', '5554567890', 'luis.martinez@example.com', 'Blvd. Central 456', 3),
('Maria', 'Lopez', '1995-06-30', '5553216549', 'maria.lopez@example.com', 'Paseo del Sol 789', 4),
('Carlos', 'Ruiz', '1982-09-12', '5556549871', 'carlos.ruiz@example.com', 'Av. Reforma 101', 5),
('Sofia', 'Hernandez', '1988-12-25', '5557418523', 'sofia.hernandez@example.com', 'Calle Luna 505', 6),
('Miguel', 'Torres', '1975-04-18', '5553692587', 'miguel.torres@example.com', 'Calle Estrella 808', 7),
('Laura', 'Diaz', '1992-08-14', '5558529634', 'laura.diaz@example.com', 'Av. Principal 202', 8),
('Pedro', 'Jimenez', '1980-01-09', '5551472583', 'pedro.jimenez@example.com', 'Blvd. Norte 404', 9),
('Lucia', 'Vargas', '1983-05-27', '5559637412', 'lucia.vargas@example.com', 'Paseo del Mar 606', 10);

-- Poblar la tabla Patients
INSERT INTO Patients (ClientID, FirstName, LastName, DateOfBirth, Gender, PhoneNumber, Email, Address, BloodType, EmergencyContact) VALUES
(1, 'Juan', 'Perez', '1985-03-15', 'M', '5551234567', 'juan.perez@example.com', 'Av. Siempre Viva 742', 'O+', 'Ana Perez'),
(2, 'Ana', 'Gomez', '1990-07-22', 'F', '5559876543', 'ana.gomez@example.com', 'Calle Falsa 123', 'A-', 'Luis Gomez'),
(3, 'Luis', 'Martinez', '1978-11-05', 'M', '5554567890', 'luis.martinez@example.com', 'Blvd. Central 456', 'B+', 'Clara Martinez'),
(4, 'Maria', 'Lopez', '1995-06-30', 'F', '5553216549', 'maria.lopez@example.com', 'Paseo del Sol 789', 'AB-', 'Carlos Lopez'),
(5, 'Carlos', 'Ruiz', '1982-09-12', 'M', '5556549871', 'carlos.ruiz@example.com', 'Av. Reforma 101', 'O-', 'Ana Ruiz'),
(6, 'Sofia', 'Hernandez', '1988-12-25', 'F', '5557418523', 'sofia.hernandez@example.com', 'Calle Luna 505', 'A+', 'Miguel Hernandez'),
(7, 'Miguel', 'Torres', '1975-04-18', 'M', '5553692587', 'miguel.torres@example.com', 'Calle Estrella 808', 'B-', 'Laura Torres'),
(8, 'Laura', 'Diaz', '1992-08-14', 'F', '5558529634', 'laura.diaz@example.com', 'Av. Principal 202', 'AB+', 'Pedro Diaz'),
(9, 'Pedro', 'Jimenez', '1980-01-09', 'M', '5551472583', 'pedro.jimenez@example.com', 'Blvd. Norte 404', 'O+', 'Lucia Jimenez'),
(10, 'Lucia', 'Vargas', '1983-05-27', 'F', '5559637412', 'lucia.vargas@example.com', 'Paseo del Mar 606', 'A-', 'Juan Vargas');

-- Poblar la tabla Doctors
INSERT INTO Doctors (FirstName, LastName, Specialty, PhoneNumber, Email, LicenseNumber) VALUES
('Ricardo', 'Salinas', 'Cardiología', '5551112233', 'ricardo.salinas@example.com', 'LIC12345'),
('Patricia', 'Mendez', 'Pediatría', '5552223344', 'patricia.mendez@example.com', 'LIC12346'),
('Alberto', 'Gonzalez', 'Neurología', '5553334455', 'alberto.gonzalez@example.com', 'LIC12347'),
('Clara', 'Ortiz', 'Ginecología', '5554445566', 'clara.ortiz@example.com', 'LIC12348'),
('Javier', 'Lozano', 'Traumatología', '5555556677', 'javier.lozano@example.com', 'LIC12349'),
('Monica', 'Vargas', 'Dermatología', '5556667788', 'monica.vargas@example.com', 'LIC12350'),
('Hector', 'Ramos', 'Oftalmología', '5557778899', 'hector.ramos@example.com', 'LIC12351'),
('Lucia', 'Fernandez', 'Psiquiatría', '5558889900', 'lucia.fernandez@example.com', 'LIC12352'),
('Daniel', 'Castro', 'Urología', '5559990011', 'daniel.castro@example.com', 'LIC12353'),
('Sofia', 'Reyes', 'Endocrinología', '5550001122', 'sofia.reyes@example.com', 'LIC12354');

-- Poblar la tabla Appointments
INSERT INTO Appointments (PatientID, DoctorID, AppointmentDateTime, Status) VALUES
(1, 1, '2024-01-15 09:00:00', 'Scheduled'),
(2, 2, '2024-01-16 10:30:00', 'Completed'),
(3, 3, '2024-01-17 11:00:00', 'Scheduled'),
(4, 4, '2024-01-18 12:00:00', 'Canceled'),
(5, 5, '2024-01-19 14:00:00', 'Scheduled'),
(6, 6, '2024-01-20 15:30:00', 'Completed'),
(7, 7, '2024-01-21 16:00:00', 'Scheduled'),
(8, 8, '2024-01-22 09:00:00', 'Canceled'),
(9, 9, '2024-01-23 10:00:00', 'Scheduled'),
(10, 10, '2024-01-24 11:30:00', 'Completed');



INSERT INTO Billing(AppointmentID,TotalAmount,PaymentStatus,TipoDePago) VALUES
(1, 1200, 'Liquidado','Tarjeta de credito'),
(2, 800, 'Liquidado','Tarjeta de credito'),
(3, 1800, 'Liquidado','Tarjeta de credito'),
(4, 800, 'Liquidado','Tarjeta de credito'),
(5, 1200,'Pendiente', 'Aseguranza'),
(6, 1200,'Liquidado', 'Efectivo'),
(7, 1500,'Liquidado', 'Efectivo'),
(8, 2100,'Liquidado', 'Tarjeta de debito'),
(9, 1800,'Pendiente', 'Aseguranza'),
(10, 1200,'Liquidado', 'Efectivo')


INSERT INTO MedicalRecords(PatientID,DoctorID,Diagnosis,Treatment) VALUES
(2,2,'Consulta de diagnostico','Se solicitan estudios'),
(3,3,'Consulta de diagnostico','Se solicitan estudios'),
(4,4,'Consulta de diagnostico','Se solicitan estudios'),
(5,5,'Consulta de diagnostico','Se solicitan estudios'),
(6,6,'Consulta de diagnostico','Se solicitan estudios'),
(7,7,'Consulta de diagnostico','Se solicitan estudios'),
(8,8,'Consulta de diagnostico','Se solicitan estudios'),
(9,9,'Consulta de diagnostico','Se solicitan estudios'),
(10,10,'Consulta de diagnostico','Se solicitan estudios')

INSERT INTO Prescriptions(RecordID,Medication,Dosage) VALUES
(1,'Paquete completo analisis de sangre','No aplica'),
(2,'Paquete completo analisis de sangre','No aplica'),
(3,'Paquete completo analisis de sangre','No aplica'),
(4,'Paquete completo analisis de sangre','No aplica'),
(5,'Paquete completo analisis de sangre','No aplica'),
(6,'Paquete completo analisis de sangre','No aplica'),
(7,'Paquete completo analisis de sangre','No aplica'),
(8,'Paquete completo analisis de sangre','No aplica'),
(9,'Paquete completo analisis de sangre','No aplica'),
(10,'Paquete completo analisis de sangre','No aplica')


SELECT * FROM MedicalRecords
SELECT * FROM Appointments
SELECT * FROM Billing
SELECT * FROM Prescriptions




SELECT a.AppointmentID, a.AppointmentDateTime, a.Status,p.FirstName,p.LastName,d.Specialty
FROM Appointments as a
INNER JOIN Patients as p
ON a.PatientID = p.PatientID
INNER JOIN Doctors as d
ON a.DoctorID = d.DoctorID