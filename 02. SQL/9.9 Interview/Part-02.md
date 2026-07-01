### **SQL Interview Questions: Part 2 (6–10)**

#### **6. Differentiate between Group By and Order By Clause.**
These two clauses serve different purposes for organizing data. **Group By** is like putting your data into **meaningful buckets or summaries**. It is typically used with **aggregate functions** (like SUM, AVG, or COUNT) to calculate things such as the total or average salary within a specific department. **Order By**, on the other hand, is used for **sorting rows** in a particular order. It allows you to arrange your entire table based on one or more columns, such as ranking employees by salary from highest to lowest or alphabetizing names.

#### **7. Explain the difference between Where and Having Clause.**
The primary difference lies in **when the filtering occurs**. The **Where Clause** acts like a watchman at a gate; it **filters individual rows** based on a specific condition **before** any grouping takes place. For example, you might use it to find only students who are 18 years or older. The **Having Clause** acts like a judge in a talent show; it **filters groups** that were created by the Group By clause **after** the data has been aggregated. You would use it if you wanted to display only those age groups that have more than one student.

#### **8. What are aggregate functions in SQL and can you provide examples?**
**Aggregate functions** are tools that allow you to perform calculations on a set of values to return a single summarized result. Common examples include:
*   **Count**: Returns the total number of rows or non-null values in a column.
*   **Sum**: Adds up all the values in a numeric column.
*   **Average (AVG)**: Calculates the average value of a numeric column.
*   **Min**: Finds the lowest value in a column.
*   **Max**: Finds the highest value in a column.

#### **9. Explain indexing in SQL and what do you mean by clustered index?**
**Indexing** is a way to make data retrieval fast and efficient, similar to using an index at the back of a book to find a topic without flipping through every page. Without an index, a database must search through every record one by one, which is very slow. A **clustered index** specifically organizes the **actual data rows** in the table in a specific order, such as arranging employee IDs from smallest to largest. This allows the database to jump directly to a specific section of data, significantly cutting down search time.

#### **10. What is normalization and explain the different normal forms?**
**Normalization** is the process of organizing data efficiently to **minimize redundancy** (duplicate information) and prevent errors when adding, removing, or updating records. The different normal forms include:
*   **1NF (First Normal Form)**: Each table cell must contain a **single value**, and each column must have a unique name.
*   **2NF (Second Normal Form)**: All non-key attributes must **depend directly on the primary key** rather than on other attributes.
*   **3NF (Third Normal Form)**: Every non-key attribute must be **independent** of other non-key attributes.
*   **BCNF (Boyce-Codd Normal Form)**: A more advanced version where every determinant in the table must be a **candidate key**.

***

---

## 6. Differentiate between Group By and Order By Clause.

* **Group By** groups rows with identical data into summary rows (buckets).
* **Order By** sorts the final results in ascending or descending order.
* **💻 Example Query:**
```sql
-- Group calls by bot ID, then sort the groups by the highest call count
SELECT bot_id, COUNT(call_id) AS total_calls
FROM Calls
GROUP BY bot_id
ORDER BY total_calls DESC;

```



## 7. Explain the difference between Where and Having Clause.

* **Where** filters individual rows *before* grouping happens.
* **Having** filters groups *after* the `GROUP BY` clause runs.
* **💻 Example Query:**
```sql
-- Filter for completed calls first, group by language, then filter for languages with over 500 calls
SELECT language, COUNT(call_id) AS heavy_usage
FROM Calls
WHERE status = 'Completed'
GROUP BY language
HAVING COUNT(call_id) > 500;

```



## 8. What are aggregate functions in SQL and can you provide examples?

* Mathematical functions that look at a collection of values and return one summary value.
* **💻 Example Query:**
```sql
-- Extracting overall performance metrics of the speech bot system
SELECT COUNT(call_id) AS total_processed,
       AVG(duration_seconds) AS average_duration,
       MAX(duration_seconds) AS longest_call
FROM Calls;

```



## 9. Explain indexing in SQL and what do you mean by clustered index?

* **Indexing** speeds up lookups. A **clustered index** physically dictates the exact storage order of the data rows on the disk.
* **💻 Example Query:**
```sql
-- Setting a primary key automatically creates a clustered index on call_id
ALTER TABLE Calls ADD CONSTRAINT PK_Calls PRIMARY KEY (call_id);

-- Creating a non-clustered index to speed up frequent searches by sentiment
CREATE INDEX idx_call_sentiment ON Calls (sentiment);

```



## 10. What is normalization and explain the different normal forms?

* Breaking a massive table down into smaller, related tables to eliminate duplicate data.
* **💻 Example Query:**
```sql
-- Unnormalized: Storing client metadata inside every single call row (redundant)
-- Normalized (2NF/3NF structure): Split into two distinct, clean tables
CREATE TABLE Clients (
    client_id INT PRIMARY KEY,
    company_name VARCHAR(100),
    industry_sector VARCHAR(50) -- e.g., 'BFSI' or 'Healthcare'
);

CREATE TABLE Calls (
    call_id INT PRIMARY KEY,
    client_id INT, -- Normalized link via foreign key
    duration_seconds INT,
    FOREIGN KEY (client_id) REFERENCES Clients(client_id)
);

```
---

Let's look closely at **Question 7**. If you accidentally used a `WHERE` clause instead of a `HAVING` clause to filter `COUNT(call_id) > 500`, the database engine would throw a syntax error. Why do you think the database cannot process an aggregate function like `COUNT()` inside a standard `WHERE` clause?
