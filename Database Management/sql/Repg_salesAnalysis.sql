-- Set line width and pagesize
-- Format columns for Sales Analysis View
-- this code is for format the output so that the result will be in a single line and look like a normal table
SET LINESIZE 200;
SET PAGESIZE 1000;

COLUMN ProductID FORMAT 9999;
COLUMN ProductName FORMAT A20;
COLUMN Category FORMAT A20;
COLUMN UnitsSold FORMAT 99999;
COLUMN Revenue FORMAT 99999.99;

-- Query for Sales Analysis View
SELECT 
    P.ProductID,
    P.ProductName,
    P.Category,
    S.UnitsSold,
    (S.UnitsSold * P.CurrentPrice) AS Revenue
FROM 
    Products P
JOIN 
    Sales S ON P.ProductID = S.ProductID;
