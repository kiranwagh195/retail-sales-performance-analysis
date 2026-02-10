-- Q1) What is the overall health of our FMCG business in terms of total revenue, order volume, and units sold?
SELECT 
    SUM("TotalRevenue") AS total_revenue, 
    COUNT(DISTINCT "Invoice") AS total_orders,
    SUM("Quantity") AS total_items_sold
FROM fact_sales;


-- Q2) Who are our "Top 10 Whales" (highest value customers) we should target for a loyalty program?
SELECT 
    "Customer ID", 
    SUM("TotalRevenue") AS lifetime_value,
    COUNT(DISTINCT "Invoice") AS order_frequency
FROM fact_sales
GROUP BY "Customer ID"
ORDER BY lifetime_value DESC
LIMIT 10;



-- Q3) Fixed Market Share Analysis with Type Casting
SELECT 
    "Country", 
    SUM("TotalRevenue") AS country_revenue,
    ROUND(
        CAST(SUM("TotalRevenue") * 100.0 / (SELECT SUM("TotalRevenue") FROM fact_sales) AS numeric), 
        2
    ) AS revenue_percentage
FROM fact_sales
GROUP BY "Country"
ORDER BY country_revenue DESC;


-- Q4) What are our top 5 "Volume Drivers" (products with the highest quantity sold) for warehouse optimization?
SELECT 
    "Description", 
    SUM("Quantity") AS total_quantity
FROM fact_sales
GROUP BY "Description"
ORDER BY total_quantity DESC
LIMIT 5;


-- Q5) What are the monthly sales trends? (Used to identify peak seasonality for 2026 planning).
SELECT 
    DATE_TRUNC('month', "InvoiceDate"::timestamp) AS sales_month, 
    SUM("TotalRevenue") AS monthly_revenue
FROM fact_sales
GROUP BY sales_month
ORDER BY sales_month;


-- Q6) What is our current Average Order Value (AOV), and how does it compare to our retail benchmarks?
SELECT 
    SUM("TotalRevenue") / COUNT(DISTINCT "Invoice") AS average_order_value
FROM fact_sales;


-- Q7) How many "One-Time Buyers" do we have?
WITH customer_orders AS (
    SELECT "Customer ID", COUNT(DISTINCT "Invoice") as order_count
    FROM fact_sales
    GROUP BY "Customer ID"
)
SELECT COUNT(*) AS one_time_buyers
FROM customer_orders
WHERE order_count = 1;


-- Q8) Which 10 products are our "Value Leaders" generating the highest total revenue?
SELECT 
    "Description", 
    SUM("TotalRevenue") AS product_revenue
FROM fact_sales
GROUP BY "Description"
ORDER BY product_revenue DESC
LIMIT 10;


-- Q9) At what time of day do we process the most transactions? (Used for server and support staffing).
SELECT 
    EXTRACT(HOUR FROM "InvoiceDate"::timestamp) AS hour_of_day, 
    COUNT(DISTINCT "Invoice") AS transaction_count
FROM fact_sales
GROUP BY hour_of_day
ORDER BY transaction_count DESC;


-- Q10) What is our monthly customer retention rate (returning customers from the previous month)?
WITH monthly_active AS (
    SELECT DISTINCT "Customer ID", DATE_TRUNC('month', "InvoiceDate"::timestamp) as active_month
    FROM fact_sales
)
SELECT 
    curr.active_month, 
    COUNT(DISTINCT curr."Customer ID") AS returning_customers
FROM monthly_active curr
JOIN monthly_active prev 
    ON curr."Customer ID" = prev."Customer ID" 
    AND curr.active_month = prev.active_month + INTERVAL '1 month'
GROUP BY curr.active_month
ORDER BY curr.active_month;


