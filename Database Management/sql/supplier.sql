-- Set line width and pagesize
-- Format columns for Supplier View
-- this code is for format the output so that the result will be in a single line and look like a normal table
SET LINESIZE 200;
SET PAGESIZE 1000;

COLUMN SupplierID FORMAT 9999;
COLUMN SupplierName FORMAT A20;
COLUMN ProductID FORMAT 9999;
COLUMN ProductName FORMAT A20;
COLUMN OrderQuantity FORMAT 99999;
COLUMN UnitPrice FORMAT 9999.99;
COLUMN TotalOrderPrice FORMAT 99999.99;

-- Query for Supplier View
SELECT 
    S.SupplierID,
    S.SupplierName,
    P.ProductID,
    P.ProductName,
    PS.OrderQuantity,
    P.CurrentPrice AS UnitPrice,
    (PS.OrderQuantity * P.CurrentPrice) AS TotalOrderPrice
FROM 
    Suppliers S
JOIN 
    ProductSupplier PS ON S.SupplierID = PS.SupplierID
JOIN 
    Products P ON PS.ProductID = P.ProductID;
