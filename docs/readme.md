![image](https://github.com/user-attachments/assets/ef9557b9-4bbf-4906-84c9-5ace297b9847)# 🏗️ Data Warehouse Project

Thanks to **Data with Baara** for the wonderful course, which helped me understand the foundational and advanced concepts of Data Warehousing in SQL.  
This project implements a layered architecture using the **Medallion Architecture**: **Bronze → Silver → Gold**, enabling efficient, clean, and business-ready data.

---
Snippets
1. The schemas gold,silver , bronze will be shown after schema creation
   ![image](https://github.com/user-attachments/assets/84f3fb19-ce0d-4096-91b7-426b5bc8a617)
2. After the bronze and silver  we wil et 6 tables for each of the bronze and silver, where bronze is the raw table and silver contains the cleaned one
![image](https://github.com/user-attachments/assets/9e34c0af-31fd-4ae4-aef5-0432e7d278ed)

3. the final is the view, since its the golden layer, we make sure the data cant be manipulated directly, hence its on view
![image](https://github.com/user-attachments/assets/df6653a6-3531-42e9-9d28-126f304e1a15)

## 🧠 Key Learnings & Personal Notes

### 📚 Medallion Architecture

- **Bronze Layer**: Raw data ingestion from source systems.
- **Silver Layer**: Data cleaning, transformation, deduplication, standardization.
- **Gold Layer**: Business-level aggregations, reporting tables, and dashboards.

### 🧩 Best Practices & Observations

1. Use **Excel** or similar tools first to understand data problems before writing SQL.
2. When changing schema (adding/removing columns), **update table creation scripts** accordingly.
3. Use **bulk updates** from source files to improve performance.
4. Use **`GO`** to separate batch commands in SQL scripts.
5. Create **stored procedures** for repetitive tasks and modularization.
6. Use **`TRY...CATCH`** and **`GETDATE()`** for error logging and debugging.
7. Ensure **data standardization** (e.g., "M" → "Male") and **naming conventions**.
8. Validate data logic — if things don’t add up, **consult data experts**.
9. Familiarize with key SQL functions: `NULLIF`, `ABS()`, `DECLARE`, `CASE`, etc.
10. Use **nested CASE statements** or **CTEs** for better transformation logic.
11. Perform **data quality checks** frequently to ensure trust in the pipeline.
12. Design **Star or Snowflake Schema** as per need, ensure **dimension tables** are joined with **foreign key integrity** checks.
13. Use **ER Diagrams** to decide schema and relationships between tables.
14. Use **Views** only in the **Gold Layer** for final reporting.
15. Maintain a **consistent naming convention** for columns and tables.
16. Use **lookup columns** in fact tables to connect them to dimension tables (foreign keys).

---

## ⚙️ Tech Stack

- **Database:** Microsoft SQL Server / PostgreSQL / Redshift
- **ETL Tools:** Manual SQL / Python Scripts / SSIS (optional)
- **Data Modeling:** Star Schema, Snowflake Schema
- **Tools Used:** Excel, DBMS, SQL Management Studio / DBeaver

---

## 🏛️ Project Structure

```plaintext
├── Bronze Layer       # Raw data from source systems
├── Silver Layer       # Cleaned and transformed data
├── Gold Layer         # Final, analytics-ready data
└── Scripts & Views    # Stored procedures, views, error logs, CTEs
```

## Checkout my medium post of the same

https://medium.com/@jeevaj3v12/wrapping-ingestion-in-procedures-6093582c23f5
