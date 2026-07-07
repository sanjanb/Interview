## 1. Data Types: The Blueprint for Your Data

A data type tells the database management system (DBMS) exactly what kind of information to expect in a specific column. This prevents invalid data entries (like trying to store a name in a phone number column) and optimizes storage allocation.

The most common data types can be broken down into three main categories:

| Data Type | Category | Best Used For | Real-World Example |
| --- | --- | --- | --- |
| **`INT`** | Numeric | Whole numbers without decimals. | User IDs, quantities, page counts |
| **`VARCHAR(N)`** | String / Text | Variable-length text strings. `N` defines the maximum characters allowed. | Names, email addresses, descriptions |
| **`DECIMAL(P, S)`** | Numeric | Exact fractional numbers. `P` is total digits; `S` is digits after the decimal. | Prices, interest rates, GPS coordinates |
| **`DATE`** | Date / Time | Calendar dates stored in a `YYYY-MM-DD` format. | Birthdates, order dates, event logs |


## 2. Primary Keys vs. Foreign Keys: The Relational Glue

To make a database "relational," tables must be linked together securely without introducing data redundancy. This is achieved using a Parent-Child relationship driven by keys.

### Primary Key (PK)

A Primary Key is a column (or a combination of columns) that uniquely identifies every single row in a table.

* **The Rules:** A primary key must be completely **unique** across the entire table, and it can **never contain a NULL value**. Each table can only have exactly one primary key definition.
* *Analogy:* Your student ID number or passport number.

### Foreign Key (FK)

A Foreign Key is a column in one table that points directly to the Primary Key of another table. It establishes a secure link between the two datasets.

* **The Rules:** The values inside a Foreign Key column must either match an existing value in the parent table's Primary Key column or be completely `NULL`. This rule prevents "orphan records" (e.g., creating an order for a customer ID that doesn't actually exist).
* *Analogy:* A restaurant receipt containing a field for `Customer_ID`. The receipt belongs to the `Orders` table, but it links back to a specific individual in the `Customers` table.



## 3. SQL Constraints: Enforcing the Rules

Constraints are explicit rules applied to a column or an entire table to restrict the types of data that can be inserted. They act as automatic gatekeepers to ensure your data stays accurate and reliable.

* **`NOT NULL`**: Guarantees that a column cannot accept a empty or blank value. For example, a user account must always have an email address.
* **`UNIQUE`**: Ensures that all values in a column are completely distinct from one another. Unlike a Primary Key, a table can have multiple `UNIQUE` columns, and they *can* accept a `NULL` value (depending on the SQL dialect).
* **`DEFAULT`**: Automatically populates a pre-determined value if no specific data is provided during an insert operation (e.g., setting a user's account creation date to the current timestamp by default).
* **`CHECK`**: Evaluates a specific condition before allowing data to be saved. For instance, ensuring an `age` column value is greater than or equal to 18.



## Putting It All Together: A Production-Grade Example

Here is how these data types, keys, and constraints are written in a practical SQL schema script. We will create a parent `Customers` table and a dependent child `Orders` table.

```sql
-- 1. Create the Parent Table
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,                  -- Unique identifier for each customer
    first_name VARCHAR(50) NOT NULL,              -- Text up to 50 chars, cannot be blank
    email VARCHAR(100) UNIQUE NOT NULL,           -- Must be unique, cannot be blank
    join_date DATE DEFAULT CURRENT_DATE           -- Automatically fills today's date if missing
);

-- 2. Create the Dependent Child Table
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,                     -- Unique identifier for each order
    order_date DATE NOT NULL,
    amount DECIMAL(10, 2) CHECK (amount > 0),     -- Price must be a positive number
    customer_ref_id INT,                          -- Matches the data type of the parent PK
    
    -- Establishing the relational link
    FOREIGN KEY (customer_ref_id) REFERENCES Customers(customer_id)
);

```

### Why this structure matters in practice:

If you attempt to execute the query below without first adding a customer with an ID of `99` into the `Customers` table, the database engine will halt execution and throw a **Foreign Key Violation Error**:

```sql
-- This will FAIL if customer_id 99 does not exist in the parent table!
INSERT INTO Orders (order_id, order_date, amount, customer_ref_id)
VALUES (5001, '2026-07-07', 49.99, 99);

```

---
