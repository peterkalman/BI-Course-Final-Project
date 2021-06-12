use Northwind_DWH

CREATE TABLE [dbo].[MirrorCategories](
	[__$operation] [int] NULL,
	[CategoryID] [int] NULL,
	[CategoryName] [nvarchar](15) NULL,
	[Description] [nvarchar](max) NULL,
	[Picture] [varbinary](max) NULL
)

CREATE TABLE [dbo].[MirrorCustomers](
	[__$operation] [int] NULL,
	[CustomerID] [nvarchar](5) NULL,
	[CompanyName] [nvarchar](40) NULL,
	[ContactName] [nvarchar](30) NULL,
	[ContactTitle] [nvarchar](30) NULL,
	[Address] [nvarchar](60) NULL,
	[City] [nvarchar](15) NULL,
	[Region] [nvarchar](15) NULL,
	[PostalCode] [nvarchar](10) NULL,
	[Country] [nvarchar](15) NULL,
	[Phone] [nvarchar](24) NULL,
	[Fax] [nvarchar](24) NULL
)

CREATE TABLE [dbo].[MirrorEmployees](
	[__$operation] [int] NULL,
	[EmployeeID] [int] NULL,
	[LastName] [nvarchar](20) NULL,
	[FirstName] [nvarchar](10) NULL,
	[Title] [nvarchar](30) NULL,
	[TitleOfCourtesy] [nvarchar](25) NULL,
	[BirthDate] [datetime] NULL,
	[HireDate] [datetime] NULL,
	[Address] [nvarchar](60) NULL,
	[City] [nvarchar](15) NULL,
	[Region] [nvarchar](15) NULL,
	[PostalCode] [nvarchar](10) NULL,
	[Country] [nvarchar](15) NULL,
	[HomePhone] [nvarchar](24) NULL,
	[Extension] [nvarchar](4) NULL,
	[Photo] [varbinary](max) NULL,
	[Notes] [nvarchar](max) NULL,
	[ReportsTo] [int] NULL,
	[PhotoPath] [nvarchar](255) NULL
)

CREATE TABLE [dbo].[MirrorOrderDetails](
	[__$operation] [int] NULL,
	[OrderID] [int] NULL,
	[ProductID] [int] NULL,
	[UnitPrice] [money] NULL,
	[Quantity] [smallint] NULL,
	[Discount] [real] NULL
)

CREATE TABLE [dbo].[MirrorOrders](
	[__$operation] [int] NULL,
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
	[ShipCity] [nvarchar](15) NULL,
	[ShipRegion] [nvarchar](15) NULL,
	[ShipPostalCode] [nvarchar](10) NULL,
	[ShipCountry] [nvarchar](15) NULL
)

CREATE TABLE [dbo].[MirrorProducts](
	[__$operation] [int] NULL,
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

CREATE TABLE [dbo].[MirrorShippers](
	[__$operation] [int] NULL,
	[ShipperID] [int] NULL,
	[CompanyName] [nvarchar](40) NULL,
	[Phone] [nvarchar](24) NULL
)

CREATE TABLE [dbo].[MirrorSuppliers](
	[__$operation] [int] NULL,
	[SupplierID] [int] NULL,
	[CompanyName] [nvarchar](40) NULL,
	[ContactName] [nvarchar](30) NULL,
	[ContactTitle] [nvarchar](30) NULL,
	[Address] [nvarchar](60) NULL,
	[City] [nvarchar](15) NULL,
	[Region] [nvarchar](15) NULL,
	[PostalCode] [nvarchar](10) NULL,
	[Country] [nvarchar](15) NULL,
	[Phone] [nvarchar](24) NULL,
	[Fax] [nvarchar](24) NULL,
	[HomePage] [nvarchar](max) NULL
)