CREATE TABLE Users (
	UserID INT PRIMARY KEY IDENTITY(1,1),
	UserName VARCHAR(50) NOT NULL,
	Rol VARCHAR(50) NOT NULL,
	Correo VARCHAR(50) NOT NULL)

CREATE TABLE Estatus (
	StatusID INT PRIMARY KEY IDENTITY(1,1),
	Estatus VARCHAR(20) NOT NULL
)
INSERT INTO Users VALUES ('Arnulfotos', 'Admin','mleon96@uabc.edu.mx')
INSERT INTO Estatus VALUES ('Nuevo'), ('Editado'), ('Eliminado')

SELECT * FROM Estatus
SELECT * FROM Users


SELECT * FROM sales.orders
SELECT * FROM sales.staffs

ALTER TABLE sales.orders
ADD UserID INT,
FOREIGN KEY(UserID) REFERENCES Users(UserID);

ALTER TABLE sales.staffs
ADD UserID INT,
FOREIGN KEY(UserID) REFERENCES Users(UserID);

ALTER TABLE sales.customers
ADD UserID INT,
FOREIGN KEY(UserID) REFERENCES Users(UserID);

ALTER TABLE sales.stores
ADD UserID INT,
FOREIGN KEY(UserID) REFERENCES Users(UserID);

CREATE TABLE LogTransaction(
	TransID INT PRIMARY KEY IDENTITY(1,1),
	TablaOrigen VARCHAR(50) NOT NULL,
	OrigenID INT NOT NULL,
	UserID INT NOT NULL FOREIGN KEY REFERENCES Users(UserID),
	EstatusID INT NOT NULL FOREIGN KEY REFERENCES Estatus(StatusID),
	FechaHora DATETIME2 DEFAULT GETDATE()
)

CREATE TRIGGER TrgAddOrder
	ON sales.orders
	AFTER INSERT
AS
	BEGIN

	INSERT INTO LogTransaction(TablaOrigen,OrigenID,UserId, EstatusID)
	SELECT 'Orders',inserted.order_id,inserted.UserID,1 FROM inserted

	END

CREATE TRIGGER TrgEditOrder
	ON sales.orders
	AFTER UPDATE
AS
	BEGIN

	INSERT INTO LogTransaction(TablaOrigen,OrigenID,UserId, EstatusID)
	SELECT 'Orders',inserted.order_id,inserted.UserID,2 FROM inserted

	END

CREATE TRIGGER TrgDeleteOrder
	ON sales.orders
	AFTER DELETE
AS
	BEGIN

	INSERT INTO LogTransaction(TablaOrigen,OrigenID,UserId, EstatusID)
	SELECT 'Orders',deleted.order_id,deleted.UserID,3 FROM deleted

	END

--UPDATE sales.orders SET UserID = 1--

INSERT INTO sales.orders(customer_id,order_status,order_date,required_date,shipped_date,store_id,staff_id,UserID) VALUES (3,4,'2025-02-10', '2025-02-10','2025-02-10', 1,2,1)
UPDATE sales.orders SET order_status = 1 WHERE order_id = 1620
DELETE FROM sales.orders WHERE order_id = 1619

SELECT * FROM sales.orders ORDER BY order_date DESC
SELECT * FROM LogTransaction ORDER BY FechaHora DESC

CREATE TRIGGER TrgAddStaff
	ON sales.staffs
	AFTER INSERT
AS
	BEGIN

	INSERT INTO LogTransaction(TablaOrigen,OrigenID,UserId, EstatusID)
	SELECT 'Staff',inserted.staff_id,inserted.UserID,1 FROM inserted

	END

CREATE TRIGGER TrgEditStaff
	ON sales.staffs
	AFTER UPDATE
AS
	BEGIN

	INSERT INTO LogTransaction(TablaOrigen,OrigenID,UserId, EstatusID)
	SELECT 'Staff',inserted.staff_id,inserted.UserID,2 FROM inserted

	END

CREATE TRIGGER TrgDeleteStaff
	ON sales.staffs
	AFTER DELETE
AS
	BEGIN

	INSERT INTO LogTransaction(TablaOrigen,OrigenID,UserId, EstatusID)
	SELECT 'Staff',deleted.staff_id,deleted.UserID,3 FROM deleted

	END


INSERT INTO sales.staffs(first_name,last_name,email,phone,active,store_id,UserID) VALUES ('Arnulfo', 'Leon','mleon@bike.shop','(664)2259769', 1,3,1)
UPDATE sales.staffs SET store_id = 2 WHERE staff_id = 11
DELETE FROM sales.staffs WHERE staff_id = 11

SELECT * FROM sales.staffs ORDER BY staff_id DESC
SELECT * FROM LogTransaction ORDER BY FechaHora DESC