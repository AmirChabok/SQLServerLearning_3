USE SQL2008SBS
GO

SELECT CASE WHEN a.CompanyName IS NOT NULL THEN a.CompanyName ELSE a.FirstName + ' ' + a.LastName END CustomerName,
    b.City, d.StateProvince, e.CountryName, c.OrderID, c.OrderDate, 
    c.SubTotal, c.ShippingAmount, c.TaxAmount, c.GrandTotal, c.FinalShipDate
FROM Customers.Customer a INNER JOIN Customers.CustomerAddress b ON a.CustomerID = b.CustomerID
    INNER JOIN Orders.OrderHeader c ON a.CustomerID = c.CustomerID
    INNER JOIN LookupTables.StateProvince d ON b.StateProvinceID = d.StateProvinceID
    INNER JOIN LookupTables.Country e ON b.CountryID = e.CountryID
GO
    
SELECT DISTINCT YEAR(OrderDate) OrderYear, MONTH(OrderDate) OrderMonth FROM Orders.OrderHeader
GO

--Conditional formatting
--=iif(Sum(Fields!GrandTotal.Value,"Group_CustomerName")>1900,"Green","Black")
--Report parameters
--WHERE YEAR(OrderDate) = @OrderYear AND MONTH(OrderDate) = @OrderMonth