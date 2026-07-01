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
