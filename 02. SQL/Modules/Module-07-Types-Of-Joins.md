## 1. INNER JOIN

The `INNER JOIN` acts as a strict matchmaker. It selects only the rows that have matching values in **both** tables. If a row in the left table does not have a corresponding match in the right table (or vice versa), it is excluded from the final output.

* **Syntax Example:**
```sql
SELECT orders.order_id, customers.customer_name
FROM orders
INNER JOIN customers ON orders.customer_id = customers.customer_id;

```



## 2. LEFT (OUTER) JOIN

The `LEFT JOIN` returns **all records from the left table**, along with any matching records from the right table. If there is no matching record on the right side, the database engine keeps the left row intact and fills the right table's columns with `NULL` values.

* **Analytic Use Case:** This is perfect for finding inactive elements, such as identifying customers who have never placed an order (`WHERE orders.customer_id IS NULL`).

## 3. RIGHT (OUTER) JOIN

The `RIGHT JOIN` is the exact mirror image of the Left Join. It preserves **every single row from the right table**, pulling in matches from the left table where they exist. If a row in the right table has no matching counterpart on the left, the left-side columns are returned as `NULL`.

## 4. FULL (OUTER) JOIN

A `FULL OUTER JOIN` combines the behavior of both Left and Right joins. It returns rows when there is a match in **either** the left or the right table. If there is a mismatch on either side, it keeps the unmatched row and overlays the missing side's attributes with `NULL`.



## Data Blueprint: Side-by-Side Example

To see how these joins alter your results, consider two simple tables: `users` and `payments`.

### Source Data

**`users` Table (Left)**

| user_id | user_name |
| --- | --- |
| 1 | Alice |
| 2 | Bob |
| 3 | Charlie |

**`payments` Table (Right)**

| payment_id | user_id | amount |
| --- | --- | --- |
| 101 | 1 | 250.00 |
| 102 | 2 | 150.00 |
| 103 | 4 | 500.00 |

## Visualizing the Output Differences

When running different join types using `user_id` as the matching condition (`ON users.user_id = payments.user_id`), the structure shifts distinctly:

| Join Type | Resulting Rows Included | Why? |
| --- | --- | --- |
| **`INNER JOIN`** | Alice, Bob | Only user_id 1 and 2 exist in both tables. Charlie and payment 103 are dropped. |
| **`LEFT JOIN`** | Alice, Bob, Charlie | Charlie is preserved from the left side; his payment columns will read `NULL`. |
| **`RIGHT JOIN`** | Alice, Bob, Payment 103 | Payment 103 is preserved from the right side; its user_name will read `NULL`. |
| **`FULL JOIN`** | Alice, Bob, Charlie, Payment 103 | All records from both tables are displayed, filled with `NULL` where gaps exist. |


> **Performance Tip:** When joining tables, always ensure you are matching on indexed columns (like Primary Keys and Foreign Keys). Joining on unindexed text columns forces the database engine to perform a full-table scan, which can slow down production environments.

For a live code demonstration utilizing clean, practical datasets, the [Complete SQL JOINS Tutorial](https://www.youtube.com/watch?v=H6988OpZKTU) walks through these join queries within an active SQL interface.
