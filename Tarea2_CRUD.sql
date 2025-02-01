INSERT INTO BikeStores.sales.stores VALUES
	('Downtown Tijuana', '(664) 204-2152', 'downtowntjshop@bike.shop', '8893 Emiliano Zapata', 'Tijuana', 'BC', '22000' ),
	('La Presa Tijuana', '(664) 544-3671', 'lapresatjshop@bike.shop', '85 Presa Melchor Ocampo', 'Tijuana', 'BC', '22118' ),
	('Otay Tijuana', '(664) 386-9909', 'otaytjshop@bike.shop', '651 Av Universidad', 'Tijuana', 'BC', '24109' )


UPDATE BikeStores.sales.stores
SET phone = '6643570972', email = 'centrotj@bike.shop', street = '6591 Flores Magon'
WHERE store_id = 4

UPDATE BikeStores.sales.stores
SET phone = '66469890344', email = 'presatj@bike.shop', street = '65 Presa Abelardo L. Rodriguez'
WHERE store_id = 5

UPDATE BikeStores.sales.stores
SET phone = '6641320908', email = 'bellasartestj@bike.shop', street = '671 Blvd. Industrial'
WHERE store_id = 6

DELETE FROM BikeStores.sales.stores WHERE store_id = 6

SELECT * FROM BikeStores.sales.orders
SELECT * FROM BikeStores.sales.order_items


INSERT INTO

SELECT * FROM BikeStores.sales.stores