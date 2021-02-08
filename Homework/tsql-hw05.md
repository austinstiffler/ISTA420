# T-SQL Chapter 5 Homework
## Austin Stiffler
### 01 February, 2021


1. A *table expression* is a named query expression that represents a valid relational table. The outer query and inner query are merged into one query directly against
the underlying objects. 

1. Derived tables are defined in the *FROM* clause of an outer query. It can be used anywhere there is a table.

1. The subquery, or inner query, is evaluated first.

1. The *WITH* clause.

1. A subsequent derived table CAN use a table alias declared in a preceding table expression.

1. A main query CAN refer to a previously defined common table expression by multiple aliases.

1. Yes. a *view's* definition is stored as a permanent object in the database, making it reusable.

1. *WITH CHECK OPTION* will prevent modifications that confilict with the views filter. It's important if data no longer shows in the view due to not satisfying the view's 
query filter.

1. *SCHEMABINDING* binds the schema of referenced objects and columns to the schema of the referencing object. It indicates that referenced objects cannot be dropped and that
referenced columns cannot be dropped or altered.

1. A *table valued function* is a reusable table expression that supports input parameters. A named block of code that returns a table value.

1. The *APPLY* operator is a powerful table operator that is used in the *FROM* clause of a query.  It is similar to *JOIN* in that it joins two tables.

1. It has two types: *CROSS APPLY* and *OUTER APPLY*. *CROSS APPLY* will combine two tables, but evaluate the left side before the right side, per row. *OUTER APPLY* will preserve
the left table following the *APPLY* phase.