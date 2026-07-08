## 1. Current Date & Time Basics

To grab the current moment directly from your database system, SQL provides standard built-in functions:

```sql
SELECT 
    CURRENT_DATE AS today,          -- Returns: 2026-07-08
    CURRENT_TIME AS now_time,       -- Returns: 16:47:50
    CURRENT_TIMESTAMP AS full_now;  -- Returns: 2026-07-08 16:47:50

```

## 2. Breaking Down the `EXTRACT()` Function

The `EXTRACT()` function pulls out a specific component (like the year, month, day, hour, or minute) from a date or timestamp column.

**The basic syntax looks like this:**

```sql
EXTRACT(part FROM timestamp_column)

```

#### Practical Example

Imagine you have an `orders` table tracking e-commerce transactions, and you want to look at a breakdown of when those orders came in:

```sql
SELECT 
    order_id,
    order_date,
    EXTRACT(YEAR FROM order_date) AS order_year,
    EXTRACT(MONTH FROM order_date) AS order_month,
    EXTRACT(DAY FROM order_date) AS order_day,
    EXTRACT(HOUR FROM order_date) AS order_hour
FROM orders;

```

## 3. Cross-Database Variances

While `EXTRACT()` is standard SQL supported natively by engines like **PostgreSQL** and **Oracle**, syntax variations across different relational database management systems (RDBMS) trip up many developers:

| Database | Standard / Shorthand Options | Code Example |
| --- | --- | --- |
| **PostgreSQL / Oracle** | Uses standard `EXTRACT()` | `EXTRACT(YEAR FROM order_date)` |
| **MySQL** | Supports `EXTRACT()` or shorthand functions | `YEAR(order_date)` or `MONTH(order_date)` |
| **SQL Server** | Uses `DATEPART()` or shorthand functions | `DATEPART(year, order_date)` or `YEAR(order_date)` |

> **Analytic Power Tip:** You will almost always see `EXTRACT()` paired up with a `GROUP BY` clause. Grouping your data by an extracted month or year is the foundational step for calculating monthly active users (MAU) or year-over-year growth metrics.
