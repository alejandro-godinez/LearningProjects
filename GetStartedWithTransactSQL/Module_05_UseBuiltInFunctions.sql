--  1.1 Retrieve the order ID and freight cost of each order.
--    Write a query to return the order ID for each order, together with the the Freight value 
--    rounded to two decimal places in a column named FreightCost.

SELECT
  H.SalesOrderID, ROUND(h.Freight, 2) as FreightCost
FROM SalesLT.SalesOrderHeader as h

--  1.2 Add the shipping method.
--    Extend your query to include a column named ShippingMethod that contains the ShipMethod 
--    field, formatted in lower case

SELECT 
  H.SalesOrderID, ROUND(h.Freight, 2) as FreightCost, LOWER(h.ShipMethod)
FROM SalesLT.SalesOrderHeader as h


--  1.3 Add shipping date details.
--    Extend your query to include columns named ShipYear, ShipMonth, and ShipDay that contain 
--    the year, month, and day of the ShipDate. The ShipMonth value should be displayed as the 
--    month name (for example, June)

SELECT
  H.SalesOrderID
  , ROUND(h.Freight, 2) as FreightCost
  , LOWER(h.ShipMethod)
  , YEAR(h.ShipDate) as ShipYear
  , DATENAME(MM, h.ShipDate) as ShipMonth
  , DAY(h.ShipDate) as ShipDay
FROM SalesLT.SalesOrderHeader as h


--  2.1 Retrieve total sales by product
--    Write a query to retrieve a list of the product names from the SalesLT.Product table and 
--    the total revenue for each product calculated as the sum of LineTotal from the SalesLT.SalesOrderDetail 
--    table, with the results sorted in descending order of total revenue.

SELECT
  p.Name
  ,SUM(d.LineTotal) as TotalRevenue
FROM SalesLT.Product as p
JOIN SalesLT.SalesOrderDetail as d on d.ProductID = p.ProductID
GROUP BY p.Name
ORDER BY TotalRevenue DESC

--  2.2 Filter the product sales list to include only products that cost over 1,000
--    Modify the previous query to include sales totals for products that have a list price 
--    of more than 1000.

SELECT 
  p.Name, p.ListPrice
  ,SUM(d.LineTotal) as TotalRevenue
FROM SalesLT.Product as p
JOIN SalesLT.SalesOrderDetail as d on d.ProductID = p.ProductID
WHERE p.ListPrice > 1000
GROUP BY p.Name, p.ListPrice
ORDER BY TotalRevenue DESC

--  2.3 Filter the product sales groups to include only total sales over 20,000
--    Modify the previous query to only include only product groups with a total sales value 
--    greater than 20,000.

SELECT 
  p.Name, p.ListPrice
  ,SUM(d.LineTotal) as TotalRevenue
FROM SalesLT.Product as p
JOIN SalesLT.SalesOrderDetail as d on d.ProductID = p.ProductID
WHERE p.ListPrice > 1000
GROUP BY p.Name, p.ListPrice
HAVING SUM(d.LineTotal) > 20000
ORDER BY TotalRevenue DESC