# TSQL Homework 2a
## Austin Stiffler
### 17 January, 2021

1. There is no order of execution of a SQL query; all expressions in the same logical query are evaluated at the same time, known as *all-at-once operations*.

1. The *FROM* clause is they very first query clause that is logically processed. It is simply where you specify the name of the table you want to query.

1. The *WHERE* clause specifies a predicate or logical expression to filter the rows returned by the *FROM* clause. Only rows for which the logical expression evaluates to *TRUE* are returned by the *WHERE* clause.

1. The *GROUP BY* clause arranges the rows returned by the previous logical query processing phase in groups, based on the elements specified.

1. The *HAVING* clause is a group filter. Only groups for which the *HAVING* predicate evaluates to *TRUE* are returned.

1. The *SELECT* clause specifies the attributes (columns) you want to return in the result table of the query.

1. The *DISTINCT* keyword ensures only distinct occurrences of known values are returned.

1. The *ORDER BY* clause sorts the rows in the output for presentation purposes. It is the very last clause to by processed.

1. The *LIMIT* clause is used to set an upper limit on the number of rows returned by SQL. This is not supported by all SQL versions.

1. The *TOP* filter is used to limit the number or percentage of rows your query returns.

1. The *OFFSET* clause indicates how many rows to skip. The *FETCH* clause indicates how many rows to filter after the skipped rows.