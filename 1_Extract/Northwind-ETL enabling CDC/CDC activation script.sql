USE Northwind;
/*
*/
EXEC sys.sp_cdc_enable_db;
 

EXEC sys.sp_cdc_enable_table 
				@source_schema = 'dbo',
				@source_name = 'Employees',
				@role_name = null;

EXEC sys.sp_cdc_enable_table 
				@source_schema = 'dbo',
				@source_name = 'Orders',
				@role_name = null;

EXEC sys.sp_cdc_enable_table 
				@source_schema = 'dbo',
				@source_name = 'Order Details',
				@role_name = null;

EXEC sys.sp_cdc_enable_table 
				@source_schema = 'dbo',
				@source_name = 'Customers',
				@role_name = null;

EXEC sys.sp_cdc_enable_table 
				@source_schema = 'dbo',
				@source_name = 'Suppliers',
				@role_name = null;

EXEC sys.sp_cdc_enable_table 
				@source_schema = 'dbo',
				@source_name = 'Shippers',
				@role_name = null;

EXEC sys.sp_cdc_enable_table 
				@source_schema = 'dbo',
				@source_name = 'Categories',
				@role_name = null;

EXEC sys.sp_cdc_enable_table 
				@source_schema = 'dbo',
				@source_name = 'Products',
				@role_name = null;


CREATE TABLE [dbo].[cdc_states] 
 ([name] [nvarchar](256) NOT NULL, 
 [state] [nvarchar](256) NOT NULL) ON [PRIMARY];

 
CREATE UNIQUE NONCLUSTERED INDEX [cdc_states_name] ON 
 [dbo].[cdc_states] 
 ( [name] ASC ) 
 WITH (PAD_INDEX  = OFF) ON [PRIMARY];


EXEC sys.sp_cdc_disable_table 
				@source_schema = 'dbo',  
				@source_name   = 'Employees',  
				@capture_instance = 'dbo_Employees'  ;
				

EXEC sys.sp_cdc_disable_db;
*/