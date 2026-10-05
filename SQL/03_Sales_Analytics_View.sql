USE PlantsSales_SQL;
GO

CREATE VIEW vw_Sales_Analytics AS
SELECT
    s.sale_id,
    s.sale_date,

    s.product_id,
    p.product_name,
    p.category,

    s.customer_id,
    c.first_name,
    c.last_name,
    c.city AS customer_city,
    c.province AS customer_province,

    s.seller_id,
    se.seller_name,
    se.city AS seller_city,
    se.province AS seller_province,

    s.quantity,
    s.unit_price,
    s.unit_cost,
    s.discount_percent,
    s.tax_rate,
    s.shipping_cost,
    s.total_amount,

    sh.ship_date,
    sh.delivery_date,
    sh.carrier,
    sh.status AS shipping_status

FROM vw_Sales_Clean AS s

INNER JOIN Products AS p
    ON s.product_id = p.product_id

INNER JOIN Customers AS c
    ON s.customer_id = c.customer_id

INNER JOIN Sellers AS se
    ON s.seller_id = se.seller_id

INNER JOIN Shipping AS sh
    ON s.sale_id = sh.sale_id;
GO
