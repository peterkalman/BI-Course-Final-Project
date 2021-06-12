use Northwind_DWH
----------------------------------------------------------- Cities -----------------------------------------------------------
create TABLE DimCities(
	[CityKey] [int] IDENTITY(1,1) NOT NULL,
	[CityName] [nvarchar](15) NULL
)


----------------------------------------------------------- Categories -----------------------------------------------------------
CREATE TABLE DimCategories(
	[SynthKey] [int] IDENTITY(1,1) NOT NULL,
	[BeginDate] [datetime] default GETDATE(),
	[EndDate] [datetime] default NULL,
	--[__$operation] [int] NOT NULL,
	[CategoryID] [int] NULL,
	[CategoryName] [nvarchar](15) NULL,
	[Description] [nvarchar](max) NULL,
	[Picture] [varbinary](max) NULL
)
/*
Delete Statement
----------------

UPDATE DimCategories
SET EndDate = GETDATE()
WHERE CategoryID = ? AND
	EndDate is NULL
*/

----------------------------------------------------------- Suppliers -----------------------------------------------------------
CREATE TABLE DimSuppliers(
	[SynthKey] [int] IDENTITY(1,1) NOT NULL,
	[BeginDate] [datetime] default GETDATE(),
	[EndDate] [datetime] default NULL,
	[SupplierID] [int] NULL,
	[CompanyName] [nvarchar](40) NULL,
	[ContactName] [nvarchar](30) NULL,
	[ContactTitle] [nvarchar](30) NULL,
	[Address] [nvarchar](60) NULL,
	[CityKey] [int] NULL,
	[Region] [nvarchar](15) NULL,
	[PostalCode] [nvarchar](10) NULL,
	[Country] [nvarchar](15) NULL,
	[Phone] [nvarchar](24) NULL,
	[Fax] [nvarchar](24) NULL,
	[HomePage] [nvarchar](max) NULL
)
/*

Delete Statement
----------------

UPDATE DimSuppliers
SET EndDate = GETDATE()
WHERE SupplierID = ? AND
	EndDate is NULL

*/


----------------------------------------------------------- Shippers -----------------------------------------------------------

CREATE TABLE DimShippers(
	[SynthKey] [int] IDENTITY(1,1) NOT NULL,
	[BeginDate] [datetime] default GETDATE(),
	[EndDate] [datetime] default NULL,
	[ShipperID] [int] NULL,
	[CompanyName] [nvarchar](40) NULL,
	[Phone] [nvarchar](24) NULL
)
/*

Delete Statement
----------------

UPDATE DimShippers
SET EndDate = GETDATE()
WHERE ShipperID = ? AND
	EndDate is NULL

*/



----------------------------------------------------------- Products -----------------------------------------------------------

CREATE TABLE DimProducts(
	[SynthKey] [int] IDENTITY(1,1) NOT NULL,
	[BeginDate] [datetime] default GETDATE(),
	[EndDate] [datetime] default NULL,
	[ProductID] [int] NULL,
	[ProductName] [nvarchar](40) NULL,
	[SupplierID] [int] NULL,
	[CategoryID] [int] NULL,
	[QuantityPerUnit] [nvarchar](20) NULL,
	[UnitPrice] [money] NULL,
	[UnitsInStock] [smallint] NULL,
	[UnitsOnOrder] [smallint] NULL,
	[ReorderLevel] [smallint] NULL,
	[Discontinued] [bit] NULL
)
/*

Delete Statement
----------------

UPDATE DimProducts
SET EndDate = GETDATE()
WHERE ProductID = ? AND
	EndDate is NULL

*/



----------------------------------------------------------- Customers -----------------------------------------------------------
CREATE TABLE DimCustomers(
	[SynthKey] [int] IDENTITY(1,1) NOT NULL,
	[BeginDate] [datetime] default GETDATE(),
	[EndDate] [datetime] default NULL,
	[CustomerID] [nvarchar](5) NULL,
	[CompanyName] [nvarchar](40) NULL,
	[ContactName] [nvarchar](30) NULL,
	[ContactTitle] [nvarchar](30) NULL,
	[Address] [nvarchar](60) NULL,
	[CityKey] [int] NULL,
	[Region] [nvarchar](15) NULL,
	[PostalCode] [nvarchar](10) NULL,
	[Country] [nvarchar](15) NULL,
	[Phone] [nvarchar](24) NULL,
	[Fax] [nvarchar](24) NULL
)

