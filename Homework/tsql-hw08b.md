# TSQL Chapter 8b Homework
## Austin Stiffler
### 16 February, 2021


1. To update the sales tax table, you could simply do something like:
UPDATE dbo.SalesTax
	SET rate = rate + 0.05
WHERE state = 'Pennsylvania';

1. 	select od.orderid, t.rate from dbo.SalesTax inner join sales.orderdetails od 
on od.orderid = t.orderid where orderdate like '2019-%-%';

1. The proprietary assignment *UPDATE* command will update data in a table and assign values to variables
at the same time. The syntax saves you the need to use separate *UPDATE* and *SELECT* statements to
achieve the same task.

1. 
	* An important purpose of the *MERGE* statement is to merge data from a source into a target.
	* ETL stands for Extract, Transform and Load, which is a process used to collect data from various
	sources, transform the data depending on business rules/needs and load the data into a destination
	database.
	
1. MERGE INTO dbo.Customers AS TGT
USING dbo.CustomersStage AS SRC
ON TGT.custid = SRC.custid

1. INSERT INTO dbo.T1(datacol)
OUTPUT inserted.keycol, inserted.datacal
SELECT lastname
 FROM HR.Employees
 WHERE country = N'USA';

1. UPDATE dbo.OrderDetails
 SET discount += 0.05
OUTPUT
 inserted.orderid,
 inserted.productid,
 deleted.discount AS olddiscount,
 inserted.discount AS newdiscount
 WHERE productid = 51;
 
1. DELETE FROM dbo.Orders
 OUTPUT
 deleted.orderid,
 deleted.orderdate,
 deleted.empid,
 deleted.custid 
 WHERE orderdate < '20160101';
 
1. MERGE INTO dbo.Customers AS TGT
USING dbo.CustomersStage AS SRC
 ON TGT.custid = SRC.custid
WHEN MATCHED THEN
 UPDATE SET
 TGT.companyname = SRC.companyname,
 TGT.phone = SRC.phone,
 TGT.address = SRC.address
WHEN NOT MATCHED THEN 
INSERT (custid, companyname, phone, address)
 VALUES (SRC.custid, SRC.companyname, SRC.phone, SRC.address)
OUTPUT $action AS theaction, inserted.custid,
 deleted.companyname AS oldcompanyname,
 inserted.companyname AS newcompanyname,
 deleted.phone AS oldphone,
 inserted.phone AS newphone,
 deleted.address AS oldaddress,
 inserted.address AS newaddress;
 
1. Nested DML is used to directly insert into the final target tables only the subset of rows you
need from the full set of modified rows.

1. alter table PERSON add DayOfBirth varchar(20);

1. alter table PERSON alter column DayOfBirth add constraint checkbirthday check (DayOfBirth like
'[sun],[mon],[tue],[wed],[thu],[fri],[sat]');

1. alter table alter column DayOfBirth add foreign key DayOfBirth references week(validday);