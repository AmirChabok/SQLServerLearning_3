USE SQL2012SBS
GO

CREATE  INDEX idx_lastnamefirstname2 ON Customers.Customer(LastName,FirstName)
GO
CREATE NONCLUSTERED INDEX idx_city2 ON Customers.CustomerAddress(City)
GO