/*

Delete Statement
----------------

UPDATE DimCustomers
SET EndDate = GETDATE()
WHERE CustomerID = ? AND EndDate is NULL

*/



----------------------------------------------------------- Employees -----------------------------------------------------------

CREATE TABLE DimEmployees(
	[SynthKey] [int] IDENTITY(1,1) NOT NULL,
	[BeginDate] [datetime] default GETDATE(),
	[EndDate] [datetime] default NULL,
	[IsInferred] [bit] default 0,
	[EmployeeID] [int] NULL,
	[LastName] [nvarchar](20) NULL,
	[FirstName] [nvarchar](10) NULL,
	[Title] [nvarchar](30) NULL,
	[TitleOfCourtesy] [nvarchar](25) NULL,
	[BirthDate] [datetime] NULL,
	[HireDate] [datetime] NULL,
	[Address] [nvarchar](60) NULL,
	[CityKey] [int] NULL,
	[Region] [nvarchar](15) NULL,
	[PostalCode] [nvarchar](10) NULL,
	[Country] [nvarchar](15) NULL,
	[HomePhone] [nvarchar](24) NULL,
	[Extension] [nvarchar](4) NULL,
	[ReportsTo] [int] NULL
)

/*
Delete Statement
----------------

UPDATE DimEmployees
SET EndDate = GETDATE()
WHERE EmployeeID = ? AND EndDate is NULL

*/

----------------------------------------------------------- Orders -----------------------------------------------------------

--Merges with Orders
/*
CREATE TABLE [dbo].[OrderDetails](
	[__$operation] [int] NULL,
	[OrderID] [int] NULL,
	[ProductID] [int] NULL,
	[UnitPrice] [money] NULL,
	[Quantity] [smallint] NULL,
	[Discount] [real] NULL
)
*/
CREATE TABLE FactOrders(
	[SynthKey] [int] IDENTITY(1,1) NOT NULL,
	[IsEdited] [bit] default 0,
	[IsActive] [bit] default 1,
	--[__$operationOrders] [int] NOT NULL,
	[OrderID] [int] NULL,
	[CustomerID] [nvarchar](5) NULL,
	[EmployeeID] [int] NULL,
	[OrderDate] [datetime] NULL,
	[RequiredDate] [datetime] NULL,
	[ShippedDate] [datetime] NULL,
	[ShipVia] [int] NULL,
	[Freight] [money] NULL,
	[ShipName] [nvarchar](40) NULL,
	[ShipAddress] [nvarchar](60) NULL,
	[ShipCityKey] [int] NULL,
	[ShipRegion] [nvarchar](15) NULL,
	[ShipPostalCode] [nvarchar](10) NULL,
	[ShipCountry] [nvarchar](15) NULL,
	--[__$operationDetails] [int] NULL,
	[ProductID] [int] NULL,
	[UnitPrice] [money] NOT NULL ,					
	[Quantity] [smallint] NOT NULL,
	[Discount] [real] NULL/*,
	check (ShippedDate > OrderDate AND
			ShippedDate <= DATEADD(Day,21,OrderDate) AND
			(RequiredDate >= OrderDate) AND
			Freight>0)
		*/	
)
/*
Update All Orders Statement
----------------
UPDATE FactOrders
SET [IsEdited] = 1,
	[CustomerID] = ?,
	[EmployeeID] = ?,
	[OrderDate] = ?,
	[RequiredDate] = ?,
	[ShippedDate] = ?,
	[ShipVia] = ?,
	[Freight] = ?,
	[ShipName] = ?,
	[ShipAddress] = ?,
	[ShipCityKey] = ?,
	[ShipRegion] = ?,
	[ShipPostalCode] = ?,
	[ShipCountry] = ?
WHERE OrderID = ? and [IsActive] = 1
*/
/*
Delete All Orders Statement
----------------
UPDATE FactOrders
SET [IsActive] = 0
WHERE OrderID = ? and [IsActive] = 1
*/
/*
Update All Details Statement
----------------
UPDATE FactOrders
SET [IsEdited] = 1,
	[UnitPrice] = ?,					
	[Quantity] = ?,
	[Discount] = ?
WHERE OrderID = ? and ProductID = ? and [IsActive] = 1
*/
/*
Delete All Details Statement (RowCount>1)
----------------
UPDATE FactOrders
SET [IsActive] = 0
WHERE OrderID = ? and ProductID = ? and [IsActive] = 1 and (select  count(distinct ProductID)
															from FactOrders
															where OrderID=? and [IsActive] = 1)>1
*/

