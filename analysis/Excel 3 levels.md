# Excel — Full Breakdown Doc

---

# How Much Excel is Actually Required for Data Analyst Roles in Canada?

Most data analyst aspirants in Canada think they know Excel because they can do VLOOKUP, build a chart, and write a SUMIF. Then they sit in an interview at RBC or Manulife, get handed a 40,000-row file, and freeze.

Here is the reality nobody tells you.

Canadian banks and insurance companies still test Excel harder than Power BI in entry-level and mid-level DA interviews. They are not testing whether you can do a VLOOKUP. They are testing whether you can clean messy data, build a model, and produce a report under time pressure.

Excel for data analysts has 3 functional levels. Once you know what sits at each level, you know exactly what to learn and exactly when to stop. The gap between Level 1 and Level 3 is worth roughly $15,000 CAD in salary across Canadian DA roles.

---

# The 3 Levels of Excel for Data Analysts

## Level 1: Formulas and Basic Analysis (Foundation)

This is what most candidates list on their resume. It is necessary but it is also where almost everyone stops, which is why Level 1 by itself does not get you the job.

**What you need to know cold:**

- Lookup functions: XLOOKUP, INDEX MATCH, VLOOKUP, HLOOKUP
- Aggregation functions: SUMIFS, COUNTIFS, AVERAGEIFS, MAXIFS, MINIFS
- Logical functions: IF, nested IF, IFS, AND, OR, NOT
- Text functions: LEFT, RIGHT, MID, FIND, SUBSTITUTE, TRIM, CONCAT, TEXTJOIN
- Date functions: TODAY, EOMONTH, DATEDIF, YEAR, MONTH, WEEKDAY
- Basic Pivot Tables with row, column, and value fields
- Basic charts: column, bar, line, pie, scatter
- Conditional formatting (basic rules)
- Data validation (dropdown lists, input restrictions)
- Sorting, filtering, and using tables (Ctrl + T)

**Canadian context:**

At RBC, TD, Scotiabank, BMO, and CIBC, the entry-level DA interview almost always includes an Excel take-home test. They typically give you a 5,000 to 20,000 row file with messy data and ask you to clean it, summarize it, and answer 3 to 5 business questions. Level 1 is enough to attempt this but not enough to do it efficiently.

**How you know you are at Level 1:**

You can open a CSV with 10,000 rows and use XLOOKUP, SUMIFS, and a pivot table to answer basic business questions in under 30 minutes.

---

## Level 2: Power Query and Advanced Pivot Tables (Intermediate)

This is the level where Canadian hiring managers separate serious DA candidates from casual ones. Most aspirants have never even opened Power Query. Knowing it puts you ahead of 80% of applicants.

**What you need to know:**

- **Power Query basics:** importing from CSV, Excel, web, SQL Server, and folders
- **Power Query transformations:** removing duplicates, splitting columns, unpivoting, merging queries, appending queries
- **Connecting multiple files:** combining all CSVs from a folder into one table
- **Refreshable queries:** building a query once and refreshing as new data lands
- **Advanced Pivot Tables:** calculated fields, calculated items, GETPIVOTDATA
- **Slicers and timelines** connected to pivot tables
- **Pivot Charts** with proper filtering
- **Array formulas and dynamic arrays:** FILTER, SORT, UNIQUE, SEQUENCE, LET
- **Named ranges and structured references** in Excel tables
- **Goal Seek and Solver** for what-if analysis

**Canadian context:**

At Manulife, Sun Life, Canada Life, Telus, and Bell, the take-home or live exercise will explicitly require Power Query. They want to see that you can take 5 messy CSVs from different departments and combine them cleanly. If you do this manually, you fail. If you build a Power Query pipeline, you stand out.

At RBC Capital Markets and TD Securities, mid-level Reporting Analyst roles ($75,000 to $95,000 CAD) explicitly list Power Query and advanced pivot tables in the job description.

**How you know you are at Level 2:**

Give yourself a folder with 5 CSVs of monthly sales data, each with slightly different column names. In under an hour, you can build a Power Query that combines them, cleans them, and produces a refreshable pivot table summary.

---

## Level 3: Power Pivot, DAX, and Automated Dashboards (Senior / Differentiator)

This is where BI Analysts and Senior DAs at $85,000 to $105,000 CAD live. Most candidates skip this entirely because they assume Power Pivot is the same as Power BI. It is not, and Canadian banks specifically still run on Excel-first data models for many of their internal reports.

**What you need to know:**

