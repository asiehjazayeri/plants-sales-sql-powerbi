USE PlantsSales_SQL;
GO

CREATE VIEW vw_Sales_Clean AS
SELECT
    sale_id,
    sale_date,
    product_id,
    customer_id,
    seller_id,
    quantity,
    CAST(unit_price AS DECIMAL(18,2)) AS unit_price,
    CAST(unit_cost AS DECIMAL(18,2)) AS unit_cost,
    DATEPART(MINUTE, TRY_CONVERT(time, discount_percent)) AS discount_percent,
    DATEPART(MINUTE, TRY_CONVERT(time, tax_rate)) AS tax_rate,
    CAST(shipping_cost AS DECIMAL(18,2)) AS shipping_cost,
    CAST(total_amount AS DECIMAL(18,2)) AS total_amount
FROM Sales;
GO
