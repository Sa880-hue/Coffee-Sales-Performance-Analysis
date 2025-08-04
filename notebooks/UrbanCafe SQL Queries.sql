-- SQL Guide to The Urban Cafe Sales Dashboard

-- Platform Used:phpmyadmin 


-- STEP 1: CREATE TABLE
CREATE TABLE coffeefactory (
    transaction_id INT,
    transaction_date DATE,
    year_month VARCHAR(7),
    weekday VARCHAR(10),
    transaction_time TIME,
    hour INT,
    transactioon_qty_store_id INT,
    store_location VARCHAR(50),
    product_id INT,
    unit_price FLOAT,
    revenue FLOAT,
    profit FLOAT,
    product_category VARCHAR(50),
    product_type VARCHAR(50),
    product_detail VARCHAR(100)
);

--  STEP 2: IMPORT DATA
-- Import your cleaned CSV via phpMyAdmin UI: Import > Choose File > Format: CSV > Execute

--  STEP 3: CLEANING DATA
-- 3.1 Remove duplicates
DELETE t1 FROM coffeefactory t1
INNER JOIN coffeefactory t2 
ON t1.transaction_id = t2.transaction_id AND t1.store_location = t2.store_location
WHERE t1.transaction_id > t2.transaction_id;

-- 3.2 Remove rows with NULL or invalid revenue
DELETE FROM coffeefactory
WHERE revenue IS NULL OR revenue <= 0;

--  STEP 4: ANALYTICAL QUERIES

-- 4.1 Total Revenue by Store
SELECT store_location, SUM(revenue) AS total_revenue
FROM coffeefactory
GROUP BY store_location;

-- 4.2 Total Revenue by Month
SELECT year_month, SUM(revenue) AS monthly_revenue
FROM coffeefactory
GROUP BY year_month
ORDER BY year_month;

-- 4.3 Daily Revenue Trend
SELECT transaction_date, SUM(revenue) AS daily_revenue
FROM coffeefactory
GROUP BY transaction_date
ORDER BY transaction_date;

-- 4.4 Revenue by Product Category
SELECT product_category, SUM(revenue) AS category_revenue
FROM coffeefactory
GROUP BY product_category
ORDER BY category_revenue DESC;

-- 4.5 Best-Selling Product per Store
SELECT store_location, product_type, SUM(transactioon_qty_store_id) AS total_units
FROM coffeefactory
GROUP BY store_location, product_type
ORDER BY store_location, total_units DESC;

-- 4.6 Peak Sales Hour
SELECT hour, SUM(revenue) AS hourly_revenue
FROM coffeefactory
GROUP BY hour
ORDER BY hourly_revenue DESC;

-- 4.7 Weekday vs Weekend Analysis
SELECT weekday, SUM(revenue) AS revenue_by_day
FROM coffeefactory
GROUP BY weekday;

-- 4.8 Monthly Profit Trend
SELECT year_month, SUM(profit) AS monthly_profit
FROM coffeefactory
GROUP BY year_month
ORDER BY year_month;

-- 4.9 Top Products by Revenue
SELECT product_detail, SUM(revenue) AS product_revenue
FROM coffeefactory
GROUP BY product_detail
ORDER BY product_revenue DESC
LIMIT 10;

-- 4.10 Store-Category Matrix
SELECT store_location, product_category, SUM(revenue) AS total_revenue
FROM coffeefactory
GROUP BY store_location, product_category
ORDER BY store_location;

--  ADDITIONAL QUERIES BASED ON EXCEL-STYLE INSIGHTS

-- 4.11 Weekday vs Weekend Tagging 
-- You'd do this in Excel, but SQL could use CASE:
SELECT *,
  CASE 
    WHEN weekday IN ('Saturday', 'Sunday') THEN 'Weekend'
    ELSE 'Weekday'
  END AS day_type
FROM coffeefactory;

-- 4.12 Monthly Growth (MoM)
-- Calculate total revenue per month then compute growth manually in Excel
SELECT year_month, SUM(revenue) AS revenue
FROM coffeefactory
GROUP BY year_month
ORDER BY year_month;

-- 4.13 Revenue by Store and Month
SELECT store_location, year_month, SUM(revenue) AS monthly_store_revenue
FROM coffeefactory
GROUP BY store_location, year_month
ORDER BY store_location, year_month;

-- 4.14 Store Location + Product Type Summary
SELECT store_location, product_type, SUM(transactioon_qty_store_id) AS quantity
FROM coffeefactory
GROUP BY store_location, product_type;

-- 4.15 Daily Revenue by Store
SELECT store_location, transaction_date, SUM(revenue) AS daily_store_revenue
FROM coffeefactory
GROUP BY store_location, transaction_date
ORDER BY store_location, transaction_date;

