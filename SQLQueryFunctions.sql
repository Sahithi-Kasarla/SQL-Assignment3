create database Day3Db
use Day3Db
create table Products
(PId int primary key,
Pname nvarchar(50) not null,
PPrice float not null,
PCat nvarchar(50))
insert into Products values(1,'IPhone-15',12800,'Mobile')
insert into Products values(2,'BoatSmart',8000,'Smart Watch')
insert into Products values(10,'Nohting Phone2',89800,'Mobile')
insert into Products values(3,'Dell',17800,'Laptop')
insert into Products values(4,'Realme',18000,'Mobile')
insert into Products values(5,'Vivo',14800,'Mobile')
insert into Products values(6,'IPhone-14',11800,'Mobile')
insert into Products values(7,'Mac book pro',19800,'Laptop')
insert into Products values(8,'Oneplus',12800,'Mobile')
insert into Products values(13,'noise',12800,'Smart watch')
select *from Products 
-----------------------Aggregate functions-------
--Sum
select sum(PPrice) as 'Total' from Products
select avg(PPrice) as 'Avg Price' from Products
select min(PPrice) as 'min Price' from Products
select max(PPrice) as 'max price' from Products
------------------------------------------------------
select sum(PPrice) as 'sub total', PCat as 'product category' from Products group by PCat
select min(PPrice) as 'min price', PCat as 'product category' from Products group by PCat
select max(PPrice) as 'max price', PCat as 'product category' from Products group by PCat
select avg(PPrice) 'Average Price', PCat  'product category' from Products group by PCat

select sum(PPrice) as 'sub total', PCat as 'product category' from Products group by PCat having PCat='Mobile'

-------string--------
use Day2Db
select *from Emps
select Lower ('India')
select upper ('India')
select left ('India',2)
select left ('India',3)
select Right ('India',2)

select upper(right('india',4))
select upper(right(Fname,2)) as 'Right 2 Char' from Emps

select upper (SUBSTRING ('India',3,3)) as 'from India'

select lower(Fname) as 'First Name' from Emps
select upper(Fname) as 'First Name' from Emps
select upper(Fname)+' '+upper(Lname) 'FUll Name' from Emps
select upper(Fname)+' '+upper(Lname) 'FUll Name',left(Fname,1)+'.'+left(Lname,1)+'.' as 'initial' from Emps
----date function
select GetDate()
select datepart(day,getdate()) 'today'
select datepart(month,getdate()) 'current month'
select datepart(year,getdate()) 'current year'

select DateAdd(month,3,getdate())'after adding 3 months'
select DateAdd(year,3,getdate())'after adding 3 years'
select DateAdd(day,3,getdate())'after adding 3 days'

select DateDiff(year,'12/12/2012',getdate()) as 'year 2012 to today'
----------------------------------------------------------------------------------
use Day3Db
create table Employee
(Id nvarchar(5) primary key check(Id like '[a-z][0-9][0-9][0-9][0-9]'),
Name nvarchar(50) not null,
Designation nvarchar(50),
Salary float,
DOJ date)
insert into Employee(Id, Name,Designation,Salary,DOJ) values('E0005','sam','Manager',87966,'12/12/2013')
insert into Employee(Id, Name,Designation,Salary,DOJ) values('E0009','Ram','Developer',5678,'12/12/2014')
insert into Employee(Id, Name,Designation,Salary,DOJ) values('E0001','Hari','Tester',89066,'12/12/2015')
insert into Employee(Id, Name,Designation,Salary,DOJ) values('E0008','Surya','Hr',88966,'12/12/2016')
insert into Employee(Id, Name,Designation,Salary,DOJ) values('E0014','Ravi','Manager',89966,'12/12/2017')
insert into Employee(Id, Name,Designation,Salary,DOJ) values('E0016','Raghu','Tester',90867,'12/02/2013')
insert into Employee(Id, Name,Designation,Salary,DOJ) values('E0007','Shinnu','Web developer',98765,'12/09/2013')
insert into Employee(Id, Name,Designation,Salary,DOJ) values('E0018','Arjun','TL',897685,'12/11/2019')
insert into Employee(Id, Name,Designation,Salary,DOJ) values('E0013','Arnav','CEO',975864,'12/12/2018')
insert into Employee(Id, Name,Designation,Salary,DOJ) values('E0011','Barun','M.D',896585,'12/12/2019')
insert into Employee(Id, Name,Designation,Salary,DOJ) values('E0015','CHinnu','Manager',89666,'12/05/2013')

select datepart(day,DOJ)from Employee
select datepart(dayofyear,doj) from Employee
select Id,Name,Designation,Salary,DOJ,datediff(year,DOJ,getdate())'working year in org' from Employee

select *from Employee
----------------------------------------------------------------------------------------
select round(salary,0) from Employee
select Round(98000.766666,2)
select Rand(1)
select Ltrim('      india     ')
select rtrim('      india     ')
select trim('      india     ')
----------------------------------------------------------------------------------------
select count(Id) as 'number of employee 'from Employee
----------------------------------------------------------------------------------------
--user defined function
--create function functionName
--(
--parameter
--)
--retuns returnType
--as
--begin--{
--body of function
--end--}
use Day2Db
select *from Emps
create function fnFullName
(
@fn nvarchar(50),@ln nvarchar(50)
)
returns nvarchar(101) as
begin
return (select @fn+''+@ln);
end
select dbo.fnFullName('sam','Dicosta') as 'Full Name'
select dbo.fnFullName(Fname,Lname) as 'Full Name' from Emps
select *from dbo.Emps
---create schema schemaName
create schema OurSchema
create function OurSchema.Bonus
(@Salary float)
returns float
as
begin
return (@Salary*0.15)
end
select OurSchema.Bonus(1200) as 'Bonus'
select Id,Fname,Lname,Salary,OurSchema.Bonus(Salary) as 'Bonus' from Emps
-------------------------------------------------------------------------
--Table valued function
create function fnGetEmps()
returns Table
As
return (Select *from Emps)

select *from fnGetEmps()
select Id, FName from fnGetEmps()
-------------------------------------------------------------------------
create function fnGetEmps2()
returns Table
As
return (Select Id,FName+''+Lname as 'Full name', Salary from Emps)

select *from fnGetEmps2()
select Id, [Full Name] from fnGetEmps2()





--function: built in,UserDefined function
-----Group By

