# Data Engineering vs Data Analytics

## Side by side comparison

| Dimension | Data Engineer | Data Analyst |
| --- | --- | --- |
| **Daily work** | Building data pipelines, ETL/ELT jobs, data warehouse design, monitoring pipeline health | Writing SQL queries, building dashboards, meeting with stakeholders, answering business questions |
| **Core tools** | Python, SQL, Airflow, dbt, Spark, Snowflake or Databricks, AWS/Azure | SQL, Excel, Power BI or Tableau, basic Python |
| **Nature of output** | Data infrastructure that others use | Insights, reports, and dashboards |
| **Stakeholder time** | Low. Mostly with other engineers and DAs | High. Business teams, product managers, leadership |
| **Coding depth** | High. Production-grade Python and SQL | Medium. Analytical SQL and light Python |
| **On-call responsibility** | Yes, most companies | No |
| **Canadian salary (entry to mid)** | $90,000 to $140,000 CAD | $75,000 to $105,000 CAD |
| **Canadian salary (senior)** | $140,000 to $180,000 CAD | $105,000 to $135,000 CAD |
| **Career ladder** | DE → Sr DE → Staff DE / Data Architect → Data Platform Lead | DA → Sr DA → Analytics Manager → Head of Analytics |
| **Where DE and DA share** | SQL fluency, business context awareness, data quality thinking |  |

---

## A day in the life

### Data Engineer at a Canadian bank (RBC, TD, Scotia, BMO)

- 9:00 AM — Standup, check overnight Airflow pipeline runs, address any failures
- 10:00 AM — Coding: refactor an existing dbt model, write tests, open PR
- 12:00 PM — Lunch, occasional call with data platform team
- 1:30 PM — Design a new ingestion job for a new source system
- 3:00 PM — Code review teammate's PR
- 4:00 PM — Ad-hoc: help a DA debug a data quality issue
- 5:00 PM — Documentation, end of day

### Data Analyst at Shopify or Lightspeed

- 9:00 AM — Standup with product and business team
- 10:00 AM — SQL queries for a new feature launch impact analysis
- 11:00 AM — Meeting with PM to discuss dashboard requirements
- 12:30 PM — Lunch
- 1:30 PM — Build the dashboard in Looker/Mode/Power BI
- 3:00 PM — Present findings from last week's A/B test to leadership
- 4:00 PM — Iterate on dashboard based on feedback
- 5:00 PM — Slack replies, wrap-up

---

## The 10-question decision framework

Answer these honestly. Score 1 for DE-leaning, 2 for DA-leaning.

1. When you get a problem, do you prefer to write code to solve it, or talk to people to understand it better?
2. Would you rather debug a broken pipeline or present findings to executives?
3. Are you okay with being on-call once a month?
4. Do you get energized by building systems, or by explaining insights?
5. Do you enjoy writing production Python, or is SQL and light scripting enough?
6. Would you rather work with other engineers, or with business teams?
7. Are you comfortable spending 80 percent of your day in a code editor?
8. Do you get excited about tools like Airflow, dbt, and Snowflake — or do those sound boring?
9. Do you prefer async written communication or live conversations?
10. If a business team says the data is wrong, do you want to fix the pipeline or figure out what they actually needed?

**Scoring:**

- 15 or lower: DE fits you well
- 16 to 19: Either works, follow your gut
- 20 or higher: DA fits you well

---

## 6-month learning roadmap for Data Engineering

**Month 1 to 2 — Foundations**

- SQL: master joins, window functions, CTEs (StrataScratch, DataLemur)
- Python: pandas basics, then production Python (OOP, testing, packaging)
- Linux and Git

**Month 3 — Data modeling**

- Kimball dimensional modeling (fact and dimension tables)
- Star schema and snowflake schema
- Slowly changing dimensions

**Month 4 — Cloud and orchestration**

- Pick one cloud (AWS or Azure) — free tier
- Airflow basics: DAGs, operators, scheduling
- Free Astronomer Academy courses

**Month 5 — Modern data stack**

- dbt fundamentals (dbt Labs offers free courses)
- Snowflake or Databricks (free trials)

**Month 6 — Portfolio and interview prep**

- Build 2 end-to-end pipelines (ingest → transform → model → dashboard)
- Case interview practice on [DataExpert.io](http://DataExpert.io) or Interview Query

---

## 6-month learning roadmap for Data Analytics

**Month 1 to 2 — Foundations**

- SQL: joins, aggregations, window functions (StrataScratch)
- Excel: pivot tables, VLOOKUP/XLOOKUP, formulas
- Business intuition: read The Lean Analytics book

**Month 3 — Visualization**

- Pick one BI tool: Power BI (Microsoft Learn), Tableau (Tableau Public), or Looker
- Build 5 dashboards from public datasets

**Month 4 — Python for analysts**

- The 20 percent of Python for DA (see the Aug 5 reel guide)
- Practice on Kaggle

**Month 5 — Stats and A/B testing**

- Basic statistics: hypothesis testing, p-values, confidence intervals
- A/B test analysis frameworks

**Month 6 — Portfolio and case prep**

- Build 3 portfolio dashboards on Canadian datasets
- Practice product and business case interviews (Exponent free tier)

---

## Canadian companies actively hiring both

**For Data Engineers:**

- RBC, TD, Scotiabank, BMO, CIBC, National Bank
- Shopify, Lightspeed, D2L, Wealthsimple, Nuvei
- Manulife, Sun Life, Great-West Life

**For Data Analysts:**

- Loblaws, Canadian Tire, Metro, Sobeys
- Bell, Rogers, Telus
- Air Canada, WestJet
- Every one of the above banks and tech companies too, in larger volume than DE

---

## When to switch later

DA to DE is a common transition after 2 to 3 years if you find you enjoy the technical side more. The other way around is rarer but happens when a DE realizes they want more stakeholder impact. Both moves are respected; do not treat this as a forever decision.

If you want to talk to actual DEs and DAs already working at Canadian companies before making the call, check out ORU at [joinoru.com](http://joinoru.com).