-----------------------------------1.1--------------------------------------
CREATE TABLE dbo.Customer
	(CustomerID int
	,FirstName varchar(50)
	,LastName varchar(50)
	,Email varchar(100)
	,ModifiedDate date
	,PRIMARY KEY NONCLUSTERED (CustomerID)
	);
GO
CREATE CLUSTERED INDEX CIX_Customer
	ON dbo.Customer(CustomerID)
	;
GO
-----------------------------------1.2--------------------------------------
CREATE NONCLUSTERED INDEX IX_Customer
	ON dbo.Customer
		(FirstName ASC
		,LastName ASC
		,Email ASC
		,ModifiedDate ASC)
		;
GO
-----------------------------------1.3--------------------------------------
CREATE INDEX IX_Customer_ModifiedDate
	ON dbo.Customer (ModifiedDate)
	INCLUDE(FirstName 
		,LastName );
GO
SELECT FirstName
,LastName
FROM Customer
WHERE ModifiedDate = '2020-10-20';
GO
-----------------------------------1.4--------------------------------------
CREATE TABLE dbo.Customer2
	(CustomerID int
	,AccountNumber varchar(10)
	,FirstName varchar(50)
	,LastName varchar(50)
	,Email varchar(100)
	,ModifiedDate date	
	,PRIMARY KEY NONCLUSTERED (CustomerID)
	);
GO
CREATE CLUSTERED INDEX CIX_Customer2
	ON dbo.Customer2(AccountNumber)
	;
GO
-----------------------------------1.5--------------------------------------
EXEC sp_rename N'dbo.Customer2.CIX_Customer2', N'CI_CustomerID', N'INDEX';  
GO  
-----------------------------------1.6--------------------------------------
DROP INDEX CI_CustomerID
	ON dbo.Customer2;
GO
-----------------------------------1.7--------------------------------------
ALTER TABLE dbo.Customer2
ADD CONSTRAINT AK_Customer_Email UNIQUE(Email);
GO
-----------------------------------1.8--------------------------------------
CREATE NONCLUSTERED INDEX IX_Customer2_FILL 
	ON dbo.Customer2 (ModifiedDate)
	WITH (FILLFACTOR = 70)
;
GO


