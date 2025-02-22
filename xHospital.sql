CREATE DATABASE xHospital;
GO

USE xHospital;
GO

CREATE TABLE Insurance (
    InsuranceID INT PRIMARY KEY IDENTITY(1,1),
    ProviderName NVARCHAR(100) NOT NULL,
    CoverageDetails NVARCHAR(255)
);
CREATE TABLE Clients (
	ClientID INT PRIMARY KEY IDENTITY(1,1),
	FirstName NVARCHAR(50) NOT NULL,
    LastName NVARCHAR(50) NOT NULL,
    DateOfBirth DATE NOT NULL,
    PhoneNumber NVARCHAR(15),
    Email NVARCHAR(100),
    Address NVARCHAR(255),
		InsuranceID INT FOREIGN KEY REFERENCES Insurance(InsuranceID) ON DELETE SET NULL

)
-- Patients Table
CREATE TABLE Patients (
    PatientID INT PRIMARY KEY IDENTITY(1,1),
	ClientID INT FOREIGN KEY REFERENCES Clients(ClientID) ON DELETE SET NULL ,
    FirstName NVARCHAR(50) NOT NULL,
    LastName NVARCHAR(50) NOT NULL,
    DateOfBirth DATE NOT NULL,
    Gender CHAR(1) CHECK (Gender IN ('M', 'F')),
    PhoneNumber NVARCHAR(15),
    Email NVARCHAR(100),
    Address NVARCHAR(255),
    BloodType CHAR(3),
    EmergencyContact NVARCHAR(100),
);

-- Doctors Table
CREATE TABLE Doctors (
    DoctorID INT PRIMARY KEY IDENTITY(1,1),
    FirstName NVARCHAR(50) NOT NULL,
    LastName NVARCHAR(50) NOT NULL,
    Specialty NVARCHAR(100) NOT NULL,
    PhoneNumber NVARCHAR(15),
    Email NVARCHAR(100) UNIQUE,
    LicenseNumber NVARCHAR(50) UNIQUE NOT NULL
);

-- Appointments Table
CREATE TABLE Appointments (
    AppointmentID INT PRIMARY KEY IDENTITY(1,1),
    PatientID INT FOREIGN KEY REFERENCES Patients(PatientID) ON DELETE CASCADE,
    DoctorID INT FOREIGN KEY REFERENCES Doctors(DoctorID) ON DELETE CASCADE,
    AppointmentDateTime DATETIME NOT NULL,
    Status NVARCHAR(50) CHECK (Status IN ('Scheduled', 'Completed', 'Canceled'))
);
CREATE TABLE MedicalRecords (
    RecordID INT PRIMARY KEY IDENTITY(1,1),
    PatientID INT FOREIGN KEY REFERENCES Patients(PatientID) ON DELETE CASCADE,
	DoctorID INT FOREIGN KEY REFERENCES Doctors(DoctorID) ON DELETE CASCADE,

    Diagnosis NVARCHAR(255) NOT NULL,
    Treatment NVARCHAR(255),
    RecordDate DATE NOT NULL DEFAULT GETDATE()
);


CREATE TABLE Prescriptions (
    PrescriptionID INT PRIMARY KEY IDENTITY(1,1),
    RecordID INT FOREIGN KEY REFERENCES MedicalRecords(RecordID) ON DELETE NO ACTION,
    Medication NVARCHAR(255) NOT NULL,
    Dosage NVARCHAR(100) NOT NULL,
    PrescriptionDate DATE NOT NULL DEFAULT GETDATE()
);

-- Medical Records Table


-- Prescriptions Table


-- Billing Table
CREATE TABLE Billing (
    InvoiceID INT PRIMARY KEY IDENTITY(1,1),
    AppointmentID INT FOREIGN KEY REFERENCES Appointments(AppointmentID) ON DELETE CASCADE,
    TotalAmount DECIMAL(10,2) NOT NULL,
    PaymentStatus NVARCHAR(50),
    BillingDate DATE NOT NULL DEFAULT GETDATE(),
	TipoDePago NVARCHAR(50)
)




-- Insurance Table

DROP DATABASE xHospital