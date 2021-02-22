--Name: Austin Stiffler
--File: exercise06-stiffler.sql
--Date: 19 February, 2021

use exercise06;

drop table if exists dbo.customers;
go
create table dbo.customers
(
customerNumber int,
customerName varchar(50),
contactLastName varchar(50),
contactFirstName varchar(50),
phone varchar(50),
addressLine1 varchar(50),
addressLine2 varchar(50),
city varchar(50),
state1 varchar(50),
PostalCode varchar(50),
country varchar(50),
salesRepEmployeeNumber varchar(50),
creditLimit varchar(50),
constraint cust_Num primary key(customerNumber)
);
go
bulk insert dbo.customers from 'C:\Users\austi\MSSA2021\Database\customers.csv' 
with (datafiletype = 'char', fieldterminator = ',', rowterminator = '\n');

drop table if exists dbo.employees;
go
create table dbo.employees
(
employeeNumber varchar(50),
lastName varchar(50),
firstName varchar(50),
extension varchar(50),
email varchar(50),
officeCode varchar(50),
reportsTo varchar(50),
jobTitle varchar(50),
constraint emp_Num primary key (employeeNumber)
);
go
bulk insert dbo.employees from 'C:\Users\austi\MSSA2021\Database\employees.csv'
with (datafiletype = 'char', fieldterminator = ',', rowterminator = '\n');

drop table if exists dbo.offices;
go
create table dbo.offices
(
officeCode varchar(50),
city varchar(50),
phone varchar(50),
addressLine1 varchar(50),
addressLine2 varchar(50),
state1 varchar(50),
country varchar(50),
postalCode varchar(50),
territory varchar(50),
constraint office_code primary key(officeCode)
);
go
bulk insert dbo.offices from 'C:\Users\austi\MSSA2021\Database\offices.csv'
with (datafiletype = 'char', fieldterminator = ',', rowterminator = '\n');

drop table if exists dbo.orderDetails;
go
create table dbo.orderDetails
(
orderNumber int,
productCode varchar(50),
quantityOrdered int,
priceEach money,
orderLineNumber int,
constraint pk_od primary key(orderNumber, productCode)
);
go
bulk insert dbo.orderDetails from 'C:\Users\austi\MSSA2021\Database\orderdetails.csv'
with (datafiletype = 'char', fieldterminator = ',', rowterminator = '\n');

drop table if exists dbo.orders;
go
create table dbo.orders
(
orderNumber int,
orderDate date,
requiredDate date,
shippedDate varchar(50),
status1 varchar(50),
comments varchar(max),
customerNumber varchar(max),
constraint ord_num primary key(orderNumber)
);
go
bulk insert dbo.orders from 'C:\Users\austi\MSSA2021\Database\orders.csv'
with (datafiletype = 'char', fieldterminator = ',', rowterminator = '\n');

drop table if exists dbo.payments;
go
create table dbo.payments
(
customerNumber int,
checkNumber varchar(50),
paymentDate date,
amount money
constraint check_num primary key(checkNumber)
);
go
bulk insert dbo.payments from 'C:\Users\austi\MSSA2021\Database\payments.csv'
with (datafiletype = 'char', fieldterminator = ',', rowterminator = '\n');

drop table if exists dbo.productLines;
go
create table dbo.productLines
(
productLine varchar(50),
textDescription varchar(max),
htmlDescription varchar(max),
image1 varchar(max),
constraint prod_line primary key(productLine)
);
go
bulk insert dbo.productLines from 'C:\Users\austi\MSSA2021\Database\productlines.csv'
with (datafiletype = 'char', fieldterminator = ',', rowterminator = '\n');

drop table if exists dbo.products;
go
create table dbo.products
(
productCode varchar(max),
productName varchar(max),
productLine varchar(50),
productScale varchar(50),
productVendor varchar(50),
productDescription varchar(max),
quantityInStock varchar(max),
buyPrice varchar(max),
MSRP varchar(max),
);
go
bulk insert dbo.products from 'C:\Users\austi\MSSA2021\Database\products.csv'
with (datafiletype = 'char', fieldterminator = ',', rowterminator = '\n');

--(a) How many distinct models does ClassicModels sell?

select distinct count(p.productline) 
from products p
where p.productLine = '"classic cars"';

--(b) Report the name and city of customers who don't have sales representatives?

select customername, city 
from dbo.customers
where salesRepEmployeeNumber like 'null';

--(c) What are the names of executives with VP or Manager in their title? Use the CONCAT function to combine the employee's first name and last namee into a single field for reporting.

select concat(firstname, lastname) as fullName, jobtitle 
from dbo.employees
where jobTitle like '"vp %"' or jobTitle like '"% manager %"';

--(d) Which orders have a value greater than $5,000?

select ordernumber, (quantityordered * priceeach) as ordervalue 
from dbo.orderdetails
where quantityOrdered * priceeach > 5000;

--(e) Report the account representative for each customer.

select customerName, salesRepEmployeeNumber
from dbo.customers;

--(f) Report total payments for Atelier graphique.

select c.customerName, sum(p.amount) as totalPayment 
from dbo.customers c
	join dbo.payments p
		on c.customernumber = p.customernumber
where c.customerName like '"Atelier graphique"'
group by c.customerName;

--(g) Report the total payments by date.

select paymentdate, sum(amount) as totalpayment
from dbo.payments
group by paymentDate
order by paymentDate;

--(h) Report the products that have not been sold.

select productCode, quantityOrdered 
from dbo.orderDetails 
where quantityOrdered = 0;

--(i) List the amount paid by each customer.

select p.customernumber, c.customername, sum(p.amount) as amountPaid
from dbo.payments p
	left join dbo.customers c
		on p.customernumber = c.customernumber
group by p.customernumber, c.customername;

--(j) List products sold by order date.

select od.productcode, p.productname, o.ordernumber, o.orderdate
from dbo.orders o
	join dbo.orderdetails od
		on o.ordernumber = od.ordernumber
	join dbo.products p
		on od.productCode = p.productCode
order by o.orderdate;

--(k) List the order dates in descending order for orders for the 1940 Ford Pickup Truck.

select o.ordernumber, od.productcode, o.orderdate, p.productname
from dbo.orders o
	join dbo.orderDetails od
		on o.orderNumber = od.orderNumber
	join dbo.products p
		on od.productCode = p.productCode
where p.productName like '"% Ford Pickup %"'
order by o.orderdate desc;

--(l) List the names of customers and their corresponding order number where a particular order from that customer has a value greater than $25,000?

with t1 as (
select (quantityOrdered * priceEach) as totalorder 
from orderDetails 
where (quantityOrdered * priceEach) > 25000
)
select customerName, totalorder
from customers, t1;

--(m) Compute the commission for each sales representative, assuming the commission is 5% of the value of an order. Sort by employee last name and first name.

with t1 as (
select (quantityordered * priceeach * 0.05) as commission
from orderDetails
)
select firstname, lastname, commission
from employees, t1
order by lastname, firstname;

--(n) What is the difference in days between the most recent and oldest order date in the Orders file?

select datediff(day,min(orderdate),max(orderdate)) as differenceInDays
from orders;

--(o) Compute the average time between order date and ship date for each customer ordered by the largest difference.

with t1 as (
select datediff(day,orderdate,shippeddate) as diff
from orders
)
select customername, avg(diff)
from customers, t1
group by customername
order by avg(diff) desc;