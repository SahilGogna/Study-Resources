# Power BI — Full Breakdown Doc
---

# How Much Power BI is Actually Required for Data Analyst Roles?

Most Canadian DA aspirants think learning Power BI means learning how to build charts. Then they apply to BI Analyst roles paying $90,000 to $110,000 CAD, get filtered out in the first round, and have no idea why.

The truth is simple. Power BI has 3 functional levels, and Canadian companies are increasingly only interested in candidates who can operate at Level 2 and Level 3.

Knowing exactly what sits at each level changes your entire prep timeline. It also changes what kind of projects you build for your portfolio, because a Level 1 portfolio looks identical to every other applicant and gets ignored.

---

# The 3 Levels of Power BI for Data Analysts

## Level 1: Connecting Data and Visualizing (Foundation)

Almost everyone who lists Power BI on their resume is at this level. It is necessary but it is not what gets you hired.

**What you need to know cold:**

- Connecting to data sources: Excel, CSV, SQL Server, Azure, SharePoint
- Power Query basics: removing nulls, changing data types, splitting columns
- Building visuals: bar, column, line, pie, card, table, matrix
- Slicers and filters at page and visual level
- Basic interactivity and drill-through
- Publishing to Power BI Service and sharing with a team
- Setting up basic scheduled refresh

**Canadian context:**

Companies like Loblaw, Telus, Bell, and most government roles in Canada will accept Level 1 for entry-level Business Analyst or Reporting Analyst positions. Salary range tends to sit at $60,000 to $75,000 CAD.

**How you know you are at Level 1:**

Give yourself a CSV and a one-line brief like "show monthly sales by region." If you can build a clean, presentable dashboard in under an hour, you have Level 1.

---

## Level 2: DAX (Intermediate)

This is the level Canadian hiring managers actually test in interviews. The gap between Level 1 and Level 2 is the single biggest reason qualified-looking candidates get rejected.

**What you need to know:**

- DAX fundamentals: calculated columns vs measures (and when to use each)
- Aggregation functions: SUM, AVERAGE, COUNTROWS, DISTINCTCOUNT
- CALCULATE and filter context (the most tested DAX concept in interviews)
- Time intelligence: DATEYTD, SAMEPERIODLASTYEAR, DATEADD, DATESINPERIOD
- Iterators: SUMX, AVERAGEX, FILTER
- Variables (VAR and RETURN) for cleaner, faster measures
- ALL, ALLEXCEPT, REMOVEFILTERS for breaking out of filter context
- Building KPI cards with conditional formatting based on measures

**Canadian context:**

D2L, Lightspeed, OpenText, and most BI roles at Canadian banks specifically ask candidates to write DAX live in interviews. The most common interview question is some variation of "calculate year-over-year growth as a measure." If you stumble on that, the interview ends.

**How you know you are at Level 2:**

You can build a YoY revenue comparison with proper time intelligence functions without consulting Google. You understand why CALCULATE is the engine of DAX and can explain row context vs filter context to someone else.

---

## Level 3: Data Modeling at Scale (Senior / Differentiator)

This is where BI Analysts at $90,000 to $115,000 CAD live. Most candidates skip this entirely because it does not feel as visible as making charts. That is exactly why mastering it puts you in the top 20%.

**What you need to know:**

- Star schema design: facts and dimensions
- Relationship cardinality: 1-to-many, many-to-many, and when each is appropriate
- Cross filter direction (single vs both) and when to use each
- Building a date dimension table from scratch
- Composite models and dual-storage mode (DirectQuery + Import)
- Performance optimization: reducing model size, columnar storage, removing unused columns
- Calculation groups and field parameters (newer features that most candidates do not know)
- Row-Level Security (RLS) for enterprise reports
- Incremental refresh setup for large datasets

**Canadian context:**

At Manulife, Sun Life, RBC Capital Markets, and Hootsuite, Level 3 candidates are treated as BI Developers, not BI Analysts. The role descriptions often blur the line, and the salary jump from $75,000 to $105,000 CAD is real.

**How you know you are at Level 3:**

Hand you a flat 2 million row Excel file and you can turn it into a star schema with a dim_date table, optimized measures, and an interactive report that loads instantly. You know how to use Performance Analyzer in Power BI Desktop to find slow visuals and fix them.

---

# The Things That Are Not Worth Going Deep On

Be ruthless about cutting these from your prep until Level 3 is solid.

- **Power BI Embedded for developers:** Unless you are applying to a developer role, skip it.
- **Paginated Reports:** Niche use case in Canadian companies, almost never tested in interviews.
- **AI Visuals (Q&A, Key Influencers):** Nice to know, not interview material.
- **Custom Power BI themes and design tokens:** Useful once you have the role, not for getting it.
- **Power Automate integration:** Skip unless the job description explicitly calls for it.

---

# Skills Checklist by Level

| Skill | Level 1 | Level 2 | Level 3 |
| --- | --- | --- | --- |
| Connect to data sources | Yes | Yes | Yes |
| Build core visuals | Yes | Yes | Yes |
| Power Query data cleaning | Basic | Yes | Yes |
| Calculated columns and measures | No | Yes | Yes |
| CALCULATE and filter context | No | Yes | Yes |
| Time intelligence functions | No | Yes | Yes |
| Star schema modeling | No | No | Yes |
| Date dimension and relationships | No | Basic | Yes |
| Performance optimization | No | No | Yes |
| Row-Level Security | No | No | Yes |

