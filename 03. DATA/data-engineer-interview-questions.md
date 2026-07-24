# Top 30 Data Engineer Interview Questions 2026

> Based on [Intellipaat's video](https://www.youtube.com/watch?v=N-MbyH7EhoQ) — "Top 30 Data Engineer Interview Questions 2026"

---

## Table of Contents

1. [What is Data Engineering?](#1-what-is-data-engineering)
2. [Define Data Modeling](#2-define-data-modeling)
3. [What are the design schemas used in Data Modeling?](#3-what-are-the-design-schemas-used-in-data-modeling)
4. [Structured vs Unstructured Data](#4-structured-vs-unstructured-data)
5. [What is Hadoop?](#5-what-is-hadoop)
6. [Important Components of Hadoop](#6-important-components-of-hadoop)
7. [What is a NameNode in HDFS?](#7-what-is-a-namenode-in-hdfs)
8. [What is Hadoop Streaming?](#8-what-is-hadoop-streaming)
9. [Important Features of Hadoop](#9-important-features-of-hadoop)
10. [The Four Vs of Big Data](#10-the-four-vs-of-big-data)
11. [What is Block and Block Scanner in HDFS?](#11-what-is-block-and-block-scanner-in-hdfs)
12. [How does a Block Scanner handle corrupted files?](#12-how-does-a-block-scanner-handle-corrupted-files)
13. [How does NameNode communicate with DataNode?](#13-how-does-namenode-communicate-with-datanode)
14. [What is COSHH?](#14-what-is-coshh)
15. [What is Star Schema?](#15-what-is-star-schema)
16. [What is Snowflake Schema?](#16-what-is-snowflake-schema)
17. [Star Schema vs Snowflake Schema](#17-star-schema-vs-snowflake-schema)
18. [What is Big Data?](#18-what-is-big-data)
19. [Why do Data Engineers need SQL?](#19-why-do-data-engineers-need-sql)
20. [What is a Data Lake?](#20-what-is-a-data-lake)
21. [How does Cloud Computing help Data Engineering?](#21-how-does-cloud-computing-help-data-engineering)
22. [What is Data Profiling?](#22-what-is-data-profiling)
23. [Why use Data Warehouses?](#23-why-use-data-warehouses)
24. [What is Data Redundancy?](#24-what-is-data-redundancy)
25. [XML Configuration Files in Hadoop](#25-xml-configuration-files-in-hadoop)
26. [What is FSCK?](#26-what-is-fsck)
27. [What is ETL?](#27-what-is-etl)
28. [Data Warehouse vs Data Lake](#28-data-warehouse-vs-data-lake)
29. [Primary Key and Foreign Key](#29-primary-key-and-foreign-key)
30. [What is the CAP Theorem?](#30-what-is-the-cap-theorem)

---

## 1. What is Data Engineering?

Data Engineering is the process of converting raw data into useful, actionable information. It involves collecting, processing, and managing data to make it available for analysis and decision-making.

**Key responsibilities:**
- Building and maintaining data pipelines
- Designing data architectures
- Ensuring data quality and reliability
- Making data accessible for analysts and data scientists

---

## 2. Define Data Modeling

Data modeling is the process of creating a simplified visual representation of complex data structures. It breaks down complex software designs into simple diagrams that show:

- Data objects and their relationships
- Rules governing the data
- How data flows through the system

**Benefits:** Clearer communication, better design decisions, easier maintenance.

---

## 3. What are the design schemas used in Data Modeling?

Two primary schemas:

| Schema | Description |
|--------|-------------|
| **Star Schema** | Fact table at center, dimension tables radiating outward (like a star) |
| **Snowflake Schema** | Extension of star schema with normalized dimension tables |

---

## 4. Structured vs Unstructured Data

| Parameter | Structured Data | Unstructured Data |
|-----------|-----------------|-------------------|
| **Storage** | Relational databases (DBMS) | File systems, data lakes |
| **Format** | Rows and columns | Images, videos, text, emails |
| **Schema** | Fixed schema (schema-on-write) | Flexible/no schema (schema-on-read) |
| **Querying** | SQL | Requires processing before querying |
| **Examples** | CSV, Excel, SQL tables | PDFs, videos, social media posts |

---

## 5. What is Hadoop?

Hadoop is an open-source framework for distributed storage and processing of large datasets across clusters of computers.

**Key characteristics:**
- Handles petabytes of data
- Scales horizontally (add more nodes)
- Fault-tolerant (data replication)
- Cost-effective (runs on commodity hardware)

---

## 6. Important Components of Hadoop

| Component | Purpose |
|-----------|---------|
| **HDFS** (Hadoop Distributed File System) | Stores data across clusters |
| **MapReduce** | Processes data in parallel |
| **YARN** (Yet Another Resource Negotiator) | Manages resources and job scheduling |
| **Hadoop Common** | Libraries and utilities used by other components |

---

## 7. What is a NameNode in HDFS?

The NameNode is the master node in HDFS that manages the file system namespace.

**Responsibilities:**
- Stores metadata about files and directories
- Tracks which DataNodes store which blocks
- Does NOT store actual data (that's in DataNodes)
- Maintains the directory tree of all files

---

## 8. What is Hadoop Streaming?

Hadoop Streaming is a utility that allows you to create MapReduce jobs using any executable or script as the mapper and reducer.

**Use cases:**
- Write mappers/reducers in Python, Perl, Bash, etc.
- Quick prototyping without Java
- Integrating non-Java tools into Hadoop pipelines

---

## 9. Important Features of Hadoop

1. **Open-source** — free to use and modify
2. **Distributed computing** — processes data across clusters
3. **Parallel processing** — faster data processing
4. **Fault-tolerant** — automatic data replication
5. **Scalable** — add nodes as data grows
6. **Cost-effective** — runs on commodity hardware

---

## 10. The Four Vs of Big Data

| V | Meaning | Description |
|---|---------|-------------|
| **Volume** | Amount of data | Terabytes to petabytes |
| **Variety** | Types of data | Structured, semi-structured, unstructured |
| **Velocity** | Speed of data | Real-time streaming vs batch |
| **Veracity** | Quality/trustworthiness | Accuracy and reliability of data |

---

## 11. What is Block and Block Scanner in HDFS?

**Block:** The smallest unit of data storage in HDFS. Large files are split into fixed-size blocks (default 128MB) for distribution across nodes.

**Block Scanner:** A background process that verifies blocks stored on DataNodes are not corrupted.

---

## 12. How does a Block Scanner handle corrupted files?

1. Block Scanner detects a corrupted block
2. DataNode reports the corruption to NameNode
3. NameNode creates replicas from healthy copies
4. If replicas match the expected replication factor, the corrupted block is removed
5. Data integrity is maintained through replication

---

## 13. How does NameNode communicate with DataNode?

Two primary communication mechanisms:

| Message Type | Purpose |
|--------------|---------|
| **Block Reports** | DataNode tells NameNode which blocks it stores |
| **Heartbeats** | DataNode confirms it's alive and healthy |

If heartbeats stop, NameNode assumes the DataNode is down and triggers replication.

---

## 14. What is COSHH?

**COSHH** = Classification and Optimization-based Scheduling for Heterogeneous Hadoop systems

It provides scheduling at both cluster and application levels to optimize job completion time in heterogeneous Hadoop environments.

---

## 15. What is Star Schema?

Star schema is a data warehousing design where:

- A central **fact table** contains measurable data (sales, revenue)
- **Dimension tables** radiate outward (product, time, location)
- Resembles a star shape

**Advantages:** Simple queries, fast cube processing, intuitive design.

---

## 16. What is Snowflake Schema?

Snowflake schema is an extension of star schema where dimension tables are **normalized** into multiple related tables.

**Example:** Product dimension → Product → Category → Department

**Advantages:** Reduced data redundancy, saves storage space.

---

## 17. Star Schema vs Snowflake Schema

| Feature | Star Schema | Snowflake Schema |
|---------|-------------|------------------|
| **Structure** | Denormalized dimensions | Normalized dimensions |
| **Complexity** | Simple | More complex |
| **Query Performance** | Faster (fewer joins) | Slower (more joins) |
| **Storage** | More redundancy | Less redundancy |
| **Maintenance** | Easier | Harder |
| **Use Case** | Read-heavy analytics | Storage-constrained environments |

---

## 18. What is Big Data?

Big Data refers to datasets that are too large or complex for traditional data processing tools.

**Characteristics:**
- Volume: TB to PB scale
- Variety: Multiple data formats
- Velocity: High-speed ingestion
- Veracity: Data quality challenges

---

## 19. Why do Data Engineers need SQL?

SQL is essential because:

1. **Data extraction** — pulling data from source systems
2. **Data transformation** — cleaning, aggregating, joining
3. **Data loading** — writing to warehouses/lakes
4. **Querying** — ad-hoc analysis and reporting
5. **Pipeline development** — most ETL/ELT tools use SQL
6. **Universal** — works across all major databases

---

## 20. What is a Data Lake?

A Data Lake is a centralized repository that stores vast amounts of raw data in its native format.

| Feature | Description |
|---------|-------------|
| **Storage** | Structured, semi-structured, unstructured |
| **Schema** | Schema-on-read (flexible) |
| **Cost** | Cheaper than warehouses |
| **Use case** | Data exploration, ML training, archiving |

---

## 21. How does Cloud Computing help Data Engineering?

- **Scalability** — elastic compute and storage
- **Managed services** — reduce operational overhead
- **Cost efficiency** — pay only for what you use
- **Global reach** — deploy anywhere
- **Integration** — native connectors to analytics tools

**Major platforms:** AWS (S3, Redshift, Glue), GCP (BigQuery, Dataflow), Azure (Synapse, Data Factory)

---

## 22. What is Data Profiling?

Data profiling is the process of examining data to understand:

- **Structure** — columns, types, relationships
- **Content** — value distributions, patterns
- **Quality** — missing values, outliers, inconsistencies

**Purpose:** Identify data issues before they reach production pipelines.

---

## 23. Why use Data Warehouses?

Data warehouses provide:

1. **Centralized data** — single source of truth
2. **Historical analysis** — time-series reporting
3. **Performance** — optimized for complex queries
4. **Consistency** — schema enforcement
5. **BI integration** — connects to Tableau, Power BI, etc.

---

## 24. What is Data Redundancy?

Data redundancy occurs when the same data exists in multiple places.

**Problems:**
- Inconsistent data across systems
- Wasted storage
- Update anomalies

**Solutions:**
- Normalization
- Master Data Management (MDM)
- Deduplication processes

---

## 25. XML Configuration Files in Hadoop

| File | Purpose |
|------|---------|
| **core-site.xml** | General Hadoop settings (default filesystem, I/O) |
| **hdfs-site.xml** | HDFS configuration (replication factor, block size) |
| **mapred-site.xml** | MapReduce settings |
| **yarn-site.xml** | YARN resource management settings |

---

## 26. What is FSCK?

**FSCK** = File System Check

A command-line tool used to check the health of HDFS. It:

- Verifies block integrity
- Reports missing or corrupted blocks
- Checks replication factor compliance

**Usage:** `hdfs fsck /path/to/check`

---

## 27. What is ETL?

**ETL** = Extract, Transform, Load

| Stage | Description |
|-------|-------------|
| **Extract** | Pull data from source systems (databases, APIs, files) |
| **Transform** | Clean, aggregate, join, convert formats |
| **Load** | Write to target system (warehouse, lake) |

**Why it matters:** ETL makes raw data usable for analysis and reporting.

**Modern alternative:** ELT (Extract, Load, Transform) — load raw data first, transform in the warehouse.

---

## 28. Data Warehouse vs Data Lake

| Feature | Data Warehouse | Data Lake |
|---------|---------------|-----------|
| **Data type** | Structured only | All types |
| **Schema** | Schema-on-write | Schema-on-read |
| **Purpose** | Analytics & reporting | Storage & exploration |
| **Cost** | Higher | Lower |
| **Users** | Analysts, BI tools | Data scientists, engineers |
| **Processing** | SQL-based | Spark, Presto, etc. |

---

## 29. Primary Key and Foreign Key

**Primary Key:** A column (or set of columns) that uniquely identifies each row in a table. Cannot contain NULL values.

**Foreign Key:** A column in one table that references the primary key of another table. Establishes relationships between tables.

**Example:**
```
customers (customer_id PRIMARY KEY)
orders (order_id PRIMARY KEY, customer_id FOREIGN KEY → customers)
```

---

## 30. What is the CAP Theorem?

The CAP theorem states that a distributed system can only guarantee **two out of three** properties simultaneously:

| Property | Definition |
|----------|------------|
| **C**onsistency | Every read receives the most recent write |
| **A**vailability | Every request receives a response |
| **P**artition Tolerance | System continues despite network failures |

**Trade-offs:**
- **CP systems:** Consistent but may reject requests during partitions (e.g., HBase, MongoDB)
- **AP systems:** Available but may return stale data (e.g., Cassandra, DynamoDB)

---

## Quick Reference Cheat Sheet

| Topic | Key Point |
|-------|-----------|
| ETL | Extract → Transform → Load |
| Data Lake | Raw data, any format, cheap storage |
| Data Warehouse | Structured data, optimized for queries |
| Star Schema | Fact + denormalized dimensions |
| Snowflake Schema | Fact + normalized dimensions |
| HDFS Block | Default 128MB |
| NameNode | Metadata manager (no actual data storage) |
| CAP Theorem | Consistency, Availability, Partition tolerance — pick 2 |
| Data Profiling | Understanding data quality before processing |
| Data Lineage | Tracking data from source to destination |

---

*Source: [Intellipaat — Top 30 Data Engineer Interview Questions 2026](https://www.youtube.com/watch?v=N-MbyH7EhoQ)*
