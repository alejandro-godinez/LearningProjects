--  1.1 Create your variables.
--    Write a T-SQL statement to declare two variables. The first is an nvarchar with length 30 
--    called salesOrderNumber, and the other is an integer called customerID.

--  1.2 Assign a value to the integer variable.
--    Extend your TSQL code to assign the value 29847 to the customerID.

--  1.3 Assign a value from the database and display the result.
--    Extend your TSQL to set the value of the variable salesOrderNumber using the column salesOrderNUmber 
--    from the SalesOrderHeader table, filter using the customerID column and the customerID variable. 
--    Display the result to the user as OrderNumber.


DECLARE 
  @salesOrderNumber NVARCHAR(30),
  @customerID int = 29847;
  
SET @salesOrderNumber  = (SELECT SalesOrderNumber FROM [SalesLT].[SalesOrderHeader] WHERE CustomerID = @customerID)

SELECT @salesOrderNumber AS OrderNumber



--  2.1 Declare the variables:
--    Write a T-SQL statement to declare three variables. The first is called customerID and will be an Integer 
--    with an initial value of 1. The next two variables will be called fname and lname. Both will be NVARCHAR, 
--    give fname a length 20 and lname a length 30.

--  2.2 Construct a terminating loop:
--    Extend your T-SQL code and create a WHILE loop that will stop when the customerID variable reaches 10.

--  2.3 Select the customer first name and last name and display:
--    Extend the T-SQL code, adding a SELECT statement to retrieve the FirstName and LastName columns and assign 
--    them respectively to fname and lname. Combine and PRINT the fname and lname. Filter using the customerID column 
--    and the customerID variable.

DECLARE
  @customerID int,
  @fname NVARCHAR(20),
  @lname NVARCHAR(30);
  
WHILE @customerID <= 10
BEGIN
  SELECT @fname = FirstName, @lname = LastName FROM SalesLT.Customer WHERE CustomerID = @customerID
  PRINT @fname + ' ' + @lname
  @customerID += 1;
END
