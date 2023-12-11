use Day3Db
select *from Products
--create {proc| procedure} procedure_name
--[{@parameter data_type}] as <sql_statement>

--without parameter
create proc usp_sProducts
as
select *from Products
exec usp_sProducts

--with single parameter
create proc usp_sProById
@id int
as
select *from products where PID=@id

execute usp_sProById 2
execute usp_sProById 4
execute usp_sProById 25
------------------------------------------------
alter proc usp_sProById
@id int=1
as
select *from Products where PId =@id
exec usp_sProById
exec usp_sProById 2

create proc usp_iPro
@id int,
@name nvarchar(50),
@price float,
@cat nvarchar(50)
as
insert into Products(PId,Pname,PPrice,PCat) values (@id,@name,@price,@cat)
if(@@ERROR=0)
print 'Record Inserted!!!'

exec usp_iPro 18,'Nord 2',24000,'Mobile'
exec usp_sProducts

