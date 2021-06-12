/*
create table employees_log
(
	EmployeeKey int IDENTITY(1,1)  not null,
 	[EmployeeID] [int] NOT NULL,
	[BirthDate] [datetime] NULL,
	[ReportsTo] [int] NULL,
	[FullName] [nvarchar](31) NOT NULL,
	action nvarchar(20) not null default('insert'),
	inserted_at datetime default(getdate()) not null
);

go;

create trigger trg_insert_employees on employees for insert
as
	insert into employees_log([EmployeeID],[BirthDate],[ReportsTo],[FullName],action)
	select *,'insert' from inserted;
	print 'done trg_insert_employees'

*/
--use Northwind_DWH;
go;

create trigger trg_insert_FactOrders
on FactOrders
for insert
as 
	insert into Hist_FactOrders([OrderID],
	[CustomerID],
	[EmployeeID],
	[OrderDate],
	[RequiredDate],
	[ShippedDate],
	[ShipVia],
	[Freight],
	[ShipName],
	[ShipAddress],
	[ShipCityKey],
	[ShipRegion],
	[ShipPostalCode],
	[ShipCountry],
	[ProductID],
	[UnitPrice],					
	[Quantity],
	[Discount],
	[Action])
	select [OrderID],
	[CustomerID] ,
	[EmployeeID] ,
	[OrderDate],
	[RequiredDate],
	[ShippedDate] ,
	[ShipVia] ,
	[Freight] ,
	[ShipName] ,
	[ShipAddress] ,
	[ShipCityKey] ,
	[ShipRegion] ,
	[ShipPostalCode],
	[ShipCountry] ,
	[ProductID] ,
	[UnitPrice] ,					
	[Quantity] ,
	[Discount],
	'insert'
	from inserted;
	

	print 'done trg_insert_FactOrders'


go;

create trigger trg_update_FactOrders
on FactOrders
for update
as 
	insert into Hist_FactOrders([OrderID],
	[CustomerID],
	[EmployeeID],
	[OrderDate],
	[RequiredDate],
	[ShippedDate],
	[ShipVia],
	[Freight],
	[ShipName],
	[ShipAddress],
	[ShipCityKey],
	[ShipRegion],
	[ShipPostalCode],
	[ShipCountry],
	[ProductID],
	[UnitPrice],					
	[Quantity],
	[Discount],
	[Action])
	select [OrderID],
	[CustomerID] ,
	[EmployeeID] ,
	[OrderDate],
	[RequiredDate],
	[ShippedDate] ,
	[ShipVia] ,
	[Freight] ,
	[ShipName] ,
	[ShipAddress] ,
	[ShipCityKey] ,
	[ShipRegion] ,
	[ShipPostalCode],
	[ShipCountry] ,
	[ProductID] ,
	[UnitPrice] ,					
	[Quantity] ,
	[Discount],
	case 
		When inserted.IsActive = 0 then 'delete'
		when inserted.IsEdited = 1 then 'update'
		else 'error'
	end as Action
	from inserted;
	

	print 'done trg_update_FactOrders'