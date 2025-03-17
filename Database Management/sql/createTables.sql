-- Create Products table
CREATE TABLE Products (
    ProductID INTEGER PRIMARY KEY,
    ProductName VARCHAR(50) NOT NULL,
    Category VARCHAR(30) NOT NULL,
    CurrentPrice DECIMAL(10, 2) NOT NULL CHECK (CurrentPrice >= 0.01 AND CurrentPrice <= 10000)
);

-- Create Stores table
CREATE TABLE Stores (
    StoreID INTEGER PRIMARY KEY,
    StoreLocation VARCHAR(50) NOT NULL
);

-- Create Inventory table
CREATE TABLE Inventory (
    ProductID INTEGER,
    StoreID INTEGER,
    StockQuantity INTEGER NOT NULL CHECK (StockQuantity >= 0),
    PRIMARY KEY (ProductID, StoreID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID),
    FOREIGN KEY (StoreID) REFERENCES Stores(StoreID)
);

-- Create Suppliers table
CREATE TABLE Suppliers (
    SupplierID INTEGER PRIMARY KEY,
    SupplierName VARCHAR(50) NOT NULL
);

-- Create Product-Supplier table
CREATE TABLE ProductSupplier (
    ProductID INTEGER,
    SupplierID INTEGER,
    OrderQuantity INTEGER NOT NULL CHECK (OrderQuantity > 0),
    PRIMARY KEY (ProductID, SupplierID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID),
    FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID)
);

-- Create Sales table
CREATE TABLE Sales (
    ProductID INTEGER PRIMARY KEY,
    UnitsSold INTEGER NOT NULL CHECK (UnitsSold >= 0),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);
