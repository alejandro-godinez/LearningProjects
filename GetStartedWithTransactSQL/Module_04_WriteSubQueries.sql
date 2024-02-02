-- 1.1 Retrieve products whose list price is higher than the average unit price.
--   Retrieve the product ID, name, and list price for each product where the list price 
--   is higher than the average unit price for all products that have been sold.
-- Tip: Use the AVG function to retrieve an average value.

SELECT
  p.ProductID, p.Name, p.ListPrice
FROM SalesLT.Product as p
WHERE p.ListPrice > (SELECT AVG(UniPrice) FROM SalesLT.SalesOrderDetail)


-- 1.2 Retrieve Products with a list price of 100 or more that have been sold for less than 100.
--   Retrieve the product ID, name, and list price for each product where the list price is 100 
--   or more, and the product has been sold for less than 100.

--SOLUTION USING JOIN
SELECT
  DISTINCT p.ProductID, p.Name, p.ListPrice, o.UnitPrice
FROM SalesLT.Product as p
JOIN SalesLT.SalesOrderDetail as o on o.ProductID = p.ProductID and o.UnitPrice < 100
WHERE p.ListPrice > 100
ORDER BY p.ProductID

--SOLUTION USING SUBQUERY
SELECT 
  ProductID, Name, ListPrice
FROM SalesLT.Product
WHERE 
  ProductID IN (SELECT ProductID FROM SalesLT.SalesOrderDetail
                WHERE UnitPrice < 100.00) 
  AND ListPrice >= 100.00
ORDER BY ProductID;


-- 2.1 Retrieve the cost, list price, and average selling price for each product
--  Retrieve the product ID, name, cost, and list price for each product along with the 
--  average unit price for which that product has been sold.

SELECT 
  p.ProductID, p.Name, p.StandardCost, p.ListPrice, 
  (SELECT AVG(UnitPrice) FROM SalesLT.SalesOrderDetail 
    WHERE ProductID = p.ProductID) as AverageUnitPrice
FROM SalesLT.Product as p
ORDER BY ProductID;

-- 2.2 Retrieve products that have an average selling price that is lower than the cost.
--  Filter your previous query to include only products where the cost price is higher than 
--  the average selling price.

SELECT 
  p.ProductID, p.Name, p.StandardCost, p.ListPrice,
  (SELECT AVG(UnitPrice) FROM SalesLT.SalesOrderDetail 
    WHERE ProductID = p.ProductID) as AverageUnitPriceFROM SalesLT.Product as p
WHERE 
  p.StandardCost > (SELECT AVG(UnitPrice) FROM SalesLT.SalesOrderDetail WHERE ProductID = p.ProductID)
ORDER BY ProductID;