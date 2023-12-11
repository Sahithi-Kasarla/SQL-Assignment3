create database Assignment3
use Assignment3
create table Products(
PId int primary key,
PQ int not null,
PPrice float not null,
DiscountPercent float not null,
ManufacturingDate date)

insert into Products values

    (1, 100, 50.00, 10.0, '2023-01-01'),
    (2, 150, 75.00, 15.0, '2023-02-01'),
    (3, 200, 100.00, 20.0, '2023-03-01'),
    (4, 50, 25.00, 5.0, '2023-04-01'),
    (5, 120, 60.00, 12.0, '2023-05-01');

select * from Products

create function CalDiscountedValue
(
@price float, @DiscountPercent float
)
returns float as
begin
declare @DiscountValue float;
set @DiscountValue= @price-(@price * @DiscountPercent/100)
 return @DiscountValue
end

select * from dbo.Products

select pid as PID,
Pprice as Price,
discountpercent as Discount,
dbo.Caldiscountedvalue(pprice,DiscountPercent) as PriceAfterDiscount from products

