-- 04_Analysis_Queries.sql
-- Analysis queries using the cleaned and analysis-ready data

USE PlantsSales_SQL;
GO


-- 1. Total Sales
SELECT
    SUM(quantity * unit_price) AS Total_Sales
FROM vw_Sales_Clean;
GO


-- 2. Sales by Year
SELECT
    YEAR(sale_date) AS Sales_Year,
    SUM(quantity * unit_price) AS Total_Sales
FROM vw_Sales_Clean
GROUP BY YEAR(sale_date)
ORDER BY Sales_Year;
GO


-- 3. Sales by Category
SELECT
    p.category AS Category,
    COUNT(s.sale_id) AS Number_of_Sales,
    SUM(s.total_amount) AS Total_Sales,
    AVG(s.total_amount) AS Average_Sale
FROM vw_Sales_Clean AS s
INNER JOIN Products AS p
    ON s.product_id = p.product_id
GROUP BY p.category
ORDER BY Total_Sales DESC;
GO


-- 4. Sales by Province
SELECT
    c.province AS Province,
    SUM(s.total_amount) AS Total_Sales
FROM vw_Sales_Clean AS s
INNER JOIN Customers AS c
    ON s.customer_id = c.customer_id
GROUP BY c.province
ORDER BY Total_Sales DESC;
GO


-- 5. Top 10 Products by Sales
SELECT TOP 10
    p.product_name AS Product,
    SUM(s.total_amount) AS Total_Sales
FROM vw_Sales_Clean AS s
INNER JOIN Products AS p
    ON s.product_id = p.product_id
GROUP BY p.product_name
ORDER BY Total_Sales DESC;
GO


-- 6. Sales by Seller
SELECT
    se.seller_name AS Seller,
    COUNT(s.sale_id) AS Number_of_Sales,
    SUM(s.total_amount) AS Total_Sales
FROM vw_Sales_Clean AS s
INNER JOIN Sellers AS se
    ON s.seller_id = se.seller_id
GROUP BY se.seller_name
ORDER BY Total_Sales DESC;
GO
