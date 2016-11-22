USE SQL2012SBS
GO

CREATE TABLE LookupTables.Country
(CountryID      INT         IDENTITY(1,1),
CountryName     VARCHAR(70) NOT NULL UNIQUE,
CONSTRAINT pk_country PRIMARY KEY(CountryID))
GO

CREATE TABLE LookupTables.StateProvince
(StateProvinceID    INT         IDENTITY(1,1),
CountryID           INT         NOT NULL,
StateProvince       VARCHAR(50) NOT NULL UNIQUE,
StateProvinceAbbrev CHAR(2)     NOT NULL,
CONSTRAINT pk_stateprovince PRIMARY KEY(StateProvinceID))
GO

ALTER TABLE LookupTables.StateProvince
    ADD CONSTRAINT fk_countrytostateprovince FOREIGN KEY (CountryID)
    REFERENCES LookupTables.Country(CountryID)    
GO