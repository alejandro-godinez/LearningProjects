--  1

DECLARE @customerID AS INT = 30110;
DECLARE @fname AS NVARCHAR(20);
DECLARE @lname AS NVARCHAR(30);
DECLARE @maxReturns AS INT = 1;

WHILE @maxReturns <= 10
BEGIN
  BEGIN TRY
    SELECT @fname = FirstName, @lname = LastName 
    FROM SalesLT.Customer
    WHERE CustomerID = @CustomerID;
  
    IF @@ROWCOUNT > 0
    BEGIN
      PRINT CAST(@customerID as NVARCHAR(20)) + N' ' + @fname + N' ' + @lname;
    END
  END TRY
  BEGIN CATCH
    PRINT 'Unable to run query'
  END CATCH

  SET @maxReturns += 1;
  SET @CustomerID += 1;END;


-- 2


DECLARE @num varchar(20) = 'Challenge 2';

BEGIN TRY 
  PRINT 'Casting: ' + CAST(@num AS numeric(10,4));
END TRY
BEGIN CATCH
END CATCH;

-- create procedure
CREATE PROCEDURE dbo.DisplayErrorDetails ASPRINT 'ERROR INFORMATION';
PRINT 'Error Number: ' + CAST(ERROR_NUMBER() AS varchar(10));
PRINT 'Error Message: ' + ERROR_MESSAGE();
PRINT 'Error Severity: ' + CAST(ERROR_SEVERITY() AS varchar(10));

-- use procedure
DECLARE @num varchar(20) = 'Challenge 2';
BEGIN TRY    
  PRINT 'Casting: ' + CAST(@num AS numeric(10,4));
END TRY
BEGIN CATCH    
  EXECUTE dbo.DisplayErrorDetails;
END CATCH;