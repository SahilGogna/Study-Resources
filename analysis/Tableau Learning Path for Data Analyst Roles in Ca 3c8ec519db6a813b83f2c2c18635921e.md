# Tableau Learning Path for Data Analyst Roles in Canada

Tableau has three levels. Most people stop at Level 1 and then wonder why interviews go nowhere. Here is what to learn at each one, what Canadian companies actually test, and free resources for all of it.

---

## Level 1: Connect and build

**What to learn**

- Connecting to Excel, CSV, and a SQL database
- Dimensions versus measures, and why Tableau treats them differently
- Bar charts, line charts, scatter plots, maps
- Filters, sorting, and the Show Me panel
- Basic formatting and tooltips

**The bar you need to clear:** take a raw CSV you have never seen and produce a clean, readable bar chart in ten minutes.

**Where Canadian companies test this:** they mostly do not. This is assumed. Failing here ends the interview, passing here earns nothing.

**Time:** one to two weeks.

---

## Level 2: Calculations and LOD expressions

This is the level that decides interviews.

**What to learn**

- Calculated fields, including IF, CASE, and date functions
- Table calculations: running total, percent of total, rank, window functions
- **LOD expressions: FIXED, INCLUDE, EXCLUDE.** This is the single most skipped topic and the single most asked
- Parameters, sets, and groups
- Joins versus blends versus relationships, and when each one applies

**Why LOD expressions matter so much:** they answer questions that filters cannot. The classic interview question is some version of "show me each customer's sales as a percentage of their region's total, while the dashboard is filtered to one product category." That is a FIXED expression, and roughly 80% of candidates cannot write it.

**Where Canadian companies test this:** Scotiabank, Sun Life, Telus, and most agencies expect Level 2 without discussion. It comes up as a live exercise or a take home.

**Time:** three to four weeks. Do not rush this level.

---

## Level 3: Dashboards and performance

**What to learn**

- Dashboard actions: filter, highlight, go to URL
- Interactivity and layout containers
- Extracts versus live connections, and the tradeoff
- Performance tuning once a dataset passes a few million rows
- Publishing to Tableau Cloud or Tableau Server, and managing permissions

**The thing nobody tells you:** building a dashboard is not the job. Shipping one that other people use and that does not break next quarter is the job. Canadian enterprises care about the publishing and maintenance half, and almost no portfolio shows it.

**Time:** two to three weeks.

---

## Free resources

| Resource | Covers | Cost |
| --- | --- | --- |
| Tableau Public | Free desktop version and a portfolio host in one | Free |
| Tableau's own free training videos | Levels 1 and 2 | Free |
| Makeover Monday | Weekly real dataset with a community critique | Free |
| Workout Wednesday | Challenge-based, heavy on Level 2 calculations | Free |
| Tableau Community Forums | Where the LOD questions get answered properly | Free |
| [open.canada.ca](http://open.canada.ca) | Canadian public datasets for your portfolio | Free |

---

## A note on Power BI

If you are choosing your first BI tool for the Canadian market, Power BI has more job postings, because banks, insurance, and government all run on the Microsoft stack. Tableau is the stronger second tool and has less competition.

The concepts transfer. Data modeling, a calculation language, and dashboard design exist in both. Learn one properly and the other takes about two weeks.

---

## What to build

One dashboard, using Canadian public data from [open.canada.ca](http://open.canada.ca) or Statistics Canada, that uses at least one LOD expression and at least one dashboard action. Write a short README with the question you asked, where the data came from, and what you found.

That single project demonstrates all three levels. Ten Kaggle dashboards demonstrate none of them.

---

If you want your portfolio reviewed by data engineers and analysts already working at Canadian companies, check out ORU at [joinoru.com](http://joinoru.com).