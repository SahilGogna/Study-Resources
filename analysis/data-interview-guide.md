# Data Interview Guide (Resource Doc)

---

## Why This Guide Exists

- Data roles are among the most hired tech positions in Canada
- RBC, TD, Scotiabank, Shopify, Telus, CGI — all interview in a similar pattern
- Most candidates fail not because of skill gaps but because of preparation gaps
- This guide covers every category that comes up in 85%+ of Canadian data interviews

---

## Part 1 — SQL

### Must-Know Concepts

- JOINs: INNER, LEFT, RIGHT, FULL OUTER
- GROUP BY with HAVING
- Subqueries and CTEs (WITH clause)
- Window functions: ROW_NUMBER, RANK, DENSE_RANK, LAG, LEAD, NTILE
- CASE WHEN statements
- Date functions (especially in PostgreSQL and SQL Server)

> 📖 **Detailed SQL Guide:** [sql.md](https://github.com/SahilGogna/Study-Resources/blob/main/analysis/sql.md)

### Top SQL Questions Asked in Canadian Interviews

1. Find the second highest salary in an employee table
2. Get the top 3 products by revenue per region
3. Calculate month-over-month growth using LAG
4. Find customers who made a purchase in January but not February
5. Write a query to detect duplicate records
6. Get the running total of sales by date
7. Find employees who earn more than their manager
8. Return every department's average salary vs company average
9. Find the most recent transaction per customer
10. Identify users who logged in on 3 consecutive days

> 📄 **Practice these:** [SQL 75 Top Questions](https://github.com/SahilGogna/Study-Resources/blob/main/analysis/sql-75-questions.md)

### SQL Case Study Framework

Canadian bank and consulting interviews often give a business scenario:

1. Understand the business question (ask clarifying questions)
2. Identify the tables and relationships involved
3. Write step-by-step using CTEs for readability
4. Validate your logic out loud
5. Discuss edge cases (NULLs, duplicates, date boundaries)

---

## Part 2 — Python for Data Roles

### Must-Know Libraries

- **Pandas**: DataFrames, groupby, merge, pivot, apply, fillna, dropna
- **NumPy**: Array operations, statistical functions
- **Matplotlib / Seaborn**: Basic plotting for EDA

### Top Python Questions Asked

1. Clean a dataset with missing values and duplicates
2. Calculate rolling averages using Pandas
3. Merge two DataFrames on a common key
4. Filter rows where a column value meets a condition
5. Convert wide format to long format (melt)
6. Group sales by month and calculate totals
7. Identify outliers using IQR method
8. Write a function to normalize a column between 0 and 1
9. Parse dates and extract month/year/weekday
10. Find top 5 customers by total spend

---

## Part 3 — Statistics and Probability

### Core Concepts

- Mean, median, mode, variance, standard deviation
- Normal distribution, skewness, kurtosis
- Probability basics: conditional probability, Bayes theorem (conceptual)
- Hypothesis testing: null vs alternative hypothesis, p-value, Type I/II errors
- Confidence intervals
- Correlation vs causation
- A/B testing framework

### Common Interview Questions

1. Explain p-value in simple terms
2. What is the difference between Type I and Type II errors?
3. How would you design an A/B test for a new feature?
4. When would you use median instead of mean?
5. Explain the Central Limit Theorem
6. What is overfitting and how do you prevent it?
7. How do you handle class imbalance in a dataset?

---

## Part 4 — Business Case Studies

This is the most underrated part of Canadian data interviews. Companies give you a dataset or scenario and ask you to derive insights.

### Framework to Use

1. **Clarify** — What is the business goal? What decision does this data inform?
2. **Explore** — What does the data look like? Any anomalies, missing values, trends?
3. **Analyze** — What metrics matter? What comparisons are meaningful?
4. **Recommend** — What action should the business take based on the data?
5. **Caveat** — What are the limitations of this analysis?

### Common Case Study Topics in Canada

- Customer churn analysis for a telecom (Bell, Rogers, Telus type scenarios)
- Sales performance by region for a retail chain
- Website funnel drop-off analysis
- Employee attrition prediction
- Credit risk scoring (very common in bank interviews)

---

## Part 5 — Behavioral Questions (STAR Method)

Canadian companies weight behavioral interviews heavily. Use the STAR method: **Situation, Task, Action, Result**.

### Top Behavioral Questions for Data Roles

1. Tell me about a time you worked with a difficult stakeholder
2. Describe a project where you had incomplete or messy data
3. Tell me about a time you had to explain a complex finding to a non-technical audience
4. Give an example of when you identified a business problem using data
5. Describe a time you made a mistake in your analysis and how you handled it
6. Tell me about a time you worked under a tight deadline
7. How do you prioritize when you have multiple projects?

---

## Part 6 — Canadian Companies and Their Interview Styles

| Company | Style | Focus Areas |
| --- | --- | --- |
| RBC / TD / Scotiabank | Multi-round, SQL-heavy | SQL, Excel, business case, behavioral |
| Shopify | Technical + product thinking | Python, metrics, experimentation |
| Telus / Bell / Rogers | Structured case interviews | SQL, dashboards, reporting |
| CGI Group | Competency-based | Behavioral, tools (SQL, Python, Tableau) |
| Deloitte / KPMG Analytics | Case + technical | Statistics, visualization, case study |
| Amazon Canada | Bar raiser format | SQL, Python, behavioral (leadership principles) |

---

## Part 7 — Tools and Software to Know

| Tool | Priority | Used By |
| --- | --- | --- |
| SQL (PostgreSQL, SQL Server) | Must-have | Almost every company |
| Excel / Google Sheets | Must-have | All companies |
| Python (Pandas, NumPy) | High | Tech companies, banks |
| Tableau / Power BI | High | Reporting-heavy roles |
| Looker / Metabase | Medium | Startups and scale-ups |
| Spark / Databricks | Advanced | Data engineering-adjacent roles |

---

## Free Practice Resources

- [LeetCode Database problems](https://leetcode.com/problemset/database/) — SQL practice
- [StrataScratch](https://www.stratascratch.com) — real company SQL and Python interview questions
- [HackerRank SQL](https://www.hackerrank.com/domains/sql) — structured SQL practice
- [Kaggle](https://www.kaggle.com) — free datasets for Python practice
- [Mode Analytics SQL Tutorial](https://mode.com/sql-tutorial/) — free, beginner to advanced

---

### Want to Build Real Analytics Projects?

ORU's **Hands-On Data Analytics** course teaches you to think like a practitioner and execute like one — through realistic business problems across insurance, banking, fintech, and ecommerce. Tools covered include Python, SQL, BigQuery, dbt Core, Tableau, Power BI, Streamlit, and Vanna AI.

Use code **ORU10** for 10% off → [Enroll Now](https://joinoru.com/course/hands-on-data-analytics:-learn-by-building-industry-projects)

*For mentorship, live sessions, and community support: [joinoru.com](https://joinoru.com)*
