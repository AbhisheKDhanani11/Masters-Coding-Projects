-- Set line width and pagesize
-- Format columns for Pricing Team View
-- this code is for format the output so that the result will be in a single line and look like a normal table
SET LINESIZE 200;
SET PAGESIZE 1000;

COLUMN ProductID FORMAT 9999;
COLUMN ProductName FORMAT A20;
COLUMN CurrentPrice FORMAT 9999.99;

-- Query for Pricing Team View
SELECT 
    P.ProductID,
    P.ProductName,
    P.CurrentPrice
FROM 
    Products P;
