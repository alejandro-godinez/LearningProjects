--1.1 Retrieve customer orders
--  As an initial step towards generating the invoice report, 
--  write a query that returns the company name from the SalesLT.Customer 
--  table, and the sales order ID and total due from the SalesLT.SalesOrderHeader table.

SELECT c.CompanyName, h.SalesOrderID, h.TotalDue
FROM SalesLT.Customer as c
JOIN SalesLT.SalesOrderHeader as h on h.CustomerID = c.CustomerID
ORDER BY c.CompanyName, h.SalesOrderID


-- 1.2 Retrieve customer orders with addresses
--   Extend your customer orders query to include the Main Office address for each 
--   customer, including the full street address, city, state or province, postal code, 
--   and country or region
--   Tip: Note that each customer can have multiple addressees in the SalesLT.Address 
--   table, so the database developer has created the SalesLT.CustomerAddress table to 
--   enable a many-to-many relationship between customers and addresses. Your query 
--   will need to include both of these tables, and should filter the results so that 
--   only Main Office addresses are included.

SELECT 
  c.CompanyName, h.SalesOrderID, h.TotalDue
  , ca.AddressID, ca.AddressType
  , a.City, a.StateProvince, a.StateProvince, a.PostalCode, a.CountryRegion
  FROM SalesLT.Customer as c
  JOIN SalesLT.SalesOrderHeader as h on h.CustomerID = c.CustomerID
  JOIN SalesLT.CustomerAddress as ca on ca.CustomerID = c.CustomerID and ca.AddressType = 'Main Office'
  JOIN SalesLT.Address as a on a.AddressID = ca.AddressID
  ORDER BY c.CompanyName, h.SalesOrderID
  
  
-- 2.1 Retrieve a list of all customers and their orders
--   The sales manager wants a list of all customer companies and their contacts 
--   (first name and last name), showing the sales order ID and total due for each 
--   order they have placed. Customers who have not placed any orders should be 
--   included at the bottom of the list with NULL values for the order ID and total due.

SELECT 
  c.CustomerID, c.FirstName, c.LastName
  , h.SalesOrderID, h.TotalDue
FROM SalesLT.Customer AS c
LEFT JOIN SalesLT.SalesOrderHeader as h on h.CustomerID = c.CustomerID
ORDER BY h.SalesOrderID DESC, c.LastName, c.FirstName


-- 2.2 Retrieve a list of customers with no address
--   A sales employee has noticed that Adventure Works does not have address information 
--   for all customers. You must write a query that returns a list of customer IDs, 
--   company names, contact names (first name and last name), and phone numbers for 
--   customers with no address stored in the database.

SELECT 
  c.CustomerID, c.CompanyName, c.FirstName, c.LastName, c.Phone, ca.AddressID
FROM SalesLT.Customer AS c
LEFT JOIN SalesLT.CustomerAddress AS ca on ca.CustomerID = c.CustomerID
WHERE ca.AddressID IS NULL

-- 3.1 Retrieve product information by category
--   The product catalog will list products by parent category and subcategory, 
--   so you must write a query that retrieves the parent category name, subcategory name, 
--   and product name fields for the catalog.

SELECT
  pc.Name as ParentCategory, c.Name as SubCategory, p.Name as ProductName
FROM SalesLT.ProductCategory as pc
JOIN SalesLT.ProductCategory AS c on c.ParentProductCategoryID = pc.ProductCategoryID
JOIN SalesLT.Product as p on p.ProductCategoryID = c.ProductCategoryID
ORDER BY ParentCategory, SubCategory, ProductName;