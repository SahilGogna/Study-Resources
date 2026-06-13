# Data Analyst Tool Depth — Full Breakdown Doc

---

# How Much SQL, Python, Power BI, and dbt is Actually Required for Data Analyst Roles in Canada?

Most data analyst aspirants in Canada spend 12 to 18 extra months on prep because they have no clue how deep to go into each tool. They learn too much of the wrong things and not enough of the right ones.

Here is the truth.

For data analyst roles in Canada, you do not need to be an expert in every tool. You need to be deep in one (SQL), competent in two (Python, Power BI), and just functional in one (dbt). Get that distribution right and you will outcompete 80% of applicants without learning a single extra concept.

This doc breaks down the exact depth required, what to skip, free resources, and what Canadian companies actually test in interviews.

---

# Tool 1: SQL — Intermediate to Advanced (No Compromise)

SQL is the only tool where you cannot shortcut. Every single DA interview at a Canadian company (RBC, TD, Shopify, Lightspeed, D2L, Wealthsimple) will include a SQL round, and it is the most common filter that knocks out unprepared candidates.

## What You Need to Know Cold

- **Basic queries:** SELECT, WHERE, ORDER BY, LIMIT
- **All JOIN types:** INNER, LEFT, RIGHT, FULL OUTER, SELF JOIN
- **Aggregations:** GROUP BY, HAVING, with COUNT, SUM, AVG, MAX, MIN, DISTINCT
- **Subqueries:** Both correlated and non-correlated
- **CTEs (Common Table Expressions):** WITH clauses for clean, readable queries
- **Window functions:** ROW_NUMBER, RANK, DENSE_RANK, LAG, LEAD, SUM OVER, running totals
- **CASE statements** inside SELECT and aggregations
- **Date and string manipulation:** DATE_TRUNC, EXTRACT, CONCAT, SUBSTRING
- **Performance basics:** understanding indexes, why a query is slow, when to use a CTE vs subquery

## Canadian Interview Reality

At RBC, TD, and Scotiabank, the SQL round typically has 3 to 5 problems of increasing difficulty. The last 2 problems almost always require window functions and CTEs. If you cannot write a query for "second-highest salary by department" using window functions cleanly, you will not pass the technical round.

At Shopify and Lightspeed, SQL is tested in a take-home or live coding round on real-looking schemas. They specifically watch for clean, readable SQL with proper CTE structure.

## What to Skip

- Stored procedures and triggers (DBA territory, not DA)
- Database administration concepts
- SQL Server vs PostgreSQL vs MySQL syntax differences beyond the basics

## Free Resources

