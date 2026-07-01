### **SQL Interview Questions: Part 3 (11–15)**

#### **11. What do you mean by Union and Union All operators?**
The **Union** operator is used to combine results from two lists while **removing any duplicates**. For example, if you combine a school friend list and a work friend list, any person appearing on both lists will only show up once in the final result. On the other hand, **Union All** combines the lists but **keeps every name**, even if they appear more than once, meaning the final list will contain duplicate values.

#### **12. How can you find the second highest salary in a table?**
Finding the second highest salary is done using **nested subqueries**. The process starts with an **innermost query** that finds the absolute maximum salary. A **second subquery** then filters the table to find the maximum salary among all values that are **less than that absolute maximum**. Finally, an **outer query** selects the specific names and salaries of employees who match this identified second-highest value.

#### **13. What are views in SQL?**
A **view** is a **virtual table** that allows you to see data from one or more tables in a specific way without storing that data separately on the disk. Views are especially useful for **security and simplicity**, as they can limit access to sensitive data—such as showing only names and addresses while hiding student IDs—and restrict user permissions to only specific parts of a large table.

#### **14. How can you convert a text into date format?**
To convert a string of text into a proper date format, you use the **`string to date` function**. This function requires you to specify the text you want to convert along with format identifiers, such as **`%d` for day, `%m` for month, and `%Y` for year**. For instance, it can read a string like "27102024" and correctly interpret it as October 27, 2024.

#### **15. What are triggers in SQL?**
**Triggers** are automatic **"reflex actions"** that run whenever a specific event—such as inserting, updating, or deleting data—occurs in a database. They are designed to **eliminate manual tasks** and reduce the chance of errors. For example, in a library system, a trigger can be set up to **automatically decrease the available book count** every time a new record is added to a "borrowed books" table, ensuring the stock stays up to date without manual input.

***

---

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
