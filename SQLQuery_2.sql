#-------Return the top 100o data from our database----------#
SELECT TOP (1000) [OrderID]
      ,[OrderDate]
      ,[OrderTotal]
      ,[CookieID]
      ,[CookieName]
      ,[RevenuePerCookie]
      ,[CostPerCookie]
      ,[Quantity]
      ,[CustomerID]
      ,[CustomerName]
      ,[Phone]
      ,[Address]
      ,[City]
      ,[State]
      ,[Zip]
      ,[Country]
      ,[Notes]
  FROM [master].[dbo].[TOTORIALDATACVS];
#-----Return CustomerName and specifics from database-----#
  SELECT CustomerName from dbo.TOTORIALDATACVS;
  SELECT CustomerName, Notes from dbo.TOTORIALDATACVS;
SELECT DISTINCT CustomerName from dbo.TOTORIALDATACVS;
SELECT DISTINCT CustomerName, Notes FROM dbo.TOTORIALDATACVS
SELECT TOP(5)* FROM dbo.TOTORIALDATACVS;
#-------Return all Data from Washington States----------#
SELECT * FROM dbo.TOTORIALDATACVS WHERE State = 'WA'
#-------Returns specifiC data from Washington State----------#
SELECT CustomerName, CookieName, OrderTotal, CostPerCookie, OrderDate FROM dbo.TOTORIALDATACVS WHERE State = 'WA'
SELECT DISTINCT CustomerName, CookieName, OrderTotal FROM dbo.TOTORIALDATACVS WHERE State = 'WA'
#-------Returns all data excluding those from Washington State-----#
SELECT * FROM dbo.TOTORIALDATACVS WHERE State != 'WA'
#-------Returns data only from both States Washington and Alabama
SELECT * FROM dbo.TOTORIALDATACVS WHERE State = 'wa' or State = 'AL'
SELECT DISTINCT CustomerName, Phone from dbo.TOTORIALDATACVS where State = 'WA' or State = 'AL'
SELECT * FROM dbo.TOTORIALDATACVS WHERE State IN ('WA', 'AL')
#-------Returns data that are not in Washington and Alabama
SELECT * FROM dbo.TOTORIALDATACVS WHERE State NOT IN ('WA', 'AL', 'UT', 'WI')
SELECT DISTINCT CustomerName, Address FROM dbo.TOTORIALDATACVS WHERE State NOT IN ('WA', 'AL', 'UT', 'WI')
#-------Return  very specific data from database
SELECT * FROM dbo.TOTORIALDATACVS WHERE CustomerName = 'ABC Groceries' and State = 'UT'
SELECT DISTINCT CustomerName FROM dbo.TOTORIALDATACVS WHERE Country = 'United States'
SELECT Distinct CustomerName, Notes,CookieId FROM dbo.TOTORIALDATACVS WHERE Country = 'United States' ANd State = 'UT'