- **DataLemur** (free SQL interview questions, Canadian companies' question patterns)
- **Mode Analytics SQL Tutorial** (free, deep, hands-on)
- **LeetCode SQL 50** (free problem set)
- **PostgreSQL Tutorial** ([postgresqltutorial.com](http://postgresqltutorial.com), free reference)

---

# Tool 2: Python — Basic to Intermediate

Python for DA roles needs to be functional, not impressive. Most candidates either skip Python entirely (and lose out on better-paying roles) or go way too deep into machine learning (and waste 6 months).

## What You Need to Know

- **pandas:** DataFrames, reading CSV/Excel/SQL, filter, groupby, merge, concat
- **Basic data cleaning:** handling nulls, type conversion, deduplication
- **matplotlib and seaborn:** basic plotting for exploratory data analysis
- **numpy basics:** arrays, vectorized operations
- **Functions:** writing reusable functions with parameters and return values
- **Loops and conditional logic** in real workflows
- **Reading from APIs** using the requests library (Level 2 differentiator)
- **Basic scripting:** turning a notebook into a .py file

## Canadian Interview Reality

At RBC, TD, and most Canadian banks, Python is tested via a take-home: load a CSV, clean it, produce summary statistics, create a visualization. They are not looking for fancy code, just clean and readable.

At Shopify, Lightspeed, and D2L, Python is expected at a slightly higher level. They might ask you to write a function during the technical interview that processes some data and returns a transformed DataFrame.

## What to Skip

- Machine Learning libraries (scikit-learn, TensorFlow, PyTorch). These are for Data Scientist roles.
- Deep Object-Oriented Programming with inheritance hierarchies.
- Web frameworks (Django, Flask).
- LeetCode-style algorithm and data structure questions in Python. Canadian DA interviews almost never test these.

## Free Resources

- **Kaggle Pandas Course** (free, 4 hours, hands-on)
- **Real Python: pandas tutorials**
- **Automate the Boring Stuff with Python** (free online book)

---

# Tool 3: Power BI — Intermediate (or Tableau)

For DA roles, Power BI needs to go beyond chart-building. The interview filter happens at the DAX level, not at the visualization level.

## What You Need to Know

- **Connecting to data:** Excel, CSV, SQL Server, basic Power Query cleaning
- **Building core visuals:** bar, line, card, matrix, slicers, drill-through
- **DAX fundamentals:** calculated columns vs measures and when to use each
- **Key DAX functions:** SUM, COUNTROWS, DISTINCTCOUNT, CALCULATE, SUMX, FILTER
- **Time intelligence:** DATEYTD, SAMEPERIODLASTYEAR, DATEADD
- **Basic data modeling:** facts vs dimensions, one-to-many relationships
- **Building a date dimension table** (separates Level 1 from Level 2 candidates)
- **Power BI Service basics:** publishing, scheduled refresh

## Canadian Interview Reality

At D2L, Lightspeed, OpenText, and BI-heavy roles at Canadian banks, the most common interview question is "calculate year-over-year growth as a measure using DAX." If you stumble on that, the interview ends.

At Telus, Bell, and Loblaw, Power BI is more functional. They want you to be able to build a working dashboard for a stakeholder without supervision.

Tableau is more common at Shopify, Hootsuite, and Wealthsimple. If you have one of these target companies on your list, learn Tableau instead of Power BI.

## What to Skip (Until You Have the Role)

- Power BI Embedded for developers
- Paginated Reports
- AI Visuals (Q&A, Key Influencers) beyond surface awareness
- Custom themes and design tokens
- Power Automate integration unless the JD calls for it

## Free Resources

- **Microsoft Learn: Power BI Fundamentals** (free, official, hands-on)
- **SQLBI YouTube channel** (Marco Russo and Alberto Ferrari)
- **DAX Guide** ([dax.guide](http://dax.guide)) — the best DAX reference on the internet
- **Guy in a Cube YouTube channel** (Adam Saxton)

---

# Tool 4: dbt — Basic

dbt shows up in a lot of DA job descriptions in Canada now, and most candidates panic. The truth is, basic dbt knowledge is enough for entry and mid-level DA roles. If you can speak to dbt fluently, you are already in the top 20% of applicants.

## What You Need to Know

- **What dbt is and why companies use it:** the transformation layer in modern data stacks
- **Writing basic dbt models:** simple SELECT statements wrapped in dbt's SQL files
- **The ref() function and how it builds the DAG**
- **Sources and source freshness checks**
- **Built-in tests:** unique, not_null, accepted_values, relationships
- **dbt docs:** generating and reading documentation
- **Materializations:** view vs table vs incremental (just know the difference, you do not need to deploy incrementals)
- **The dbt project structure:** models, tests, macros, seeds

## Canadian Interview Reality

At Shopify, Lightspeed, Wealthsimple, Hootsuite, and most modern data teams in Canada, dbt is now part of the stack. Interviews rarely test deep dbt mechanics. They ask conceptual questions like "what is the difference between a view and a table materialization" or "how would you structure your models for a sales fact table."

At RBC, TD, and other Canadian banks, dbt is still being rolled out. Some teams use it, most do not. Mentioning dbt in your resume here is still a differentiator.

## What to Skip (For Now)

- Writing custom macros from scratch
- Managing CI/CD pipelines for dbt
- Snapshots and slowly changing dimensions in dbt (advanced)
- dbt Cloud admin features

## Free Resources

- **dbt Fundamentals** course (free on dbt Learn, official)
- **dbt Labs YouTube channel**
- **The Definitive Guide to dbt** (free intro chapters on the dbt blog)

---

# Skills Checklist by Tool

| Skill Area | SQL | Python | Power BI | dbt |
| --- | --- | --- | --- | --- |
| Required Depth for DA in Canada | Intermediate to Advanced | Basic to Intermediate | Intermediate | Basic |
| Time to Reach Required Depth | 3 to 4 months | 1 to 2 months | 1 to 2 months | 1 to 2 weeks |
| Tested in Live Interview? | Almost always | Sometimes | Sometimes | Conceptually only |
| Tested in Take-Home? | Often | Often | Often | Rarely |
| Differentiator at Senior Level? | Yes | Yes (if Level 3) | Yes (if DAX strong) | Yes (if Modern Stack) |

---

# Canadian Companies and What They Actually Expect

| Company | SQL | Python | Power BI / Tableau | dbt | Salary Range (CAD) |
| --- | --- | --- | --- | --- | --- |
| RBC, TD, Scotiabank, BMO, CIBC | Advanced | Basic to Intermediate | Power BI Intermediate | Not required | $70,000 to $95,000 |
| Shopify, Wealthsimple | Advanced | Intermediate | Tableau Intermediate | Basic | $85,000 to $115,000 |
| Lightspeed, D2L, OpenText | Advanced | Intermediate | Power BI Intermediate to Advanced | Basic | $80,000 to $105,000 |
| Hootsuite, Loblaw Digital | Intermediate to Advanced | Intermediate | Tableau Intermediate | Basic | $80,000 to $105,000 |
| Manulife, Sun Life, Canada Life | Intermediate to Advanced | Basic | Power BI Intermediate | Not required | $70,000 to $90,000 |
| Telus, Bell, Rogers | Intermediate | Basic | Power BI Intermediate | Not required | $65,000 to $85,000 |

---

# How to Assess Your Current Depth

Try this self-test. Give yourself a weekend.

## SQL Self-Test (90 minutes)

Use a public dataset (e.g. the Chinook database or any Kaggle dataset loaded into PostgreSQL). Write 5 queries:

1. Top 5 customers by total spend
2. Month-over-month revenue growth using window functions
3. Customers who purchased in 2025 but not in 2024 (using LEFT JOIN with NULL filter)
4. Running total of revenue by month
5. Second highest order value in each region

If you can do all 5 without Google: Intermediate to Advanced (you are ready)

If you needed Google for 1-2: Intermediate (close, keep practicing window functions)

If you stalled on 3 or more: Beginner (focus here exclusively for 6 to 8 weeks)

## Python Self-Test (60 minutes)

Take a CSV with 10,000 rows. Write a .py script that:

1. Loads the CSV with error handling
2. Cleans nulls and duplicates
3. Has a reusable function that groups and aggregates by a column
4. Outputs a clean summary CSV and a matplotlib chart

If you can: Intermediate (you are ready)

If you only got through step 2 cleanly: Basic (almost there)

## Power BI Self-Test (90 minutes)

Use the Contoso Sales sample dataset. Build a one-page report with:

1. Total revenue, YoY revenue growth measures
2. Revenue by product category and region with slicers
3. At least one CALCULATE measure with a filter
4. A date dimension table you built yourself

If you got through step 4 cleanly: Intermediate (you are ready)

If you stalled at step 3: Beginner to Intermediate (focus on DAX)

## dbt Self-Test (30 minutes)

Open the dbt docs. Can you answer these without Google?

1. What does the ref() function do?
2. Difference between a source and a model?
3. Difference between view, table, and incremental materializations?
4. What does dbt test do?

If yes to all 4: Basic (you are ready)

If no to any: Spend a weekend on dbt Fundamentals (free course)

---

# 90-Day Plan to Reach Required Depth Across All 4 Tools

## Days 1 to 45: SQL (the heaviest lift)

- Mode Analytics SQL Tutorial end to end
- 50 problems on DataLemur
- Build one project: a public dataset analyzed entirely in SQL with a written report
- Push the project to GitHub

## Days 46 to 60: Power BI

- Microsoft Learn Power BI Fundamentals
- Build 2 dashboards from public Canadian datasets (StatCan, City of Toronto)
- Focus heavily on DAX: rewrite all measures using CALCULATE and time intelligence

## Days 61 to 75: Python

- Kaggle Pandas Course
- Take one of your earlier projects and rewrite the data cleaning in Python
- Build one .py script with functions, error handling, and a CSV output

## Days 76 to 90: dbt

- Complete dbt Fundamentals (free)
- Take an existing SQL project and rebuild it as a dbt project on a free Snowflake or BigQuery trial
- Add tests and documentation

By Day 90, you will have a SQL project, a Power BI portfolio, a Python script, and a dbt project, all on GitHub. This is more than 90% of Canadian DA applicants have.

---

# The Single Biggest Mistake to Avoid

The mistake is treating all four tools as equally important and trying to learn them in parallel.

You will not retain anything that way.

Go deep on SQL first. It is the only tool that disqualifies you in interviews. Everything else can be picked up faster once SQL is solid, because the conceptual foundation transfers.

---

## Want to Go Deeper? ORU Hands-On Data Analytics Course

Most analytics courses teach you tools. This one teaches you how to think like a practitioner, then gives you the tools to execute. Every project is built around a realistic business problem — insurance, banking, fintech, and ecommerce. The tools span Python, SQL, BigQuery, dbt Core, Tableau, Power BI, Streamlit, and Vanna AI. Nothing is introduced for its own sake. By the final project, you are operating across a stack that reflects what senior practitioners use in production.

For analysts who are tired of concept-heavy courses with little real execution: [joinoru.com/course/hands-on-data-analytics](http://joinoru.com/course/hands-on-data-analytics)


---

*Sources: Job postings on LinkedIn and Indeed Canada (2025 to 2026), salary data from Glassdoor Canada and Robert Half Salary Guide 2026, ORU mentor interviews with hiring managers at RBC, TD, Shopify, and D2L.*