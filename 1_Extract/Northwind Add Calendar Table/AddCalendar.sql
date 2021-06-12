/*
This script creates a calendar for Northwind,which will hold all
 the dates as keys for usage by other tables.
The range of those dates are from the earliest date to the latest,
 and to add buffers for future use add an extra year or two.
The table will have the following columns:
FullDate (PK)
Year(Earliest year -> Latest year + 2)
Month(1 -> 12)
Day(1 -> Max for the month)
MonthName(January -> December)
*/
use Northwind
/*
Potential dates are (from):
HireDate (Employees)
OrderDate (Orders)
RequiredDate (Orders)
ShippedDate (Orders)
*/
-- Find earliest date
/*
Finds the mins of all tables , where there are several dates in one table,
SQL unpivots them and adds to the rest.
*/
	
declare @earliestDate AS DATE
select top 1 @earliestDate = dates
from (
	
	select dates 
	from (select min(O.OrderDate) as OD,
			min(O.RequiredDate) as RD,
			min(O.ShippedDate) as SD
		from Orders O
	) as OrdersSource
	UNPIVOT
	(
		dates
		for OrdersSource in (OD, RD, SD)
	
	) as DateUnpivot
	
	union
	select dates
	from (select min(E.HireDate) as BD,
			min(E.BirthDate) as HD
		from Employees E
	) as EmployeeSource
	UNPIVOT
	(
		dates
		for EmployeeSource in (HD, BD)
	) as DateUnpivot
) as LowestDates
order by dates asc;

-- Find latest date
/*
Finds the maxs of all tables , where there are several dates in one table,
SQL unpivots them and adds to the rest.
*/
declare @latestDate AS DATE
select top 1 @latestDate = dates
from (
	
	select dates 
	from (select max(O.OrderDate) as OD,
			max(O.RequiredDate) as RD,
			max(O.ShippedDate) as SD
		from Orders O
	) as DataSource
	UNPIVOT
	(
		dates
		for DateSource in (OD, RD, SD)
	
	) as DateUnpivot
	
	union
	select max(E.HireDate) as HD
	from Employees E
) as LatestDates
order by dates desc;
use Northwind_DWH;
--Adding a 2 year buffer
set @latestDate=DATEADD(year,2,@latestDate);

--Generate Years
/*
with yearsTable as(
	select Year(@earliestDate) as Years
	union all
	select Years + 1 as Years
	from yearsTable YT 
	where YT.Years < Year(@latestDate)
)
select Years as "Year"
from yearsTable;
*/
--Generate Months
/*
with monthsTable as(
	select 1 as Months
	union all
	select Months + 1 as Months
	from monthsTable MT 
	where MT.Months < 12
)
select Months as "Month"
from monthsTable;
*/
--Combining Cartesian with Years and Months.
--Generate Years
/*
with yearsTable as(
	select Year(@earliestDate) as Years
	union all
	select Years + 1 as Years
	from yearsTable YT 
	where YT.Years < Year(@latestDate)
),
--Generate Months
monthsTable as(
	select 1 as Months
	union all
	select Months + 1 as Months
	from monthsTable MT 
	where MT.Months < 12
)
select Years as "Year",Months as "Month"
from yearsTable YT,monthsTable MT
order by Years;
*/



--Generate Days for latest date
/*
with daysTable as(
	select 1 as DayNum
	union all
	select DayNum + 1 as DayNum
	from daysTable DT 
	where DT.DayNum < Day(EOMONTH(@latestDate))
)
select DayNum as "Day"
from daysTable;
*/
--Creating Table for the big WITH statement, I couldn't fit it in one statement :(
DROP TABLE Calendar 
CREATE TABLE Calendar (
    "Date" Date,
    "Year" int,
    "Month" int,
	"Day" int,
    "MonthName" varchar(10)
);
--Combining Cartesian with Years and Months and picking out days.
--Generate Years

with yearsTable as(
	select Year(@earliestDate) as Years
	union all
	select Years + 1 as Years
	from yearsTable YT 
	where YT.Years < Year(@latestDate)
),
--Generate Months
monthsTable as(
	select 1 as Months
	union all
	select Months + 1 as Months
	from monthsTable MT 
	where MT.Months < 12
),
YTMT as(
	select Years as "Year",Months as "Month"
	from yearsTable YT,monthsTable MT
	
),
calendarTable as (
	select YTMT."Year",YTMT."Month", 1 as "Day"
	from YTMT
	union all
	select CT."Year",CT."Month", CT."Day" + 1 as "Day"
	from calendarTable CT 
	where CT."Day" < Day(EOMONTH(DATEFROMPARTS(CT."Year",CT."Month",CT."Day")))
)
insert into "Calendar"
select DATEFROMPARTS(CT."Year",CT."Month",CT."Day") as "Date",
*,
Datename(month,DATEFROMPARTS(CT."Year",CT."Month",CT."Day")) as "MonthName"
from calendarTable CT
order by CT."Year",CT."Month",CT."Day";


select *
from Calendar C
order by C.Date;