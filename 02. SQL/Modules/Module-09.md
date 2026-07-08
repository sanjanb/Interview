## 1. Subqueries with Comparison Operators (`=`, `>`, `<`, etc.)

When using a standard comparison operator, the inner query **must return exactly one value** (a single scalar value like a specific number or string). If the inner query returns multiple rows, the database will throw an execution error.

* **Analytic Use Case:** Finding items that are performing above or below a dynamically calculated baseline, such as finding products that cost more than the average item price.

```sql
SELECT product_name, price
FROM products
WHERE price > (
    -- The Inner Query: Calculates a single average value first
    SELECT AVG(price) FROM products
);

```

## 2. Subqueries with the `IN` Operator

If your inner query is expected to return a list of multiple values (a full column of data), standard comparison operators will fail. Instead, you use the `IN` operator to match values against the returned list.

* **Practical Example:** Suppose you want to find all customer profiles who placed an order in the last 30 days:

```sql
SELECT customer_name, email
FROM customers
WHERE customer_id IN (
    -- The Inner Query: Returns a list of distinct IDs
    SELECT DISTINCT customer_id 
    FROM orders 
    WHERE order_date >= '2026-06-08'
);

```

## 3. Subqueries with the `EXISTS` Operator

The `EXISTS` operator works purely on a true/false condition. It evaluates whether the inner query returns **any rows at all**. The moment the database finds a single matching row inside the subquery, it stops looking and returns `TRUE`, making it highly efficient.

```sql
SELECT customer_name
FROM customers c
WHERE EXISTS (
    SELECT 1 
    FROM orders o 
    WHERE o.customer_id = c.customer_id AND o.amount > 1000
);

```

---

## Direct Comparison: Subqueries vs. JOINS

While you can often achieve the exact same output using either a Join or a Subquery, they treat data differently behind the scenes:

| Feature | Subqueries | JOINS |
| --- | --- | --- |
| **Readability** | Highly intuitive for filtering operations ("Find X where X is in Y"). | Can become complex when multiple tables are chained. |
| **Output Structure** | Keeps your final column output strictly limited to the outer table. | Combines columns from multiple tables horizontally. |
| **Performance** | Great for deep filtering, but unoptimized nested structures can slow down. | Generally preferred by database optimizers for heavy, scaled datasets. |

> **Analytic Power Tip:** When using `EXISTS`, you do not need to select actual column names inside the subquery (e.g., `SELECT price`). Writing `SELECT 1` is standard practice because the database engine only cares if a qualifying row exists, completely ignoring the data payload.
