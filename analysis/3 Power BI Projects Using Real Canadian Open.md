# 3 Power BI Projects Using Real Canadian Open Data

Three portfolio projects built on real Government of Canada data. Free, public, and your interviewer already cares about the subject matter.

---

## Where all the data comes from

| Source | What is there |
| --- | --- |
| [open.canada.ca/data/en/dataset](http://open.canada.ca/data/en/dataset) | The full federal open data catalogue |
| [www150.statcan.gc.ca](http://www150.statcan.gc.ca) | Statistics Canada tables, downloadable as CSV |
| [search.open.canada.ca/opendata](http://search.open.canada.ca/opendata) | Faster search across the same catalogue |

Statistics Canada also publishes in SDMX format, which has a Power BI connector. CSV is simpler and fine for all three of these.

---

## Project 1: Canadian housing affordability

**The question:** how has the gap between income and housing cost changed by province over the last ten years?

**Data:** two Statistics Canada tables. New housing price index by province, and median after-tax household income by province. Search both on [www150.statcan.gc.ca](http://www150.statcan.gc.ca) and download as CSV.

**Build steps**

1. Load both CSVs. In Power Query, unpivot the year columns so each row is one province and one year
2. Trim whitespace on province names, they will not match between the two files otherwise
3. Build a proper date table and mark it as your date table
4. Model it as a star schema: a Province dimension, a Date dimension, and two fact tables
5. Write an affordability measure, price index divided by median income, indexed to your earliest year
6. Visuals: a filled map of Canada by affordability, a line chart over time with province as the legend, and cards for best and worst province

**Skills it proves:** Power Query unpivot and cleaning, star schema modelling, DAX time intelligence, map visuals.

**Why it works in an interview:** every Canadian interviewer has an opinion about housing. You will get follow-up questions, which is the point.

---

## Project 2: Canadian labour market

**The question:** which industries are actually growing in which provinces, and where has employment recovered?

**Data:** Statistics Canada Labour Force Survey. Employment by industry and province, monthly. One CSV.

**Build steps**

1. Load the CSV. The industry column will have NAICS codes bundled into the label, split them in Power Query
2. Build a date table from the monthly reference period
3. Create an Industry dimension and a Province dimension from the fact table
4. DAX measures: employment level, month over month change, year over year change, and a 12 month rolling average to smooth the noise
5. Visuals: a matrix of industry by province with conditional formatting, a line chart with the rolling average, and a drill-through page to a single industry
6. Add a bookmark toggle between absolute employment and percentage change

**Skills it proves:** star schema, DAX time intelligence, drill-through pages, bookmarks, conditional formatting.

**Why it works:** drill-through and bookmarks are the two features that separate a report from a dashboard, and almost no portfolio has them.

---

## Project 3: Federal government spending

**The question:** where does federal contract spending actually go, and how concentrated is it among vendors?

**Data:** proactive disclosure of contracts on [open.canada.ca](http://open.canada.ca). This is the messiest of the three, which is the point.

**Build steps**

1. Load the contracts CSV. Look at it before you touch it
2. In Power Query: standardise vendor names (the same company appears several ways), parse contract dates, handle nulls in contract value, and strip currency formatting
3. Build Department, Vendor, and Date dimensions
4. DAX measures: total contract value, contract count, average contract value, and a vendor concentration measure showing what share of a department's spend goes to its top five vendors
5. Visuals: a treemap of spend by department, a bar chart of top vendors, and a concentration metric card
6. Document your cleaning decisions in the README. This is the part that gets you hired

**Skills it proves:** serious Power Query work, fuzzy name standardisation, judgment under messy data.

**Why it works:** the first two projects prove you can build. This one proves you can clean, and cleaning is 70% of the actual job.

---

## The README template

Every project needs one. Recruiters read this before they open the file.

```
# [Project name]

## The question
One or two sentences. What were you actually trying to find out?

## The data
Source, link, date range, row count. Note anything unusual about it.

## What I did
The cleaning decisions you made and why. Name the judgment calls.

## What I found
Three bullets. Real findings, not "I built a dashboard."

## What I would do next
One honest limitation and one extension.
```

The "what I did" section is the one that matters. Anyone can follow a tutorial. Explaining why you dropped a column is what a job looks like.

---

## Order to build them

Start with Project 2. It is the cleanest data and it gets you a finished dashboard fastest. Then Project 1 for the modelling practice. Then Project 3, which is the hardest and the most impressive.

Three projects is the right number. Ten mediocre ones is worse than three good ones.

---

If you want your projects reviewed by data engineers and analysts already working at Canadian companies, check out ORU at [joinoru.com](http://joinoru.com).