-- Q1. How many staff are there in all of the UK stores?
SELECT * FROM dim_store;

SELECT 
    COUNT(staff_numbers) AS total_uk_staff
FROM dim_store
WHERE country = 'UK';

-- Total number of UK staff is 265.


-- Q2. Which month in 2022 has had the highest revenue?
SELECT * FROM dim_date;

SELECT * FROM orders;

SELECT * FROM dim_product;

SELECT
    month_name,
    SUM(product_quantity * sale_price) AS total_revenue
FROM orders
JOIN dim_product ON orders.product_code = dim_product.product_code
JOIN dim_date ON orders.order_date = dim_date.date
WHERE year = 2022
GROUP BY month_name
ORDER BY total_revenue DESC;

-- The month with the highest revenue for 2022 is August.

-- Q3. Which German store type had the highest revenue for 2022?
SELECT * FROM dim_store;

SELECT * FROM dim_date;

SELECT * FROM orders;

SELECT
    country,
    store_type,
    SUM(orders.product_quantity * dim_product.sale_price) AS total_revenue
FROM orders
JOIN dim_store ON orders.store_code = dim_store.store_code
JOIN dim_product ON orders.product_code = dim_product.product_code
JOIN dim_date ON orders.order_date = dim_date.date
WHERE (year = 2022 AND country = 'Germany')
GROUP BY country, store_type
ORDER BY total_revenue DESC;

-- The store type with the highest revenue in 2022 in Germany was 'Local'.


--Q4. Create a view where the rows are the store types and the columns are the total sales and count of orders.
SELECT * FROM dim_store;

SELECT * FROM orders;

SELECT * FROM dim_customer;

SELECT 
    store_type,
    SUM(product_quantity * dim_product.sale_price) AS sales,
    COUNT(order_date_uuid) AS count_of_orders
FROM orders
JOIN dim_store ON orders.store_code = dim_store.store_code
JOIN dim_product ON orders.product_code = dim_product.product_code
GROUP BY store_type
ORDER BY sales DESC;

-- percentage total sales = (sales/SUM(sales)) AS percentage_sales


-- Q5. Which product category generated the most profit for the 'Wiltshire, UK' region in 2021?
SELECT * FROM dim_product;

SELECT * FROM dim_store;

SELECT 
    category,
    SUM((dim_product.sale_price - dim_product.cost_price) * product_quantity) AS profit
FROM orders
JOIN dim_product ON orders.product_code = dim_product.product_code
JOIN dim_store ON orders.store_code = dim_store.store_code
JOIN dim_date ON orders.order_date = dim_date.date
WHERE (country_region = 'Wiltshire' AND country = 'UK' AND year = 2021)
GROUP BY category
ORDER BY profit DESC;

-- Homeware generated the most profit for 'Wiltshire, UK in 2021.