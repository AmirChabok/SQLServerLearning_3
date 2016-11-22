USE SQL2012SBS
GO
CREATE FULLTEXT INDEX ON Products.Product(ProductDescription)
    KEY INDEX pk_product
    ON ProductDescriptions
    WITH CHANGE_TRACKING = AUTO
GO

USE SQL2012SBSFS
GO
CREATE FULLTEXT INDEX ON Products.ProductDocument
    (Document TYPE COLUMN DocumentType)
    KEY INDEX pk_productdocument
    ON ProductDocuments
    WITH CHANGE_TRACKING = AUTO
GO
