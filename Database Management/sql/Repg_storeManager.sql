-- Set line width and pagesize
-- Format columns for storemanager View
-- this code is for format the output so that the result will be in a single line and look like a normal table
SET LINESIZE 200;
SET PAGESIZE 1000;
COLUMN ProductID FORMAT 9999;
COLUMN ProductName FORMAT A20;
COLUMN Category FORMAT A20;
COLUMN StockQuantity FORMAT 99999;
COLUMN StoreID FORMAT 9999;
COLUMN StoreLocation FORMAT A20;

-- Query for Store Manager View
SELECT 
    P.ProductID,
    P.ProductName,
    P.Category,
    I.StockQuantity,
    I.StoreID,
    S.StoreLocation
FROM 
    Products P
JOIN 
    Inventory I ON P.ProductID = I.ProductID
JOIN 
    Stores S ON I.StoreID = S.StoreID;
