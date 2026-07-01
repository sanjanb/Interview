## 11. What do you mean by Union and Union All operators?

* **Union** merges two datasets and removes duplicate rows.
* **Union All** merges two datasets but keeps all duplicates.
* **💻 Example Query:**
```sql
-- UNION combines active bot logs from two regions, dropping duplicates
SELECT call_id, customer_id FROM US_Bot_Logs
UNION
SELECT call_id, customer_id FROM EU_Bot_Logs;

```


## 12. How can you find the second highest salary in a table?

* Uses a subquery to find the maximum value that is strictly less than the absolute highest value.
* **💻 Example Query:**
```sql
-- Finding the second longest AI voice bot call duration
SELECT MAX(duration_seconds) 
FROM Calls 
WHERE duration_seconds < (SELECT MAX(duration_seconds) FROM Calls);

```



## 13. What are views in SQL?

* A virtual, saved query that acts like a table to simplify complex logic or protect data.
* **💻 Example Query:**
```sql
-- Creating a secure view for client dashboards that hides raw transcript text
CREATE VIEW View_Client_Dashboard AS
SELECT call_id, duration_seconds, sentiment 
FROM Calls;

```



## 14. How can you convert a text into date format?

* Uses database-specific conversion functions to safely transform string text into formatted dates.
* **💻 Example Query:**
```sql
-- Converting a raw string from an API payload into a proper date (MySQL syntax)
SELECT STR_TO_DATE('2026-07-01', '%Y-%m-%d') AS formatted_call_date;

```



## 15. What are triggers in SQL?

* Event-driven scripts that automatically run when data is inserted, updated, or deleted.
* **💻 Example Query:**
```sql
-- Automatically flag a customer for manual outreach if a bot call ends in 'Critical_Failure'
CREATE TRIGGER auto_flag_failure
AFTER UPDATE ON Calls
FOR EACH ROW
BEGIN
    IF NEW.status = 'Critical_Failure' THEN
        INSERT INTO Manual_Review_Queue (customer_id, issue_type) 
        VALUES (NEW.customer_id, 'System Drop');
    END IF;
END;

```
