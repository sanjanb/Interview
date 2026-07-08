## 1. Summarizing Data: The `GROUP BY` Statement

The `GROUP BY` clause groups rows that share identical values in specified columns into summary rows. It acts like a categorical bucket: you tell the database engine which column to use as a label, and it separates the rows into unique groups.

### The Absolute Rule of Group By

When writing a `GROUP BY` query, any column named in your `SELECT` clause **must** meet one of two criteria:

1. It must be explicitly listed inside the `GROUP BY` clause.
2. It must be wrapped inside an **Aggregate Function** (like `SUM`, `COUNT`, `AVG`, `MAX`, or `MIN`).

If you break this rule, the SQL compiler will fail, throwing a non-aggregated column error. The database engine cannot display individual row attributes next to grouped summaries.



## 2. The Core Aggregate Functions

To make a `GROUP BY` clause functional, it is paired with aggregate functions that perform mathematical calculations on each distinct bucket of data:

* **`COUNT()`**: Returns the total number of rows or non-null values inside each group.
* **`SUM()`**: Computes the mathematical total of a numerical column within each group.
* **`AVG()`**: Calculates the arithmetic mean value of a numerical column for each group.
* **`MIN()` / `MAX()**`: Finds the absolute lowest or highest value inside each group boundary.



## 3. Filtering Summaries: The `HAVING` Clause

A common mistake is trying to filter aggregated results using a `WHERE` clause (e.g., `WHERE SUM(salary) > 50000`). This will throw an error because **the `WHERE` clause filters individual rows before any groupings are created.**

To solve this, SQL uses the **`HAVING`** clause. This statement acts as a post-aggregation filter, evaluating entire groups *after* the `GROUP BY` step has already combined the data.

### Structural Comparison: `WHERE` vs. `HAVING`

| Attribute | `WHERE` | `HAVING` |
| --- | --- | --- |
| **Execution Order** | Runs **before** rows are grouped. | Runs **after** rows are grouped. |
| **Evaluation Level** | Filters raw, individual rows. | Filters processed, aggregated groups. |
| **Aggregate Functions** | Cannot contain aggregates (`SUM`, `COUNT`, etc.). | Specifically designed to evaluate aggregates. |


## 4. Complete Practical Execution Blueprint

Consider an e-commerce database with a raw `sales_data` table. We want to find cities where the total sales volume exceeds $10,000, but we want to completely ignore low-tier items priced under $10 during our calculations.

### Sample Source Data (`sales_data`)

| city | product_price |
| --- | --- |
| Delhi | 5000.00 |
| Delhi | 5.00 *(Ignored by WHERE)* |
| Delhi | 6000.00 |
| Mumbai | 12000.00 |
| Pune | 4000.00 *(Dropped by HAVING)* |

### The Query

```sql
SELECT city, SUM(product_price) AS total_revenue
FROM sales_data
WHERE product_price >= 10.00           -- 1. Filter raw individual rows
GROUP BY city                          -- 2. Sort remaining data into city buckets
HAVING SUM(product_price) > 10000.00;  -- 3. Filter out cities below revenue goal

```

### Processed Output

| city | total_revenue |
| --- | --- |
| Delhi | 11000.00 |
| Mumbai | 12000.00 |


## 5. Comprehensive SQL Execution Order

To avoid syntax errors, it helps to understand how the database engine compiles a complete query under the hood. The structural pipeline flows in this exact chronological order:

$$\text{FROM} \longrightarrow \text{WHERE} \longrightarrow \text{GROUP BY} \longrightarrow \text{HAVING} \longrightarrow \text{SELECT} \longrightarrow \text{ORDER BY} \longrightarrow \text{LIMIT}$$

Because `HAVING` runs before `SELECT`, you cannot use a custom column alias (like `total_revenue` in the query above) inside your `HAVING` condition in standard SQL dialects. You must write out the full aggregate expression instead.

