--  1.1
--  Pass a value to the stored procedure by position instead of by name. Try Product Category 41.

EXECUTE SalesLT.TopProducts 41

--  1.2
--  Run the table-valued function to return data for the year 2008.

SELECT * FROM SalesLT.GetFreightbyCustomer(2008)
WHERE totalfreight >= 1000   --additional filter on results
