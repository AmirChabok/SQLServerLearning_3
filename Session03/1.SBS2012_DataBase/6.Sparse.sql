USE SQL2012SBS
GO

DROP TABLE Customers.CustomerAddress
GO

CREATE TABLE Customers.CustomerAddress
(AddressID      INT         IDENTITY(1,1),
AddressType     VARCHAR(20) NOT NULL,
AddressLine1    VARCHAR(50) NOT NULL,
AddressLine2    VARCHAR(50) SPARSE NULL,
AddressLine3    VARCHAR(50) SPARSE NULL,
City            VARCHAR(50) NOT NULL,
StateProvince   VARCHAR(50) NULL,
Country         VARCHAR(70) NULL,
CONSTRAINT pk_customeraddress PRIMARY KEY (AddressID))
GO

DROP TABLE HumanResources.EmployeeAddress
GO

CREATE TABLE HumanResources.EmployeeAddress
(AddressID      INT         IDENTITY(1,1),
AddressType     VARCHAR(20) NOT NULL,
AddressLine1    VARCHAR(50) NOT NULL,
AddressLine2    VARCHAR(50) SPARSE NULL,
AddressLine3    VARCHAR(50) SPARSE NULL,
City            VARCHAR(50) NOT NULL,
StateProvince   VARCHAR(50) NULL,
Country         VARCHAR(70) NULL,
CONSTRAINT pk_employeeaddress PRIMARY KEY (AddressID))
GO
