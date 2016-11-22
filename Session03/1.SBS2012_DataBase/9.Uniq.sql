USE SQL2012SBSFS
GO

CREATE TABLE Products.ProductDocument
(DocumentID     UNIQUEIDENTIFIER    ROWGUIDCOL UNIQUE,
DocumentType    VARCHAR(20)         NOT NULL,
Document        VARBINARY(MAX)      NOT NULL,
CONSTRAINT pk_productdocument PRIMARY KEY(DocumentID))
GO
