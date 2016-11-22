USE SQL2012SBS
GO
ALTER TABLE Products.Product
    ADD ProductMargin AS (ListPrice - ProductCost)
GO