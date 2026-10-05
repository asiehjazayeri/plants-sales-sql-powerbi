
# Plants Sales — SQL Data Preparation & Power BI

SQL Server project for cleaning, validating, transforming, and preparing sales data for Power BI analysis.

## Project Overview

The project uses sales data from a Canadian plants and trees retail business.

The main focus is on using **SQL Server to prepare reliable, analysis-ready data** before connecting it to Power BI.

## SQL Operations

The following SQL operations were performed:

- Imported raw CSV data into SQL Server.
- Corrected inappropriate data types.
- Converted numeric fields to `DECIMAL`.
- Converted discount and tax values into numeric percentages.
- Checked for missing and invalid values.
- Validated relationships between related tables.
- Joined Sales with Products, Customers, Sellers, and Shipping.
- Created SQL Views for cleaned and analysis-ready data.
- Performed basic sales analysis using `SUM`, `AVG`, `COUNT`, `GROUP BY`, and `ORDER BY`.

## SQL Views

Two main views were created:

- `vw_Sales_Clean` — cleans and standardizes the Sales data.
- `vw_Sales_Analytics` — combines Sales with related dimension tables for analysis.

## Power BI

The final SQL View was connected to Power BI and used to create DAX measures and dashboard analysis.

## Tools

- SQL Server
- SQL Server Management Studio (SSMS)
- Power BI
- DAX