- **Power Pivot data model:** importing data into the model, not just the sheet
- **Relationships between tables:** one-to-many, single-direction filtering
- **DAX measures in Excel:** SUM, CALCULATE, FILTER, ALL, RELATED
- **Time intelligence in DAX:** DATEYTD, SAMEPERIODLASTYEAR, DATEADD
- **Building a date dimension table** inside Power Pivot
- **KPI dashboards** with measures, slicers, and form controls
- **Building a dynamic dashboard:** scroll bars, dropdowns, form controls connected to formulas
- **Macros and basic VBA:** automating repetitive tasks (still relevant at Canadian banks)
- **Performance optimization:** keeping models lean, removing unused columns from the data model
- **Publishing dashboards** to SharePoint or OneDrive with refresh

**Canadian context:**

At RBC Capital Markets, TD Securities, and BMO Capital Markets, finance and risk reporting still runs heavily in Excel with Power Pivot. Senior DA roles here ($90,000 to $115,000 CAD) explicitly require Power Pivot and DAX experience.

At Manulife and Sun Life, actuarial and finance teams use Excel dashboards built with Power Pivot daily. Knowing how to build these is a direct differentiator.

**How you know you are at Level 3:**

Give yourself the same 5 CSVs from the Level 2 test. In under 2 hours, you can build a data model in Power Pivot with relationships, write 5 DAX measures including time intelligence, and produce a one-page dashboard with slicers that updates automatically when new data arrives.

---

# The Things You Do Not Need (And Are Wasting Time On)

Be ruthless about cutting these from your prep.

- **Advanced VBA macros (beyond basic automation):** Useful at banks, but not interview material.
- **Excel certifications (MOS, Microsoft Office Specialist):** Canadian hiring managers do not care.
- **Power Pivot KPI status indicators (the visual icons):** Outdated feature.
- **Excel Web Add-ins development:** Niche, not DA territory.
- **Cube functions (CUBEMEMBER, CUBEVALUE):** Almost never used in Canadian DA roles.
- **3D Maps and Power View:** Deprecated or rarely tested.

---

# Skills Checklist by Level

| Skill | Level 1 | Level 2 | Level 3 |
| --- | --- | --- | --- |
| XLOOKUP, INDEX MATCH, SUMIFS | Yes | Yes | Yes |
| Basic Pivot Tables and charts | Yes | Yes | Yes |
| Conditional formatting and data validation | Yes | Yes | Yes |
| Power Query (importing and transforming) | No | Yes | Yes |
| Combining multiple files with Power Query | No | Yes | Yes |
| Dynamic arrays (FILTER, SORT, UNIQUE) | No | Yes | Yes |
| Advanced Pivot Tables (calculated fields) | No | Yes | Yes |
| Power Pivot data model and relationships | No | No | Yes |
| DAX measures in Excel | No | No | Yes |
| Time intelligence and date dimension tables | No | No | Yes |
| Automated dashboards with form controls | No | No | Yes |
| Basic VBA for repetitive task automation | No | Basic | Yes |

---

# Free Resources by Level

## Level 1

- **ExcelJet** (free tutorials, the best Excel reference site online)
- **Leila Gharani YouTube channel** (clean, focused tutorials)
- **Microsoft Learn: Excel essentials**
- Practice dataset: Sample Sales Data on Kaggle, or any Statistics Canada CSV

## Level 2

- **Power Query M for Data Analysts** by Gil Raviv (excellent paid book, free chapters online)
- **Excel Is Fun YouTube channel** (Mike Girvin’s Power Query playlist)
- **MyOnlineTrainingHub** (Mynda Treacy’s Power Query content)
- **Microsoft Learn: Get and transform data in Excel**
- Practice project: combine 6 monthly sales CSVs into one refreshable report

## Level 3

