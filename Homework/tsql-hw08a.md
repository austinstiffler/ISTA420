# TSQL Chapter 8a Homework
## Austin Stiffler
### 13 February, 2021


1. Specifying the target column names right after the table name is optional, but by doing so, you
control the value-column associations instead of relying on the order of the columns in the *CREATE
TABLE* statement. If you don’t specify a value for a column, Microsoft SQL Server will use a default value if one was
defined for the column. If a default value isn’t defined and the column allows NULLs, a NULL will be
used. I would say that it is necessary.

1. When using *INSERT SELECT*, you do use a subquery. The subquery is the result that is put into
the table. If you do not use the subquery, the result will be generated for you.

1. The operand for the *INSERT EXEC* statement is a procedure.

1. Specify *INSERT INTO*, followed by the table and columns.

1. The parameters of *BULK INSERT* are the target table, *FROM statement, the source file, and 
parameter options.

1. *IDENTITY* does not guarantee uniqueness. You must define a unique constraint to guarantee
uniqueness.

1. To create a sequence object, use the *CREATE SEQUENCE* command.

1. The relationship between sequences and tables is controlled by the application. 
User applications can reference a sequence object and coordinate the values across multiple rows 
and tables.

1. You can change any of the sequence properties except the data type with the *ALTER SEQUENCE*
command.

1. The *DELETE* statement is a standard statement used to delete data from a table based on an optional
filter predicate, while the standard *TRUNCATE* statement deletes all rows from a table. 

1. *DROP TABLE* will delete an entire table.