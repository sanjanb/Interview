### **SQL Interview Questions: Part 1 (1–5)**

#### **1. What is the difference between DBMS and RDBMS?**
**DBMS (Database Management System)** is a basic way to store data in **individual files** where there is no connection between them, making searching through data tedious and time-consuming. In contrast, **RDBMS (Relational Database Management System)** stores data in **interconnected tables**. This relational structure allows for **faster data retrieval**, reduces data redundancy, and supports multiple users with high security.

#### **2. What is a primary key and a foreign key?**
A **primary key** serves as a **unique identifier** for every row in a table, ensuring that each record is distinct and cannot be duplicated. It also **does not allow null or empty values**. A **foreign key** is used to **create a link between two tables** by pointing back to the primary key of another table, allowing records in one table to reference related information in another.

#### **3. What are constraints and their types?**
**Constraints** are rules applied to data in a table to ensure it remains **accurate and reliable**. The common types of constraints in SQL include:
*   **Not Null**: Ensures a column **cannot be empty**.
*   **Unique**: Guarantees that all values in a column are **distinct**.
*   **Primary Key**: A combination of Not Null and Unique that **uniquely identifies** each record.
*   **Foreign Key**: **Links tables together** by referencing a primary key in another table.
*   **Check**: Enforces a specific **condition** (e.g., ensuring a "voting age" column only accepts values over 18).
*   **Default**: Provides a **predefined value** if no value is specified for a column.

#### **4. Explain DDL and DML commands in SQL.**
**DDL (Data Definition Language)** commands, such as **CREATE, ALTER, and DROP**, are used to define and organize the **structure of the database** (the "house") without dealing with the actual data itself. **DML (Data Manipulation Language)** commands, such as **INSERT, UPDATE, and DELETE**, are used to manage and manipulate the **actual data** (the "items inside the house") once the tables have been created.

#### **5. What is the difference between Delete, Drop, and Truncate statements?**
These three statements are used to remove data in different ways:
*   **Delete**: Removes **specific rows** based on a condition; it is precise and allows you to **roll back (undo)** the operation.
*   **Truncate**: Quickly **empties the entire table** but keeps the table structure intact for future use; it **cannot be rolled back**.
*   **Drop**: Completely **removes the entire table structure** and all its data from the database permanently.

***

---


## 1. What is the difference between DBMS and RDBMS?

* **DBMS** stores data in isolated files.
* **RDBMS** uses connected tables. We use relationships to pull data across tables instantly.
* **💻 Example Query:**
```sql
-- RDBMS utilizes relationships to pull matching records instantly
SELECT Customers.customer_name, Calls.duration_seconds 
FROM Calls 
INNER JOIN Customers ON Calls.customer_id = Customers.customer_id;

```



## 2. What is a primary key and a foreign key?

* **Primary Key** uniquely identifies a row.
* **Foreign Key** links a row to another table's primary key.
* **💻 Example Query:**
```sql
CREATE TABLE Calls (
    call_id INT PRIMARY KEY,         -- Unique Identifier
    customer_id INT, 
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id) -- Link
);

```



## 3. What are constraints and their types?

* Rules applied to columns to protect data accuracy.
* **💻 Example Query:**
```sql
CREATE TABLE Bot_Settings (
    bot_id INT PRIMARY KEY,
    bot_name VARCHAR(50) NOT NULL UNIQUE,       -- Cannot be empty or duplicate
    confidence_threshold DECIMAL CHECK (confidence_threshold >= 0.5), -- Validation
    status VARCHAR(20) DEFAULT 'Active'         -- Predefined value
);

```



## 4. Explain DDL and DML commands in SQL.

* **DDL** defines the database structure.
* **DML** modifies the records inside that structure.
* **💻 Example Query:**
```sql
-- DDL: Creating the structural house
CREATE TABLE Test_Logs (log_id INT, log_text VARCHAR(100));

-- DML: Inserting items into the house
INSERT INTO Test_Logs (log_id, log_text) VALUES (1, 'Bot successfully initialized');

```



## 5. What is the difference between Delete, Drop, and Truncate statements?

* **Delete** removes specific rows (can be undone).
* **Truncate** wipes all rows completely (cannot be undone).
* **Drop** destroys the table entirely.
* **💻 Example Query:**
```sql
DELETE FROM Calls WHERE status = 'Failed'; -- Removes matching rows
TRUNCATE TABLE Temp_Call_Cache;            -- Empties data, keeps table structure
DROP TABLE Old_Voice_Bot_v1;               -- Deletes data and table structure permanently

```

---

Looking at **Question 5**, imagine a client accidentally deletes critical compliance data using a `DELETE` command versus a `TRUNCATE` command. Based on the definitions above, why is a mistaken `DELETE` safer for a Customer Success Engineer to troubleshoot than a `TRUNCATE`?
