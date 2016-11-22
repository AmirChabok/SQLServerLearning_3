USE SQL2012SBS
GO

DROP TABLE Customers.Customer
GO

CREATE TABLE Customers.Customer
(CustomerID     INT         IDENTITY(1,1),
CompanyName     VARCHAR(50) NULL,
FirstName       VARCHAR(50) NULL,
LastName        VARCHAR(50) NULL,
ModifiedDate    DATE        NOT NULL,
CONSTRAINT pk_customer PRIMARY KEY (CustomerID))
GO

DROP TABLE Customers.CustomerAddress
GO

CREATE TABLE Customers.CustomerAddress
(AddressID      INT         IDENTITY(1,1),
AddressType     VARCHAR(20) NOT NULL,
AddressLine1    VARCHAR(50) NOT NULL,
AddressLine2    VARCHAR(50) NULL,
AddressLine3    VARCHAR(50) NULL,
City            VARCHAR(50) NOT NULL,
StateProvince   VARCHAR(50) NULL,
Country         VARCHAR(70) NULL,
CONSTRAINT pk_customeraddress PRIMARY KEY (AddressID))
GO

DROP TABLE Orders.OrderHeader
GO

CREATE TABLE Orders.OrderHeader
(OrderID        INT         IDENTITY(1,1),
OrderDate       DATE        NOT NULL,
SubTotal        MONEY       NOT NULL,
TaxAmount       MONEY       NOT NULL,
ShippingAmount  MONEY       NOT NULL,
GrandTotal      AS (SubTotal + TaxAmount + ShippingAmount),
FinalShipDate   DATE        NULL,
CONSTRAINT pk_orderheader PRIMARY KEY (OrderID))
GO