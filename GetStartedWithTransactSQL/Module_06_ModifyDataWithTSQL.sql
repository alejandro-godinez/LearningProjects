--  1.1 Insert a product
--    a. Adventure Works has started selling the following new product. Insert it into the 
--       SalesLT.Product table, using default or NULL values for unspecified columns:
--         Name: LED Lights
--         ProductNumber: LT-L123
--         StandardCost: 2.56
--         ListPrice: 12.99
--         ProductCategoryID: 37
--         SellStartDate: Today's date
--     b. After you have inserted the product, run a query to determine the ProductID that was generated.
--     c. Then run a query to view the row for the product in the SalesLT.Product table.

  INSERT INTO SalesLT.Product
    (Name, ProductNumber, StandardCost, ListPrice, ProductCategoryID, SellStartDate)
  VALUES
    ('LED Lights', 'LT-L123', 2.56, 12.99, 37, GETDATE())
    
  SELECT SCOPE_IDENTITY();

  SELECT * FROM SalesLT.Product WHERE ProductID = SCOPE_IDENTITY();
    
  -- list added product
  FROM [SalesLT].[Product] as pWHERE p.ProductNumber = 'LT-L123'

--  1.2 Insert a new category with two products
--    a. Adventure Works is adding a product category for Bells and Horns to its catalog. The parent 
--       category for the new category is 4 (Accessories). This new category includes the 
--       
--       following two new products:
--         First product:
--         Name: Bicycle Bell
--         ProductNumber: BB-RING
--         StandardCost: 2.47
--         ListPrice: 4.99
--         ProductCategoryID: The ProductCategoryID for the new Bells and Horns category
--         SellStartDate: Today's date
--
--       Second product:
--         Name: Bicycle Horn
--         ProductNumber: BB-PARP
--         StandardCost: 1.29
--         ListPrice: 3.75
--         ProductCategoryID: The ProductCategoryID for the new Bells and Horns category
--         SellStartDate: Today's date
--
--    b. Write a query to insert the new product category, and then insert the two new products 
--       with the appropriate ProductCategoryID value.
--
--    c. After you have inserted the products, query the SalesLT.Product and SalesLT.ProductCategory 
--       tables to verify that the data has been inserted.

  -- add category
  INSERT INTO SalesLT.ProductCategory
  VALUES (4, 'Bells and Horns', DEFAULT, GETDATE())

  --new id = 42 
  SELECT SCOPE_IDENTITY();

  -- add product 1 
  INSERT INTO SalesLT.Product
    (Name, ProductNumber, StandardCost, ListPrice, ProductCategoryID, SellStartDate)
  VALUES
    ('Bicycle Bell', 'BB-RING', 2.47, 4.99, 42, GETDATE())
  
  -- add product 2 
  INSERT INTO SalesLT.Product
    (Name, ProductNumber, StandardCost, ListPrice, ProductCategoryID, SellStartDate)
  VALUES
    ('Bicycle Horn', 'BB-PARP', 1.29, 3.75, 42, GETDATE())
    
  --list newly added products
  SELECT *FROM [SalesLT].[Product] as p 
  WHERE p.ProductNumber in ('BB-RING', 'BB-PARP')
  -- list newly added category
  SELECT * FROM SalesLT.ProductCategory as p 
  WHERE p.ParentProductCategoryID = 4


--  2.1 Update product prices
--    The sales manager at Adventure Works has mandated a 10% price increase for all 
--    products in the Bells and Horns category. Update the rows in the SalesLT.Product 
--    table for these products to increase their price by 10%.

  UPDATE SalesLT.Product
  SET ListPrice = ListPrice * 1.10
  WHERE ProductCategoryID = (SELECT ProductCategoryID FROM SalesLT.ProductCategory
                             WHERE Name = 'Bells and Horns');

--  2.2 Discontinue products
--    The new LED lights you inserted in the previous challenge are to replace all 
--    previous light products. Update the SalesLT.Product table to set the DiscontinuedDate 
--    to today’s date for all products in the Lights category (product category ID 37) other 
--    than the LED Lights product you inserted previously.

  UPDATE SalesLT.Product
  SET DiscontinuedDate = GETDATE()
  WHERE ProductCategoryID = 37 AND ProductNumber <> 'LT-L123';
  
  SELECT * FROM SalesLT.Product WHERE ProductCategoryID = 37
  
  
--  3.1 Delete a product category and its products
--    Delete the records for the Bells and Horns category and its products. You must ensure 
--    that you delete the records from the tables in the correct order to avoid a foreign-key 
--    constraint violation.

  DELETE FROM SalesLT.Product
  WHERE ProductCategoryID = (SELECT ProductCategoryID FROM SalesLT.ProductCategory 
                             WHERE Name = 'Bells and Horns');
  DELETE FROM SalesLT.ProductCategory
  WHERE ProductCategoryID = (SELECT ProductCategoryID FROM SalesLT.ProductCategory
                             WHERE Name = 'Bells and Horns');