# DBT Learning Guide

---

## What Is dbt and Why Does It Matter

dbt (data build tool) is a transformation framework that lets data analysts and engineers write data transformations as SQL SELECT statements and handles everything else — running them in the right order, testing data quality, generating documentation, and creating a lineage graph showing how data flows.

In simple terms: instead of writing raw SQL scripts that nobody can maintain, dbt makes those transformations modular, testable, version-controlled, and documented.

---

## Why Canadian Companies Are Asking for It

dbt has become the dominant transformation tool in the modern data stack. In Canada specifically:

- It appears in the majority of data engineering and analytics engineering job postings at Canadian tech companies in 2026
- Companies that have moved to Snowflake or BigQuery almost universally use dbt on top of it
- Shopify, Lightspeed Commerce, D2L, Coveo, and dozens of Canadian scale-ups list it as required or preferred
- Canadian banks are beginning to adopt it as they modernize their data infrastructure

If you know SQL but not dbt, you know the language but not the workflow that most Canadian data teams use day to day.

---

## dbt vs Raw SQL — Why the Difference Matters

| Raw SQL Scripts | dbt Models |
| --- | --- |
| Hard to maintain | Modular and reusable |
| No testing built in | Built-in data quality tests |
| No documentation | Auto-generated docs and lineage |
| Run manually | Scheduled and orchestrated |
| Version control is manual | Native Git integration |
| Hard to onboard new team members | Self-documenting |

When a Canadian company says they want someone who knows dbt, they are saying they want someone who understands production-grade data transformation — not just SQL.

---

## The Two Types of dbt

dbt Core — open source, runs locally or on any server. Free forever.

dbt Cloud — managed platform with a web IDE, scheduler, and CI/CD. Free tier available for individual developers at [cloud.getdbt.com](http://cloud.getdbt.com).

For learning, start with dbt Cloud free tier. No local setup, runs in the browser, connects directly to BigQuery or Snowflake.

---

## How to Learn dbt (Free, Step by Step)

### Step 1 — Prerequisites (if you do not have them already)

Before learning dbt you need:

- Comfortable with SQL (SELECT, JOIN, GROUP BY, CTEs, window functions)
- Basic understanding of what a data warehouse is (Snowflake or BigQuery)
- A free Google Cloud account for BigQuery or a free Snowflake trial

### Step 2 — dbt Fundamentals Course (5 hours, completely free)

Go to [courses.getdbt.com](http://courses.getdbt.com). The Fundamentals course covers:

- What dbt is and how it fits in the modern data stack
- Building your first dbt project
- Writing dbt models (SQL SELECT statements as .sql files)
- Testing your data with dbt tests
- Documenting your models
- Running dbt in the cloud

This course alone is enough to put dbt on your resume honestly.

Link: [courses.getdbt.com/courses/fundamentals](http://courses.getdbt.com/courses/fundamentals)

### Step 3 — Build Your First dbt Project

After the course, build a real project:

1. Connect dbt Cloud free tier to BigQuery (free public datasets available)
2. Pick a public dataset (Google Analytics ecommerce data works well)
3. Create 3 to 5 dbt models that transform raw data into clean analytical tables
4. Add tests (not_null, unique, accepted_values)
5. Write descriptions for each model in the schema.yml file
6. Generate and view the documentation
7. Push the project to GitHub

This project on GitHub plus the dbt Fundamentals certificate is enough to credibly list dbt on your resume.

### Step 4 — Advanced dbt (optional, for analytics engineering roles)

If you want to target analytics engineering roles specifically:

- dbt Advanced course at [courses.getdbt.com](http://courses.getdbt.com) (free)
- Learn incremental models (how to process only new data efficiently)
- Learn dbt macros (Jinja templating for reusable SQL logic)
- Learn dbt packages (pre-built models from the dbt Hub)
- Learn dbt Cloud CI/CD (auto-testing on pull requests)

---

## Canadian Roles That List dbt

| Role | How dbt Is Used |
| --- | --- |
| Analytics Engineer | Primary tool — this role is built around dbt |
| Data Engineer | Used for transformation layer in the pipeline |
| Senior Data Analyst | Used to build and maintain reporting models |
| BI Developer | Used alongside Looker or Tableau |

---

## How to List dbt on Your Resume

Do not just list dbt as a skill. Show it in context.

Bad: Skills: SQL, Python, dbt

Good bullet point: Built and maintained dbt models on BigQuery to transform raw event data into clean analytical tables, reducing report generation time by 4 hours per week.

If you built a project: Created a dbt project with 6 models, 12 data quality tests, and auto-generated documentation on BigQuery public data. Available on GitHub.

---

## Free Resources Summary

dbt Fundamentals course (free) — [courses.getdbt.com/courses/fundamentals](http://courses.getdbt.com/courses/fundamentals)

dbt Cloud free tier — [cloud.getdbt.com](http://cloud.getdbt.com)

dbt documentation — [docs.getdbt.com](http://docs.getdbt.com)

dbt Discourse community — [discourse.getdbt.com](http://discourse.getdbt.com) (ask questions, get answers from practitioners)

BigQuery free tier (1TB/month) — [console.cloud.google.com/bigquery](http://console.cloud.google.com/bigquery)

Snowflake free trial (30 days) — [snowflake.com/en/data-cloud/free-trial](http://snowflake.com/en/data-cloud/free-trial)

---

### Want to Build Real Analytics Projects?

ORU's **Hands-On Data Analytics** course teaches you to think like a practitioner and execute like one — through realistic business problems across insurance, banking, fintech, and ecommerce. Tools covered include Python, SQL, BigQuery, dbt Core, Tableau, Power BI, Streamlit, and Vanna AI.

Use code **ORU10** for 10% off → [Enroll Now](https://joinoru.com/course/hands-on-data-analytics:-learn-by-building-industry-projects)

*For mentorship, live sessions, and community support: [joinoru.com](https://joinoru.com)*
