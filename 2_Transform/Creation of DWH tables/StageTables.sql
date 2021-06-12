use Northwind_DWH
----------------------------------------------------------- Cities -----------------------------------------------------------
create TABLE StageCities(
	[CityName] [nvarchar](15) NULL
)
----------------------------------------------------------- Categories -----------------------------------------------------------
CREATE TABLE StageCategories(
	[__$operation] [int] NOT NULL,
	[CategoryID] [int] NULL,
	[CategoryName] [nvarchar](15) NULL,
	[Description] [nvarchar](max) NULL,
	[Picture] [varbinary](max) NULL
)
----------------------------------------------------------- Customers -----------------------------------------------------------
CREATE TABLE StageCustomers(
	[__$operation] [int] NOT NULL,
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
----------------------------------------------------------- Employees -----------------------------------------------------------
CREATE TABLE StageEmployees(
	[__$operation] [int] NOT NULL,
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
----------------------------------------------------------- Orders -----------------------------------------------------------

--Merges with Orders
/*
CREATE TABLE [dbo].[MirrorOrderDetails](
	[__$operation] [int] NULL,
	[OrderID] [int] NULL,
	[ProductID] [int] NULL,
	[UnitPrice] [money] NULL,
	[Quantity] [smallint] NULL,
	[Discount] [real] NULL
)
*/
CREATE TABLE StageOrders(
	[__$operationOrders] [int] NULL,
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
	[__$operationDetails] [int] NULL,
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
----------------------------------------------------------- Products -----------------------------------------------------------
CREATE TABLE StageProducts(
	[__$operation] [int] NOT NULL,
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
----------------------------------------------------------- Shippers -----------------------------------------------------------
CREATE TABLE StageShippers(
	[__$operation] [int] NOT NULL,
	[ShipperID] [int] NULL,
	[CompanyName] [nvarchar](40) NULL,
	[Phone] [nvarchar](24) NULL
)
----------------------------------------------------------- Suppliers -----------------------------------------------------------
CREATE TABLE StageSuppliers(
	[__$operation] [int] NOT NULL,
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

