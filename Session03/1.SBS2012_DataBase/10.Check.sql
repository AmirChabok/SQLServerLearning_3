USE SQL2012SBS
GO

DROP TABLE Products.Product
GO

CREATE TABLE Products.Product
(ProductID          INT             IDENTITY(1,1),
ProductName         VARCHAR(50)     NOT NULL,
ProductCost         MONEY           NOT NULL CHECK (ProductCost > 0),
ListPrice           MONEY           NOT NULL CHECK (ListPrice > 0),
ProductMargin AS (ListPrice - ProductCost),
ProductDescription  XML             NULL,
CONSTRAINT pk_product PRIMARY KEY (ProductID))
GO

ALTER TABLE Orders.OrderHeader WITH CHECK
    ADD CONSTRAINT ck_subtotal CHECK (SubTotal > 0)
    
ALTER TABLE Orders.OrderHeader WITH CHECK
    ADD CONSTRAINT ck_taxamount CHECK (TaxAmount >= 0)
    
ALTER TABLE Orders.OrderHeader WITH CHECK
    ADD CONSTRAINT ck_shippingamount CHECK (ShippingAmount >= 0)
GO

ALTER TABLE Orders.OrderDetail WITH CHECK
    ADD CONSTRAINT ck_quantity CHECK (Quantity >= 0)
GO

ALTER TABLE Orders.OrderDetail WITH CHECK
    ADD CONSTRAINT ck_unitprice CHECK (UnitPrice > 0)
GO