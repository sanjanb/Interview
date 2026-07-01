Database & SQL Basics (CRUD Operations)

* 
**Create (INSERT):** Adding a new AI voice bot call record into the database.


```sql
INSERT INTO Calls (call_id, customer_id, duration_seconds, status, sentiment)
VALUES (101, 55, 120, 'Completed', 'Positive');

```


* **Read (SELECT):** Finding all completed calls.
```sql
SELECT * FROM Calls WHERE status = 'Completed';

```


* **Update:** Modifying a customer's phone number.
```sql
UPDATE Customers 
SET phone_number = '+1-555-0199' 
WHERE customer_id = 55;

```


* **Delete:** Removing temporary or test call logs from the system.
```sql
DELETE FROM Calls WHERE status = 'Test_Run';

```



---

### 2. Core SQL Statements & Clauses

* 
**WHERE Clause (Filtering):** Retrieving only the calls where the AI detected a 'Negative' sentiment so you can flag them for compliance review.


```sql
SELECT call_id, duration_seconds 
FROM Calls 
WHERE sentiment = 'Negative';

```


* 
**JOINS:** Combining data from the `Calls` table and `Customers` table to see the names of clients who had long calls.



```
```sql
SELECT Customers.customer_name, Calls.duration_seconds, Calls.status
FROM Calls
INNER JOIN Customers ON Calls.customer_id = Customers.customer_id;
```

```

---

### 3. Structural Concepts & Rules

* 
**Table Creation with Constraints (Data Types, Primary/Foreign Keys, Not Null):** Setting up a robust table for your speech bot workflows.


```sql
CREATE TABLE Call_Logs (
    log_id INT PRIMARY KEY,                  -- Unique ID, cannot be null
    call_id INT NOT NULL,                    -- Must have a value
    transcript VARCHAR(500),                 -- Text data type
    bot_version VARCHAR(50) DEFAULT 'v1.0',  -- Default constraint
    FOREIGN KEY (call_id) REFERENCES Calls(call_id) -- Link to Calls table
);

```


* **Indexes:** Speeding up searches on large client call logs by indexing the `customer_id` column.
```sql
CREATE INDEX idx_customer_calls 
ON Calls (customer_id);

```



---

### 4. Data Aggregation & Advanced Retrieval

* 
**Aggregate Functions & GROUP BY:** Finding the total number of calls handled and the average call duration for each type of bot sentiment.


```sql
SELECT sentiment, 
       COUNT(call_id) AS total_calls, 
       AVG(duration_seconds) AS avg_duration
FROM Calls
GROUP BY sentiment;

```


* **ORDER BY Clause:** Getting a list of all calls, sorted from the longest duration to the shortest (Descending order).
```sql
SELECT call_id, duration_seconds 
FROM Calls 
ORDER BY duration_seconds DESC;

```


* **Subquery (Nested Query):** Finding all calls handled by the bot that lasted longer than the *overall average* call duration.
```sql
SELECT call_id, duration_seconds 
FROM Calls 
WHERE duration_seconds > (SELECT AVG(duration_seconds) FROM Calls);

```



---

### 5. Advanced Database Architecture

* 
**Views:** Creating a safe, "virtual table" for the business team that hides sensitive customer IDs but shows call performance.


```sql
CREATE VIEW View_Call_Performance AS
SELECT call_id, duration_seconds, status, sentiment 
FROM Calls;

-- You can now query it like a normal table:
SELECT * FROM View_Call_Performance;

```


* **Transactions (ACID):** Ensuring that when a call ends, both the `Calls` log is updated and the client's `Customer_Balance` is deducted simultaneously. If one fails, both roll back.
```sql
START TRANSACTION;

UPDATE Calls SET status = 'Completed' WHERE call_id = 101;
UPDATE Customers SET credits = credits - 1 WHERE customer_id = 55;

COMMIT; -- Saves changes permanently if both succeed

```


* 
**Stored Procedures:** Saving a pre-compiled query on the server to quickly pull a summary report for a specific client.


```sql
CREATE PROCEDURE GetClientReport(IN client_id INT)
BEGIN
    SELECT * FROM Calls WHERE customer_id = client_id;
END;

-- To run it:
CALL GetClientReport(55);

```


* 
**Triggers:** Automatically creating an alert flag in a `Compliance_Alerts` table the absolute second a call's sentiment is updated to 'Critical_Risk'.


```sql
CREATE TRIGGER alert_on_bad_sentiment
AFTER UPDATE ON Calls
FOR EACH ROW
BEGIN
    IF NEW.sentiment = 'Critical_Risk' THEN
        INSERT INTO Compliance_Alerts (call_id, alert_reason) 
        VALUES (NEW.call_id, 'High risk compliance issue detected');
    END IF;
END;

```
