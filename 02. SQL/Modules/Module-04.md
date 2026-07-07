## 1. The Core Retrieval Foundation: `SELECT` & `FROM`

The `SELECT` statement reads and retrieves records from a database table. It defines which vertical columns your output will include.

* **The Wildcard (`SELECT *`):** Instructs the engine to return every single column from the target table. While useful for rapid exploration, it should generally be avoided in production environments because it adds unnecessary network bandwidth and memory overhead.
* **Explicit Targeting:** Naming columns explicitly optimizes execution plans and ensures your calling applications receive predictable payloads.

```sql
-- Projecting specific columns from the table
SELECT CustName, Salary 
FROM customer;

```



## 2. Row-Level Evaluation: The `WHERE` Clause

While `SELECT` isolates vertical columns, the `WHERE` clause applies conditions to isolate horizontal rows. It acts as an inline row-by-row evaluator. If a row's data satisfies the condition (resolving strictly to `TRUE`), it passes into the results; if it evaluates to `FALSE` or `UNKNOWN` (due to `NULL` fields), it is discarded.

```sql
-- Isolating rows matching a specific category string
SELECT * 
FROM customer 
WHERE City = 'Delhi';

```



## 3. SQL Operators Matrix

To build nuanced conditions within a `WHERE` clause, SQL leverages several categories of operators. They help filter data across mathematical boundaries, exact strings, lists, or structural patterns.

| Operator Type | Keyword / Syntax | Practical Purpose | Code Application |
| --- | --- | --- | --- |
| **Comparison** | `=`, `!=`, `>`, `<`, `>=`, `<=` | Evaluates numerical or alphabetical size differences. | `WHERE Age >= 25` |
| **Logical** | `AND`, `OR`, `NOT` | Chains multiple evaluations together or flips a condition's truth value. | `WHERE City = 'Delhi' AND Salary > 9000` |
| **Range Check** | `BETWEEN ... AND ...` | Evaluates if a value falls inside a specific inclusive range. | `WHERE Salary BETWEEN 6000 AND 10000` |
| **List Check** | `IN (...)` | Evaluates if a value matches any element within a specified list. | `WHERE City IN ('Delhi', 'Mumbai', 'Pune')` |
| **Pattern Matching** | `LIKE` | Uses wildcards (`%` for multi-character, `_` for single) to scan for substrings. | `WHERE CustName LIKE 'S%'` (Starts with S) |



## 4. Output Post-Processing: `ORDER BY` & `LIMIT`

Once data passes through retrieval and row filtering, it often requires structuring before being consumed by an application or user interface.

### Sorting Datasets (`ORDER BY`)

The `ORDER BY` clause arranges rows based on one or more columns. By default, it sorts records in ascending order (`ASC`), but you can specify descending order (`DESC`).

```sql
-- Sorting records from highest salary to lowest
SELECT CustName, Salary 
FROM customer 
ORDER BY Salary DESC;

```

*Note: You can sort by columns that are not explicitly included in your `SELECT` target list.*

### Restricting Result Volumes (`LIMIT`)

The `LIMIT` clause places an absolute cap on the total number of rows returned by the query engine. This is an essential optimization technique for implementing UI pagination, fetching top records (e.g., finding the top 3 highest earners), and protecting backend systems from trying to render millions of rows simultaneously.

```sql
-- Fetching only the top 2 highest-paid customers
SELECT CustName, Salary 
FROM customer 
ORDER BY Salary DESC 
LIMIT 2;

```

---

> ### 💡 Structural Processing Order
> 
> 
> It is important to remember that the database engine compiles clauses in a specific operational sequence, which is completely different from the order in which we write them:
> 
> $$\text{FROM} \longrightarrow \text{WHERE} \longrightarrow \text{SELECT} \longrightarrow \text{ORDER BY} \longrightarrow \text{LIMIT}$$
> 
> 
> 
> Because `WHERE` executes before `SELECT`, you cannot use a column alias created in your `SELECT` clause inside your `WHERE` filter condition.
