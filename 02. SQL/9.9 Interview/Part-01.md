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
