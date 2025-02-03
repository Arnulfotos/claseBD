USE BikeStores

SELECT * FROM sales.orders
SELECT * FROM sales.order_items
SELECT * FROM production.products

--1--
SELECT order_date, COUNT(order_id)
FROM sales.orders
GROUP BY order_date
ORDER BY order_date DESC

--2--

SELECT order_id, product_name, b.brand_name
FROM sales.order_items as o
INNER JOIN production.products as p
ON o.product_id = p.product_id
INNER JOIN production.brands as b
ON p.brand_id = b.brand_id

-- 3 --

SELECT
	p.product_id,
	product_name,
	model_year,
	list_price,
	brand_name,
	category_name,
	quantity
FROM production.products as p
INNER JOIN production.brands as b
ON p.brand_id = b.brand_id
INNER JOIN production.categories as c
ON p.category_id = c.category_id
INNER JOIN production.stocks as s
ON p.product_id = s.product_id

--4--

SELECT
	b.brand_name,
	product_name,
	model_year,
	list_price,
	category_name
FROM production.products as p
INNER JOIN production.brands as b
ON p.brand_id = b.brand_id
INNER JOIN production.categories as c
ON p.category_id = c.category_id
ORDER BY b.brand_id

SELECT COUNT(*) as TotalProducts FROM production.products

--5--
SELECT 
	st.store_name,
	first_name,
	last_name,
	s.phone
FROM sales.staffs as s
INNER JOIN sales.stores as st
ON s.store_id = st.store_id

--6--
SELECT
	order_id,
	c.first_name,
	c.last_name,
	order_date,
	required_date,
	shipped_date,
	st.store_name,
	stf.first_name
FROM sales.orders as s
INNER JOIN sales.customers as c
ON s.customer_id = c.customer_id
INNER JOIN sales.stores as st
ON s.store_id = st.store_id
INNER JOIN sales.staffs as stf
ON s.staff_id = stf.staff_id
WHERE required_date
IS NOT NULL AND required_date
BETWEEN '2016-01-03'AND '2016-02-04'

--7--
CREATE VIEW sales.inventory
AS 
SELECT
	p.product_id,
	product_name,
	model_year,
	list_price,
	brand_name,
	category_name,
	quantity
FROM production.products as p
INNER JOIN production.brands as b
ON p.brand_id = b.brand_id
INNER JOIN production.categories as c
ON p.category_id = c.category_id
INNER JOIN production.stocks as s
ON p.product_id = s.product_id

SELECT * FROM sales.inventory

CREATE VIEW sales.orders_with_product
AS 
SELECT order_id, product_name, b.brand_name
FROM sales.order_items as o
INNER JOIN production.products as p
ON o.product_id = p.product_id
INNER JOIN production.brands as b
ON p.brand_id = b.brand_id

SELECT * FROM sales.orders_with_product

--8--
SELECT TOP 10
	oi.product_id, p.product_name,SUM(quantity) as TotalVendidos, st.store_name
FROM sales.order_items as oi
INNER JOIN production.products as p
ON oi.product_id = p.product_id
INNER JOIN sales.orders as ord
ON oi.order_id = ord.order_id
INNER JOIN sales.stores as st
ON ord.store_id = st.store_id
GROUP BY oi.product_id,p.product_name, st.store_name
ORDER BY TotalVendidos DESC

SELECT TOP 10
	oi.product_id, p.product_name,SUM(quantity) as TotalVendidos
FROM sales.order_items as oi
INNER JOIN production.products as p
ON oi.product_id = p.product_id
INNER JOIN sales.orders as ord
ON oi.order_id = ord.order_id
INNER JOIN sales.stores as st
ON ord.store_id = st.store_id
GROUP BY oi.product_id,p.product_name
ORDER BY TotalVendidos DESC


SELECT * FROM sales.order_items as oi
INNER JOIN production.products as p
ON oi.product_id = p.product_id
WHERE oi.product_id = 6

SELECT
	oi.product_id, p.product_name,st.store_name, SUM(quantity) as TotalVendidos
FROM sales.order_items as oi
INNER JOIN production.products as p
ON oi.product_id = p.product_id
INNER JOIN sales.orders as ord
ON oi.order_id = ord.order_id
INNER JOIN sales.stores as st
ON ord.store_id = st.store_id
WHERE oi.product_id = 6
GROUP BY store_name, oi.product_id, p.product_name
ORDER BY store_name