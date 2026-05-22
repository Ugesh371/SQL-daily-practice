# 📊 SQL Daily Practice Assessment Portfolio

Welcome to my **SQL Daily Practice Assessment** repository! This project serves as a structured, day-by-day technical log showcasing my journey from core data definition frameworks to advanced business intelligence reporting and performance analytics.

The objective of this challenge is to build muscle memory for relational database design, query optimization, data auditing, and complex analytical workflows.

---

## 🚀 Interactive Challenge Dashboard

| Day | Business Domain / Core Focus | Key Functions & Concepts Demonstrated | Status | View Solution |
| :---: | :--- | :--- | :---: | :---: |
| **01** | 🏥 Hospital Database Management | Schema Creation, Column Alterations (`ALTER`, `MODIFY`), Database Cleanup | 🟢 Complete | [Day 01 Code](./Day_01_Hospital_DDL/solution.sql) |
| **02** | 📚 Bookstore Inventory & Orders | Integrity Constraints (`PRIMARY KEY`, `FOREIGN KEY`, `CHECK`, `UNIQUE`), Data Manipulation | 🟢 Complete | [Day 02_BookstoreConstraints](./Day_02_BookstoreConstraints/solution.sql) |
| **03** | 🛒 E-Commerce Product Discovery | Conditional Filtering (`LIKE`, `IN`, `BETWEEN`, Logical & Arithmetic Operators) | 🟢 Complete | [Day 03 Code](./Day_03_ECommerce_Operators/solution.sql) |
| **04** | 📈 E-Commerce Sales Performance | Aggregations (`SUM`, `AVG`, `COUNT`), `GROUP BY`, `HAVING`, Analytical `RANK() OVER` | 🟢 Complete | [Day 04 Code](./Day_04_ECommerce_Analytics/solution.sql) |
| **05** | 🎓 Student Enrollment Metrics | Multi-Table Joins (`INNER`, `LEFT`, `RIGHT`), Text Processing, Advanced Date Math | 🟢 Complete | [Day 05 Code](./Day_05_School_Joins_BuiltIn/solution.sql) |
| **06** | 🏢 HR & Enterprise Operations | Advanced Subqueries (Scalar, Multi-row `ANY`/`ALL`, Correlated `EXISTS`/`NOT EXISTS`) | 🟢 Complete | [Day 06 Code](./Day_06_Company_Subqueries/solution.sql) |
| **07** | 📊 Company Corporate Dashboard | Executive Data Audit, Deduplication Patterns, Performance Rankings, Regional ROI | 🟢 Complete | [Day 07 Code](./Day_07_Company_Final_Review/solution.sql) |

---

## 🛠️ Tech Stack & Skills Highlighted

* **Database Dialects:** Optimized for Standard SQL / MySQL ecosystems.
* **Database Design:** Relational Engineering, Key Constraints, Referential Integrity enforcement.
* **Data Cleansing:** Handling missing data (`IS NULL`), handling duplicate records, string parsing.
* **Business Intelligence:** Advanced Window Functions, Multi-layered Joins, and Correlated subqueries.

---

## 💡 Key Conceptual Showcases

### 1. Correlated Subqueries (Day 6)
Unlike decoupled nested queries, the correlated subqueries implemented in Day 6 process dynamically row-by-row, evaluating values from the outer query against contextual criteria:
```sql
SELECT * FROM Employees e 
WHERE salary > (SELECT AVG(salary) FROM Employees WHERE dept_id = e.dept_id);
