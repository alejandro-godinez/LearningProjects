-- 1.1 Retrieve a list of cities
-- Initially, you need to produce a list of all of you customers' locations. 
-- Write a Transact-SQL query that queries the SalesLT.Address table and 
-- retrieves the values for City and StateProvince, removing duplicates 
-- and sorted in ascending order of city.

SELECT Name, ListPrice
FROM SalesLT.Product;


-- 1.2 Retrieve the heaviest products
-- Transportation costs are increasing and you need to identify the heaviest 
-- products. Retrieve the names of the top ten percent of products by weight.

SELECT TOP 10 PERCENT
  Name, Weight
FROM SalesLT.ProductORDER 
BY Weight DESC

-- 2.1 Retrieve product details for product model 1
-- Initially, you need to find the names, colors, and sizes
-- of the products with a product model ID 1.

SELECT 
  Name, [Color], [Size]
FROM SalesLT.Product
WHERE ProductModelID = 1

-- 2.2 Filter products by color and size
-- Retrieve the product number and name of the products that have a color of 
-- black, red, or white and a size of S or M.

SELECT
  ProductNumber, Name, [Color], [Size]
FROM SalesLT.Product
WHERE 
  Color in ('Black', 'Red', 'White')
  AND [Size] IN ('S', 'M')

-- 2.3 Filter products by product number
-- Retrieve the product number, name, and list price of products whose product 
-- number begins BK-

SELECT
ProductNumber, Name, ListPrice
FROM SalesLT.Product
WHERE ProductNumber LIKE 'BK-%'

-- 2.4 Retrieve specific products by product number
-- Modify your previous query to retrieve the product number, name, and list 
-- price of products whose product number begins BK- followed by any character 
-- other than R, and ends with a - followed by any two numerals.

SELECT 
  ProductNumber, Name, ListPrice
FROM SalesLT.Product
WHERE ProductNumber LIKE 'BK-[^R]%-[0-9][0-9]'