USE SQL2012SBS
GO

DROP TABLE Customers.Customer
GO

CREATE TABLE Customers.Customer
(CustomerID     INT         IDENTITY(1,1),
CompanyName     VARCHAR(50) NULL,
FirstName       VARCHAR(50) NULL,
LastName        VARCHAR(50) NULL,
ModifiedDate    DATE        NOT NULL CONSTRAINT df_modifieddate DEFAULT GETDATE(),
CONSTRAINT pk_customer PRIMARY KEY (CustomerID))
GO

DROP TABLE Orders.OrderHeader
GO

CREATE TABLE Orders.OrderHeader
(OrderID        INT         IDENTITY(1,1),
OrderDate       DATE        NOT NULL CONSTRAINT df_orderdate DEFAULT GETDATE(),
SubTotal        MONEY       NOT NULL CONSTRAINT ck_subtotal CHECK (SubTotal > 0),
TaxAmount       MONEY       NOT NULL CONSTRAINT ck_taxamount CHECK (TaxAmount >= 0),
ShippingAmount  MONEY       NOT NULL CONSTRAINT ck_shippingamount CHECK (ShippingAmount >= 0),
GrandTotal      AS (SubTotal + TaxAmount + ShippingAmount),
FinalShipDate   DATE        NULL,
CONSTRAINT pk_orderheader PRIMARY KEY (OrderID))
GO