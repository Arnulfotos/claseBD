CREATE PROC uspCrearOrden(
@customerID AS INT,
@orderStatus AS INT,
@orderDate AS DATE,
@requiredDate AS DATE, 
@storeID AS INT, 
@staffID AS INT,
@CreatedID INT OUTPUT
)
AS
BEGIN

IF @customerID IS NULL OR @orderStatus IS NULL OR @orderDate IS NULL OR @requiredDate IS NULL OR @storeID IS NULL OR @storeID IS NULL
BEGIN
	SELECT 'No se permite valores vacios' as Message
END	
ELSE
	BEGIN
		INSERT INTO sales.orders(customer_id, order_status, order_date, required_date,store_id,staff_id)
		VALUES(@customerID,@orderStatus,@orderDate,@requiredDate,@storeID,@staffID);
		SET @CreatedID = SCOPE_IDENTITY();
	END
END

DECLARE @IDCreated INT;

EXEC uspCrearOrden 259,4,'2025-01-31','2025-01-31',1,2, @IDCreated OUTPUT;

SELECT @IDCreated AS 'ID Creado';

SELECT * FROM sales.orders WHERE order_id = 1616




CREATE PROC upsCreateOrderDetails(
	@orderID AS INT,
	@itemID AS INT,
	@productID AS INT,
	@Quantity AS INT,
	@ListPrice AS 


)


SELECT * FROM sales.order_items