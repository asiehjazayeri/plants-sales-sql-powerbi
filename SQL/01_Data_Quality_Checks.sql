USE PlantsSales_SQL;
GO

-- 1. Check total number of sales records
SELECT
    COUNT(*) AS Total_Rows
FROM Sales;
GO


-- 2. Check missing values in key Sales columns
SELECT
    COUNT(*) AS Total_Rows,
    SUM(CASE WHEN product_id IS NULL THEN 1 ELSE 0 END) AS Missing_Product,
    SUM(CASE WHEN customer_id IS NULL THEN 1 ELSE 0 END) AS Missing_Customer,
    SUM(CASE WHEN seller_id IS NULL THEN 1 ELSE 0 END) AS Missing_Seller,
    SUM(CASE WHEN quantity IS NULL THEN 1 ELSE 0 END) AS Missing_Quantity,
    SUM(CASE WHEN total_amount IS NULL THEN 1 ELSE 0 END) AS Missing_Total_Amount
FROM vw_Sales_Clean;
GO


-- 3. Validate Product and Customer relationships
SELECT
    COUNT(*) AS Total_Rows,
    COUNT(p.product_id) AS Matched_Products,
    COUNT(c.customer_id) AS Matched_Customers
FROM vw_Sales_Clean AS s
LEFT JOIN Products AS p
    ON s.product_id = p.product_id
LEFT JOIN Customers AS c
    ON s.customer_id = c.customer_id;
GO


-- 4. Validate Seller and Shipping relationships
SELECT
    COUNT(*) AS Total_Rows,
    COUNT(se.seller_id) AS Matched_Sellers,
    COUNT(sh.sale_id) AS Matched_Shipping
FROM vw_Sales_Clean AS s
LEFT JOIN Sellers AS se
    ON s.seller_id = se.seller_id
LEFT JOIN Shipping AS sh
    ON s.sale_id = sh.sale_id;
GO


-- 5. Check invalid financial values
SELECT
    SUM(CASE WHEN quantity <= 0 THEN 1 ELSE 0 END) AS Invalid_Quantity,
    SUM(CASE WHEN unit_price <= 0 THEN 1 ELSE 0 END) AS Invalid_Unit_Price,
    SUM(CASE WHEN unit_cost <= 0 THEN 1 ELSE 0 END) AS Invalid_Unit_Cost,
    SUM(CASE WHEN total_amount <= 0 THEN 1 ELSE 0 END) AS Invalid_Total_Amount
FROM vw_Sales_Clean;
GO
