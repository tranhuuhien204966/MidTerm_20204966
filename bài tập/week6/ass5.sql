
use AdventureWorks2017

-- # Task 1

 Retrieve customer name data
SELECT Title, FirstName, MiddleName, LastName, Suffix FROM Person.Person;

 Retrieve customer names and phone numbers
select concat('Mr. ', c.FirstName) as CustomerName, c.PhoneNumber as PhoneNumber, a.* from Sales.SalesPerson as a inner join 
(select b.FirstName as FirstName, d.PhoneNumber as PhoneNumber, b.BusinessEntityID as BusinessEntityID from Person.Person as b inner join Person.PersonPhone as d on b.BusinessEntityID = d.BusinessEntityID) as c 
on a.BusinessEntityID = c.BusinessEntityID 


-- # Task 2
 Retrieve customer order data
use AdventureWorksLT2019
SELECT CAST(CustomerID AS varchar) + ': ' + CompanyName AS CustomerCompany
FROM SalesLT.Customer;

 Retrieve a list of sales order revisions
SELECT SalesOrderNumber + ' (' + STR(RevisionNumber, 1) + ')' AS OrderRevision,
CONVERT(nvarchar(30), OrderDate, 102) AS OrderDate
FROM SalesLT.SalesOrderHeader;

-- # Task 3
 Retrieve customer contact details
SELECT FirstName + ' ' + ISNULL(MiddleName + ' ', '')+ LastName AS CustomerName
FROM SalesLT.Customer;

 Retrieve primary contact details
SELECT CustomerID, COALESCE(EmailAddress, Phone) AS PrimaryContact
FROM SalesLT.Customer;

 Retrieve shipping status
SELECT SalesOrderID, OrderDate,
    CASE
      WHEN ShipDate IS NULL THEN 'Awaiting Shipment'
      ELSE 'Shipped'
    END AS ShippingStatus
FROM SalesLT.SalesOrderHeader;
go