- **The Definitive Guide to DAX** by Marco Russo and Alberto Ferrari (the same book applies to Excel Power Pivot)
- **PowerPivotPro** blog (now P3 Adaptive)
- [**Chandoo.org**](http://Chandoo.org) dashboard tutorials
- **SQLBI YouTube channel** (DAX concepts apply directly to Power Pivot)
- Practice project: build a sales dashboard in Excel with Power Pivot, relationships, 5 DAX measures, and slicers

---

# Canadian Companies and Their Excel Expectations

| Company | Expected Level | Salary Range (CAD) |
| --- | --- | --- |
| RBC, TD, Scotiabank, BMO, CIBC (retail banking DA) | Level 1 to Level 2 | $65,000 to $85,000 |
| RBC Capital Markets, TD Securities, BMO Capital Markets | Level 2 to Level 3 | $85,000 to $115,000 |
| Manulife, Sun Life, Canada Life | Level 2 to Level 3 | $75,000 to $105,000 |
| Telus, Bell, Rogers | Level 1 to Level 2 | $65,000 to $85,000 |
| Loblaw, Sobeys, Metro | Level 1 to Level 2 | $60,000 to $80,000 |
| Shopify, Wealthsimple, Hootsuite | Level 1 (SQL and Tableau matter more) | $75,000 to $100,000 |
| Government of Canada (DA / RPA roles) | Level 2 | $70,000 to $90,000 |

---

# How to Assess Your Current Excel Level

Try this self-test. Give yourself 90 minutes.

Download a sample sales dataset from Kaggle with at least 5 CSV files (one per month). Then:

1. Open one CSV in Excel and use XLOOKUP, SUMIFS, and a pivot table to answer 3 questions about top customers, top products, and revenue by region
2. Use Power Query to combine all 5 CSVs into a single refreshable table
3. Clean the combined data: remove duplicates, fix column types, handle blank rows
4. Build a pivot table with calculated fields and slicers from the cleaned data
5. Load the data into Power Pivot, build relationships with a date dimension table, and write 3 DAX measures (Total Sales, YoY Growth, Running Total)

If you finished step 1 cleanly but struggled with step 2: you are at Level 1.

If you finished step 4: you are at Level 2.

If you completed step 5 with proper relationships and DAX: you are at Level 3.

---

# 30-Day Excel Plan for Data Analysts

## Week 1: Lock down Level 1

Go through ExcelJet’s top 100 functions. Practice XLOOKUP, INDEX MATCH, SUMIFS, and nested IFs on a real dataset. Build 2 basic pivot tables and 2 charts. Push the file to GitHub or Google Drive as part of your portfolio.

## Week 2 to 3: Move into Level 2

Watch Leila Gharani’s Power Query playlist end to end. Take a folder of 5 messy CSVs and combine them with Power Query. Build a one-sheet refreshable report. Add dynamic arrays (FILTER, UNIQUE, SORT) to your toolkit. Read Power Query M for Data Analysts (free chapters).

## Week 4: Touch Level 3

Open Power Pivot in Excel for the first time. Take your Week 2 to 3 project and load it into Power Pivot instead. Build a date dimension table. Write 5 DAX measures. Build a one-page dashboard with slicers and form controls. Document the process in a LinkedIn post.

This single artifact, hosted on your portfolio, will outperform 90% of Canadian DA applicants because almost nobody at the entry to mid level demonstrates Power Pivot mastery.

---

# Pro Tip: How to Talk About Excel in Interviews

When asked "how is your Excel," do not say "intermediate" or "advanced." Those words mean nothing and every candidate uses them.

Instead, say: "I can build refreshable Power Query pipelines that combine multi-source data, and I have built Power Pivot dashboards with DAX measures including time intelligence. I can show you a sample if helpful."

This sentence alone separates you from 80% of applicants in the first 10 seconds.

---

# The Excel vs Power BI Question (Important)

A common mistake is to skip Excel because you assume Power BI replaces it. It does not, especially in Canada.

Here is the truth:

- **Canadian banks and insurance companies (RBC, TD, Manulife, Sun Life):** Excel is still the dominant tool for finance, risk, and audit teams. Power BI is used for executive dashboards only.
- **Modern tech companies (Shopify, Wealthsimple, Hootsuite):** Tableau or Looker dominate, Excel is secondary.
- **Government roles:** Excel-first, always.

If your target is a Canadian bank or insurance company, Excel at Level 2 or higher is non-negotiable. Do not skip it.

---

### Want to Build Real Analytics Projects?

ORU's **Hands-On Data Analytics** course teaches you to think like a practitioner and execute like one — through realistic business problems across insurance, banking, fintech, and ecommerce. Tools covered include Python, SQL, BigQuery, dbt Core, Tableau, Power BI, Streamlit, and Vanna AI.

Use code **ORU10** for 10% off → [Enroll Now](https://joinoru.com/course/hands-on-data-analytics:-learn-by-building-industry-projects)

*For mentorship, live sessions, and community support: [joinoru.com](https://joinoru.com)*


---

*Sources: Job postings on LinkedIn and Indeed Canada (2025 to 2026), salary data from Glassdoor Canada and Robert Half Salary Guide 2026, ORU mentor interviews with hiring managers at RBC Capital Markets, TD Securities, and Manulife.*