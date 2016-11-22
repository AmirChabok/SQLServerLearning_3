USE SQL2012SBS
GO

ALTER TABLE Orders.OrderDetail
    ADD CONSTRAINT pk_orderdetail PRIMARY KEY (OrderDetailID)
GO
    
ALTER TABLE Products.Product
    ADD CONSTRAINT pk_product PRIMARY KEY (ProductID)
GO

