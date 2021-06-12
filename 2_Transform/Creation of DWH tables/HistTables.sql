CREATE TABLE Hist_FactOrders(
	[EventTime][datetime] default  CURRENT_TIMESTAMP,
	[Action][int] NOT NULL,
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
	[Discount] [real] NULL,
);
