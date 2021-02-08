# T-SQL Homework Chapter 2c
## Austin Stiffler
### 23 January, 2021


1. The date/time types in T-SQL are: *DATETIME*, *SMALLDATETIME*, *DATE*, *TIME*, *DATETIME2*, and *DATETIMEOFFSET*.

1. To express a date/time literal in T-SQL, put semi-quotations around the date to convert it to a string literal.

1. The *DATEFORMAT* setting is used for determining how SQL server interprets the literals you enter when they are converted froma character-string type to a date/time type. It is expressed as the combination of characters *d*, *m*, and *y*.

1. 
	``` 
		SET LANGUAGE German;
		SELECT CAST('20210123' AS DATE);
		
1. *CAST* is a standard function, while *CONVERT* and *PARSE* are not. *CONVERT* uses a style number for its conversion, while *PARSE* uses a culture.

1. The functions *GETDATE*, *CURRENT_TIMESTAMP*, *GETUTCDATE*, *SYSDATETIME*, SYSUTCDATETIME*, and *SYSDATETIMEOFFSET* will  return the current date and time. *SYSDATETIME* or *CURRENT_TIMESTAMP* is preferable.

1. 
	```
	SELECT DATEADD(day, 1, '20210123');
	SELECT DATEADD(week, 1, '20210123');
	SELECT DATEADD(month, 1, '20210123');
	SELECT DATEADD(year, 1, '20210123');
	
1. 
	```
	SELECT DATEDIFF(year, '19951024', '20210123');
	
1. The *ISDATE* function accepts a character string as input and returns 1 if it is convertible to a date/time data type and 0 if it isn't.

1. The *EOMONTH* function accepts an input date and time value and return the respective end-of-month date as a *DATE* typed value. This function could be important for closing out something like sales for the end of the current previous month.

1. 
	```
	SELECT DATEADD(day, 30, '20210123');

1. 
	```
	SELECT DATEDIFF(day, SYSDATETIME(), '20210203');