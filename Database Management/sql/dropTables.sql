-- Drop ProductSupplier table (dependent on Products and Suppliers)
DROP TABLE ProductSupplier CASCADE CONSTRAINTS;

-- Drop Sales table (dependent on Products)
DROP TABLE Sales CASCADE CONSTRAINTS;

-- Drop Inventory table (dependent on Products and Stores)
DROP TABLE Inventory CASCADE CONSTRAINTS;

-- Drop Suppliers table (no dependencies)
DROP TABLE Suppliers CASCADE CONSTRAINTS;

-- Drop Stores table (no dependencies)
DROP TABLE Stores CASCADE CONSTRAINTS;

-- Drop Products table (no dependencies after dropping ProductSupplier, Sales, and Inventory)
DROP TABLE Products CASCADE CONSTRAINTS;
