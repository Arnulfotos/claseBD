-1-
INSERT INTO BikeStores.sales.stores VALUES
	('Downtown Tijuana', '(664) 204-2152', 'downtowntjshop@bike.shop', '8893 Emiliano Zapata', 'Tijuana', 'BC', '22000' ),
	('La Presa Tijuana', '(664) 544-3671', 'lapresatjshop@bike.shop', '85 Presa Melchor Ocampo', 'Tijuana', 'BC', '22118' ),
	('Otay Tijuana', '(664) 386-9909', 'otaytjshop@bike.shop', '651 Av Universidad', 'Tijuana', 'BC', '24109' )

-2-
UPDATE BikeStores.sales.stores
SET phone = '6643570972', email = 'centrotj@bike.shop', street = '6591 Flores Magon'
WHERE store_id = 4

UPDATE BikeStores.sales.stores
SET phone = '66469890344', email = 'presatj@bike.shop', street = '65 Presa Abelardo L. Rodriguez'
WHERE store_id = 5

UPDATE BikeStores.sales.stores
SET phone = '6641320908', email = 'bellasartestj@bike.shop', street = '671 Blvd. Industrial'
WHERE store_id = 6

-3-

DELETE FROM BikeStores.sales.stores WHERE store_id = 6;


-4-


INSERT INTO BikeStores.sales.orders VALUES
(259,4,'2025-02-01','2025-02-01','2025-02-01' ,1,2),
(259,4,'2025-02-01','2025-02-01','2025-02-01',1,2)


INSERT INTO BikeStores.sales.order_items VALUES
(1617,1,16,2,599.99,0.05),
(1617,2,20,1,599.99,0.07),
(1617,3,4,1,2899.99,0.20),
(1618,1,16,2,599.99,0.05),
(1618,2,20,1,599.99,0.07),
(1618,3,4,1,2899.99,0.20)

-5-

SELECT * FROM BikeStores.sales.orders WHERE order_date >= '2025-01-31' ORDER BY order_status DESC;

-6-
SELECT * FROM BikeStores.sales.customers ORDER BY LOWER(first_name);

-7-
SELECT * FROM BikeStores.production.products  WHERE list_price > 1000 ORDER BY list_price;

-8-
SELECT * FROM BikeStores.sales.order_items WHERE list_price BETWEEN 500 AND 1200 ORDER BY list_price

-9-
SELECT * FROM BikeStores.production.brands ORDER BY brand_name DESC

-10-
SELECT * FROM BikeStores.sales.staffs WHERE active = 1


SELECT * FROM BikeStores.sales.order_items WHERE order_id IN(1617,1618)
SELECT * FROM BikeStores.sales.orders ORDER BY order_date DESC;
SELECT * FROM BikeStores.sales.stores