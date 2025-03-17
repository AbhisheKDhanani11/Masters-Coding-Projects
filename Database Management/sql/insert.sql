-- Insert data into Products table
INSERT INTO Products (ProductID, ProductName, Category, CurrentPrice) VALUES (1001, 'Apple', 'Fruits', 2.00);
INSERT INTO Products (ProductID, ProductName, Category, CurrentPrice) VALUES (1002, 'Orange', 'Fruits', 2.50);
INSERT INTO Products (ProductID, ProductName, Category, CurrentPrice) VALUES (1003, 'Banana', 'Fruits', 1.20);
INSERT INTO Products (ProductID, ProductName, Category, CurrentPrice) VALUES (1004, 'Carrot', 'Vegetables', 1.00);
INSERT INTO Products (ProductID, ProductName, Category, CurrentPrice) VALUES (1005, 'Potato', 'Vegetables', 0.80);
INSERT INTO Products (ProductID, ProductName, Category, CurrentPrice) VALUES (1006, 'Lettuce', 'Vegetables', 1.50);
INSERT INTO Products (ProductID, ProductName, Category, CurrentPrice) VALUES (1007, 'Tomato', 'Vegetables', 2.20);
INSERT INTO Products (ProductID, ProductName, Category, CurrentPrice) VALUES (1008, 'Cucumber', 'Vegetables', 1.30);
INSERT INTO Products (ProductID, ProductName, Category, CurrentPrice) VALUES (1009, 'Broccoli', 'Vegetables', 3.00);
INSERT INTO Products (ProductID, ProductName, Category, CurrentPrice) VALUES (1010, 'Strawberry', 'Fruits', 4.00);

-- Insert data into Stores table
INSERT INTO Stores (StoreID, StoreLocation) VALUES (201, 'New York');
INSERT INTO Stores (StoreID, StoreLocation) VALUES (202, 'Los Angeles');
INSERT INTO Stores (StoreID, StoreLocation) VALUES (203, 'Chicago');
INSERT INTO Stores (StoreID, StoreLocation) VALUES (204, 'Houston');
INSERT INTO Stores (StoreID, StoreLocation) VALUES (205, 'Phoenix');
INSERT INTO Stores (StoreID, StoreLocation) VALUES (206, 'Philadelphia');
INSERT INTO Stores (StoreID, StoreLocation) VALUES (207, 'San Antonio');
INSERT INTO Stores (StoreID, StoreLocation) VALUES (208, 'San Diego');
INSERT INTO Stores (StoreID, StoreLocation) VALUES (209, 'Dallas');
INSERT INTO Stores (StoreID, StoreLocation) VALUES (210, 'San Jose');

-- Insert data into Inventory table
INSERT INTO Inventory (ProductID, StoreID, StockQuantity) VALUES (1001, 201, 100);
INSERT INTO Inventory (ProductID, StoreID, StockQuantity) VALUES (1002, 202, 150);
INSERT INTO Inventory (ProductID, StoreID, StockQuantity) VALUES (1003, 203, 200);
INSERT INTO Inventory (ProductID, StoreID, StockQuantity) VALUES (1004, 204, 180);
INSERT INTO Inventory (ProductID, StoreID, StockQuantity) VALUES (1005, 205, 220);
INSERT INTO Inventory (ProductID, StoreID, StockQuantity) VALUES (1006, 206, 170);
INSERT INTO Inventory (ProductID, StoreID, StockQuantity) VALUES (1007, 207, 190);
INSERT INTO Inventory (ProductID, StoreID, StockQuantity) VALUES (1008, 208, 160);
INSERT INTO Inventory (ProductID, StoreID, StockQuantity) VALUES (1009, 209, 140);
INSERT INTO Inventory (ProductID, StoreID, StockQuantity) VALUES (1010, 210, 120);

-- Insert data into Suppliers table
INSERT INTO Suppliers (SupplierID, SupplierName) VALUES (301, 'FreshFarm');
INSERT INTO Suppliers (SupplierID, SupplierName) VALUES (302, 'GreenWorld');
INSERT INTO Suppliers (SupplierID, SupplierName) VALUES (303, 'OrganicSupply');
INSERT INTO Suppliers (SupplierID, SupplierName) VALUES (304, 'VeggieHarvest');
INSERT INTO Suppliers (SupplierID, SupplierName) VALUES (305, 'FruitCo');
INSERT INTO Suppliers (SupplierID, SupplierName) VALUES (306, 'FarmFresh');
INSERT INTO Suppliers (SupplierID, SupplierName) VALUES (307, 'AgriSupply');
INSERT INTO Suppliers (SupplierID, SupplierName) VALUES (308, 'NatureGrown');
INSERT INTO Suppliers (SupplierID, SupplierName) VALUES (309, 'EcoFarms');
INSERT INTO Suppliers (SupplierID, SupplierName) VALUES (310, 'AgriFresh');

-- Insert data into ProductSupplier table
INSERT INTO ProductSupplier (ProductID, SupplierID, OrderQuantity) VALUES (1001, 301, 50);
INSERT INTO ProductSupplier (ProductID, SupplierID, OrderQuantity) VALUES (1002, 302, 40);
INSERT INTO ProductSupplier (ProductID, SupplierID, OrderQuantity) VALUES (1003, 303, 60);
INSERT INTO ProductSupplier (ProductID, SupplierID, OrderQuantity) VALUES (1004, 304, 55);
INSERT INTO ProductSupplier (ProductID, SupplierID, OrderQuantity) VALUES (1005, 305, 70);
INSERT INTO ProductSupplier (ProductID, SupplierID, OrderQuantity) VALUES (1006, 306, 65);
INSERT INTO ProductSupplier (ProductID, SupplierID, OrderQuantity) VALUES (1007, 307, 80);
INSERT INTO ProductSupplier (ProductID, SupplierID, OrderQuantity) VALUES (1008, 308, 90);
INSERT INTO ProductSupplier (ProductID, SupplierID, OrderQuantity) VALUES (1009, 309, 75);
INSERT INTO ProductSupplier (ProductID, SupplierID, OrderQuantity) VALUES (1010, 310, 85);

-- Insert data into Sales table
INSERT INTO Sales (ProductID, UnitsSold) VALUES (1001, 150);
INSERT INTO Sales (ProductID, UnitsSold) VALUES (1002, 120);
INSERT INTO Sales (ProductID, UnitsSold) VALUES (1003, 180);
INSERT INTO Sales (ProductID, UnitsSold) VALUES (1004, 200);
INSERT INTO Sales (ProductID, UnitsSold) VALUES (1005, 220);
INSERT INTO Sales (ProductID, UnitsSold) VALUES (1006, 180);
INSERT INTO Sales (ProductID, UnitsSold) VALUES (1007, 210);
INSERT INTO Sales (ProductID, UnitsSold) VALUES (1008, 190);
INSERT INTO Sales (ProductID, UnitsSold) VALUES (1009, 170);
INSERT INTO Sales (ProductID, UnitsSold) VALUES (1010, 150);
