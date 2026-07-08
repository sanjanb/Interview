## 1. Populating Tables (`INSERT INTO`)

The `INSERT INTO` statement is used to populate rows inside an existing schema structure. There are two primary ways to structure an insert statement:

### Method A: Explicit Column Targeting (Production Best Practice)

By explicitly naming the columns you are targeting, you prevent your application logic from breaking if the database schema is altered down the line (e.g., adding an optional or default column).

```sql
INSERT INTO customer (CustID, CustName, Age, City, Salary) 
VALUES (1, 'Sam', 26, 'Delhi', 9000);

```

### Method B: Bulk Positional Insertion

If you are inserting data into every single column in the exact order the table was created, you can omit the column declarations entirely.

```sql
-- Inserting multiple rows at once
INSERT INTO customer 
VALUES 
  (2, 'Ram', 19, 'Bangalore', 11000),
  (3, 'Pam', 31, 'Mumbai', 6060);

```



## 2. Modifying Rows (`UPDATE`)

The `UPDATE` statement alters existing data inside specific rows.

> ⚠️ **The Golden Rule of Updates:** Always double-check your `WHERE` clause. If you run an `UPDATE` statement without a `WHERE` clause, **every single row in the database will be modified.**

```sql
-- Safe, targeted update targeting a specific Primary Key
UPDATE customer 
SET CustName = 'Xam', Age = 32 
WHERE CustID = 4;

```



## 3. Removing Data: `DELETE` vs. `TRUNCATE` vs. `DROP`

One of the most common stumbling blocks for engineers is knowing exactly when to use `DELETE`, `TRUNCATE`, or `DROP`. While they all remove information, they operate at completely different structural levels.

### Detailed Breakdown Matrix

| Attribute | `DELETE` | `TRUNCATE` | `DROP` |
| --- | --- | --- | --- |
| **Command Type** | DML (Data Manipulation) | DDL (Data Definition) | DDL (Data Definition) |
| **Target Scope** | Specific rows or all rows | All rows instantly | The entire table asset |
| **Speed/Performance** | Slower (removes row-by-row, logs changes) | Extremely fast (deallocates data pages) | Instant |
| **`WHERE` Support** | Yes, allows targeted filtering | No, it's all-or-nothing | No |
| **Rollback Capable** | Yes (if wrapped in a transaction) | No (in most standard configurations) | No |
| **Table Structure** | Remains intact | Remains intact (empty table) | Completely erased from database |

#### Syntax Examples:

```sql
-- 1. DELETE: Safely removes rows matching a condition
DELETE FROM customer WHERE CustID = 3;

-- 2. TRUNCATE: Instantly wipes all row data, keeping the table architecture
TRUNCATE TABLE customer;

-- 3. DROP: Vaporizes the table data and its schema entirely from memory
DROP TABLE customer;

```



## 4. Evolving Table Structures (`ALTER TABLE`)

Requirements change, and you will frequently need to adjust the columns of tables that already contain data. The `ALTER TABLE` command handles these physical structure changes.

```sql
-- Scenario A: Adding a new attribute column to an active table
ALTER TABLE customer ADD phone_number VARCHAR(15);

-- Scenario B: Removing an obsolete column from the schema
ALTER TABLE customer DROP COLUMN City;

-- Scenario C: Altering a data type or modifying a constraint
ALTER TABLE customer MODIFY COLUMN CustName VARCHAR(100) NOT NULL;

```