---

# Free Resources by Level

## Level 1

- **Microsoft Learn: Power BI Fundamentals** (free, official, hands-on)
- **SQLBI YouTube channel** (start with the "Introducing Power BI" playlist)
- **Guy in a Cube YouTube channel** (Adam Saxton's beginner playlist)
- Practice dataset: AdventureWorks sample database (free download from Microsoft)

## Level 2

- **DAX Guide** by SQLBI ([dax.guide](http://dax.guide)) — the most accurate DAX reference on the internet
- **Microsoft Learn: Build DAX measures in Power BI**
- **Enterprise DNA Forum** (community questions and answers on DAX)
- Practice project: build a sales dashboard with YoY, MoM, and rolling 12-month measures

## Level 3

- **The Definitive Guide to DAX** by Marco Russo and Alberto Ferrari (this is the book Canadian senior BI Analysts have on their desks)
- **SQLBI: Power BI Optimization course** (free preview videos cover most of what you need)
- **Microsoft Learn: Design and build tabular semantic models**
- Practice project: take a wide flat file with 1 million plus rows and rebuild it into a properly modeled star schema with sub-second visual load times

---

# Canadian Companies Hiring BI Analysts and Their Power BI Expectations

| Company | Expected Level | Salary Range (CAD) |
| --- | --- | --- |
| Loblaw, Telus, Bell, Rogers | Level 1 to Level 2 | $65,000 to $85,000 |
| D2L, Lightspeed, OpenText | Level 2 | $80,000 to $100,000 |
| RBC, TD, Scotiabank, BMO (BI roles) | Level 2 to Level 3 | $85,000 to $115,000 |
| Manulife, Sun Life, Canada Life | Level 2 to Level 3 | $85,000 to $110,000 |
| Hootsuite, Wealthsimple, Shopify | Level 2 (Tableau more common) | $80,000 to $105,000 |
| Government of Canada (BI Analyst) | Level 1 to Level 2 | $70,000 to $90,000 |

---

# How to Assess Your Current Power BI Level

Try this exercise. Give yourself 90 minutes.

1. Download the Contoso Sales sample dataset from Microsoft (free)
2. Load it into Power BI Desktop
3. Build a one-page report showing total revenue, YoY revenue growth, and revenue by product category
4. Add a slicer for year and a drill-down from category to product
5. Write three measures using CALCULATE with at least one filter argument

If you finished step 4 but struggled to write the measures cleanly: you are at Level 1.

If you wrote the measures with proper time intelligence and they all worked: you are at Level 2.

If you also built a date dimension table, set up proper relationships, and used Performance Analyzer to verify the report loads in under 2 seconds: you are at Level 3.

---

# 30-Day Power BI Plan for Data Analysts

## Week 1: Lock down Level 1

Go through Microsoft Learn Power BI Fundamentals end to end. Then build 2 dashboards from public Canadian datasets (StatCan, City of Toronto Open Data). Push them to a portfolio.

## Week 2 to 3: Move into Level 2

Pick the DAX Guide as your reference. Take your Week 1 dashboards and rewrite all the calculations as proper DAX measures. Add time intelligence (YoY, YTD, rolling 12 months). Watch SQLBI's "Introducing DAX" course in full.

## Week 4: Touch Level 3

Take a wide flat sales file. Split it into proper fact and dimension tables. Build relationships manually. Add a date dimension table. Use Performance Analyzer to find slow visuals and optimize them. Document the entire process in a public LinkedIn post or blog. This single artifact will separate you from 90% of applicants.

---

# Pro Tip: Build the Right Portfolio Project

Most Canadian DA candidates build 3 to 4 surface-level Power BI dashboards. Hiring managers see them daily and they all look the same.

Instead, build ONE portfolio project at Level 3 depth. A single dashboard with:

- A clean star schema you designed
- Properly written DAX measures (not auto-generated)
- Time intelligence that works correctly across YoY, MoM, and YTD
- Documented design decisions in a README

This is more impressive than five Level 1 dashboards.

---

# ORU Resources

If you are seriously looking to land a Data Analyst or BI Analyst role in Canada, ORU can help.

We run mentorship sessions, mock interviews, and structured masterclasses with BI analysts and data engineers already working at Canadian companies like RBC, Lightspeed, D2L, and Manulife. We can review your Power BI portfolio and tell you exactly what level it actually demonstrates.

**Start here:** [joinoru.com](http://joinoru.com)

Or DM Sahil directly on Instagram @sahilgogna_ with any questions about your specific Power BI level.

---
## Want to Go Deeper? ORU Hands-On Data Analytics Course

Most analytics courses teach you tools. This one teaches you how to think like a practitioner, then gives you the tools to execute. Every project is built around a realistic business problem — insurance, banking, fintech, and ecommerce. The tools span Python, SQL, BigQuery, dbt Core, Tableau, Power BI, Streamlit, and Vanna AI. Nothing is introduced for its own sake. By the final project, you are operating across a stack that reflects what senior practitioners use in production.

For analysts who are tired of concept-heavy courses with little real execution: [joinoru.com/course/hands-on-data-analytics](http://joinoru.com/course/hands-on-data-analytics)

*Sources: Job postings on LinkedIn and Indeed Canada (2025 to 2026), salary data from Glassdoor Canada and Robert Half Salary Guide 2026, ORU mentor interviews with hiring managers at RBC, D2L, and Manulife.*