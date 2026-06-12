# Python — Full Breakdown Doc

---

# How Much Python is Actually Required for Data Analyst Roles in Canada?

Most data analyst aspirants in Canada get Python wrong in one of two ways. Either they stop at pandas basics and never grow past Level 1, or they wander into data engineering territory (SQLAlchemy, Airflow, production pipelines) thinking it makes them more hirable.

It does not.

Python for a Data Analyst is a different toolkit from Python for a Data Engineer. The skills overlap at Level 1, then diverge sharply at Level 2 and Level 3. Walking the DA-specific path saves you 4 to 6 months of prep that would not have gotten you a single extra interview.

This doc lays out exactly what to learn at each level for a DA role specifically, what to skip (including DE-flavored topics that look impressive but never get tested in DA interviews), and how to validate your level against real Canadian hiring standards.

---

# The 3 Levels of Python for Data Analysts

## Level 1: Pandas for Data Analysis (Foundation)

This is the entry filter. Every Canadian DA take-home or live coding round tests at exactly this level.

**What you need to know cold:**

- Loading data: [pd.read](http://pd.read)_csv, [pd.read](http://pd.read)_excel, [pd.read](http://pd.read)_sql
- Inspecting data: head, tail, info, describe, shape, dtypes
- Selecting columns and filtering rows with boolean conditions
- groupby with sum, mean, count, nunique, agg
- Handling missing data: isna, fillna, dropna
- Removing duplicates: duplicated, drop_duplicates
- Sorting: sort_values, sort_index
- Type conversion: astype, [pd.to](http://pd.to)_datetime, [pd.to](http://pd.to)_numeric
- Creating new columns with simple logic and np.where
- Working with dates: extracting year, month, day, weekday

**Canadian context:**

At RBC, TD, Scotiabank, BMO, and CIBC, the entry-level DA take-home is almost always a CSV with messy data and 3 to 5 business questions. They want to see clean pandas code that loads, cleans, groups, and answers the questions. Nothing beyond Level 1 is tested.

**How you know you are at Level 1:**

Open Jupyter, load a 20,000-row CSV you have never seen before, and produce a clean summary table that answers 3 business questions in under 30 minutes without Googling more than 2 things.

---

## Level 2: Analysis and Visualization (Intermediate)

This is the level mid-level DA roles ($75,000 to $90,000 CAD) actually expect. Most candidates either stop at Level 1 or skip past Level 2 into machine learning or DE-flavored Python, which is a mistake. Level 2 is where real DA work happens.

**What you need to know:**

- Merging DataFrames: pd.merge with inner, left, right, outer joins
- Concatenating: pd.concat for stacking DataFrames
- Pivot tables: pd.pivot_table for cross-tab analysis
- Reshaping: melt and pivot for long vs wide format
- Groupby transformations: transform, cumsum, rolling window calculations
- matplotlib basics: line, bar, scatter, histogram with proper labels and titles
- seaborn for quick statistical plots: boxplot, heatmap, pairplot, distplot
- Basic descriptive statistics: mean, median, std, quantiles, correlations
- Working with categorical data: value_counts, crosstab
- Reading and writing Excel files with multiple sheets using openpyxl

**Canadian context:**

At Shopify, Lightspeed, D2L, and Wealthsimple, mid-level DA take-homes look like: "Here is a customer dataset and a transactions dataset. Merge them, identify the top 10% of customers by spend, and visualize segment differences." This is pure Level 2 work. No fancy techniques, no models, just clean analysis with charts.

**How you know you are at Level 2:**

Hand you 2 related CSVs and a business question. In under 2 hours, you can merge them, do exploratory analysis, produce 3 to 5 clean labelled charts, and write a written summary of your findings.

---

## Level 3: Automation and Light Modeling (Senior / Differentiator)

This is the level that puts you in the top 20% of Canadian DA applicants. Roles in the $85,000 to $100,000 CAD range expect this. Crucially, Level 3 for a DA is NOT data engineering. It is the analyst version of "I can do more than one-off analyses, and I can answer harder business questions with the right techniques."

**What you need to know:**

- Writing reusable functions for repeated analyses (not for production pipelines)
- Converting a notebook workflow into a clean, parameterized .py script
- Automating recurring analyses (monthly or weekly reports) with command-line arguments
- Basic error handling (try, except) for robust analyses
- Pulling data from APIs at a basic level: requests library, JSON parsing, pagination
- Reading from databases using pandas read_sql (with a simple connection string, not SQLAlchemy ORM)
- Basic forecasting: simple time series with rolling means, prophet, or statsmodels
- scikit-learn for simple regression and classification (understanding and using, not deploying)
- A/B test analysis: t-tests, p-values, confidence intervals using scipy.stats
- Cohort analysis and retention curves
- Customer segmentation using basic clustering (K-means at a conceptual level)

**Canadian context:**

At Hootsuite, Wealthsimple, Manulife, and Sun Life, senior DA candidates are expected to take a vague business question like "is our new feature actually driving retention" and produce an analysis that includes the right statistical test, clean visualization, and a written recommendation. That requires Level 3 Python.

At RBC and TD, Senior DA roles in marketing analytics, fraud, and customer analytics teams specifically test for A/B test interpretation and cohort analysis. These are pure Level 3 skills.

**How you know you are at Level 3:**

You can take a real business question like "did the new email campaign drive more clicks than the old one, and is the difference statistically significant" and produce a clean notebook that pulls the data, runs the right statistical test, visualizes the result, and writes a clear recommendation. All within an afternoon.

---

# The DE Trap: What to Skip Even Though It Sounds Impressive

This is the single biggest source of wasted time for DA aspirants in Canada. Cut these from your prep.

## Data Engineering Territory (skip unless you are transitioning to DE)

- **SQLAlchemy ORM:** Use pandas read_sql with a basic connection string instead. DAs do not write ORM code.
- **Apache Airflow or Prefect:** DA roles do not own production pipelines. DE owns them.
- **Building production ETL pipelines:** DA roles consume cleaned data, they do not build the cleaning infrastructure.
- **Docker and containerization:** Not a DA skill.
- **CI/CD for data workflows:** Not a DA skill.
- **dbt advanced macros and Jinja templating:** Basic dbt awareness is enough. Macros are DE territory.
- **Kafka, Kinesis, streaming systems:** DE only.

## Machine Learning Depth (skip unless transitioning to Data Scientist)

- **TensorFlow, PyTorch, deep learning frameworks:** Not tested in DA interviews.
- **Hyperparameter tuning at depth:** Skip.
- **MLOps tools (MLflow, Weights & Biases):** Skip.
- **Model deployment:** Skip.

## General Software Engineering (skip)

- **Object-oriented programming with inheritance hierarchies:** Knowing what a class is helps. Building deep class structures does not.
- **Web frameworks (Django, Flask, FastAPI):** Not relevant for DA.
- **Algorithms and Data Structures at LeetCode depth:** Canadian DA interviews almost never test this. SQL is the technical filter, not Python algorithms.
- **Microservices architecture:** Not a DA topic.

## Why This Matters

Every hour you spend learning Airflow is an hour you did not spend perfecting pandas merges or statistical tests. Hiring managers at Canadian banks and tech companies test the latter, not the former, for DA roles.

This is the most common reason talented aspirants spend 12 to 18 months job hunting instead of 4 to 6 months.

---

# Skills Checklist by Level

| Skill | Level 1 | Level 2 | Level 3 |
| --- | --- | --- | --- |
| pandas: read, filter, groupby | Yes | Yes | Yes |
| Handling missing data and duplicates | Yes | Yes | Yes |
| Date manipulation with pandas | Yes | Yes | Yes |
| Merging and reshaping DataFrames | No | Yes | Yes |
| Pivot tables and crosstabs | No | Yes | Yes |
| matplotlib and seaborn charts | Basic | Yes | Yes |
| Descriptive statistics | Basic | Yes | Yes |
| Reusable functions for analysis | No | Basic | Yes |
| Automating recurring reports | No | No | Yes |
| API data pulling (basic) | No | No | Yes |
| A/B test analysis with scipy.stats | No | No | Yes |
| Forecasting with prophet or statsmodels | No | No | Yes |
| scikit-learn for simple regression | No | No | Yes |

---

# Free Resources by Level

## Level 1

- **Kaggle Pandas Course** (free, 4 hours, hands-on)
- **Real Python: pandas tutorials**
- **DataCamp Intro to Python for Data Analysis** (first chapter free)
- Practice dataset: Toronto Open Data portal, Statistics Canada datasets

## Level 2

- **Kaggle Data Visualization Course** (free, covers matplotlib and seaborn)
- **Python Data Science Handbook** by Jake VanderPlas (free online, chapters 3 and 4)
- **Seaborn official tutorial** (free, well written)
- Practice project: take 2 related CSVs from Kaggle and produce a full exploratory analysis with charts and written findings

## Level 3

- **Storytelling with Data** by Cole Nussbaumer Knaflic (book and free YouTube videos)
- **Practical Statistics for Data Scientists** by Bruce and Bruce (focused on the stats DAs actually use)
- **scikit-learn user guide** (free, official, start with the supervised learning intro)
- **Mode Analytics A/B Testing Tutorial** (free, focused on the analyst use case)
- Practice project: pick a public dataset with a clear time component (StatCan retail sales, City of Toronto crime data), build an automated monthly report script, and add either a forecast or a statistical comparison

---

# Canadian Companies and Their Python Expectations for DA Roles

| Company | Expected Level | Salary Range (CAD) |
| --- | --- | --- |
| RBC, TD, Scotiabank, BMO, CIBC (entry DA) | Level 1 | $65,000 to $80,000 |
| RBC, TD (Senior DA in marketing or risk) | Level 3 | $90,000 to $110,000 |
| Shopify, Lightspeed, D2L (mid DA) | Level 2 | $75,000 to $95,000 |
| Hootsuite, Wealthsimple (Senior DA) | Level 2 to Level 3 | $85,000 to $110,000 |
| Manulife, Sun Life, Canada Life | Level 1 to Level 2 | $70,000 to $90,000 |
| Telus, Bell, Rogers | Level 1 to Level 2 | $70,000 to $90,000 |
| Government of Canada | Level 1 | $70,000 to $90,000 |

---

# How to Assess Your Current Level

Try this self-test. Give yourself a weekend.

## Level 1 Test (60 minutes)

Download a public CSV with at least 10,000 rows from Statistics Canada or Toronto Open Data.

1. Load it into pandas
2. Inspect the data (info, describe, missing values)
3. Clean nulls and convert types where needed
4. Group by a category and produce a summary table
5. Sort the result and export to a new CSV

If you finished without major Googling: you are at Level 1.

## Level 2 Test (2 hours)

Find a Kaggle dataset with at least 2 related tables (e.g. customers and orders).

1. Merge them on a common key
2. Build a pivot table summarizing revenue by region and month
3. Produce 3 charts using seaborn: a boxplot, a heatmap, and a bar chart
4. Compute correlations between numeric columns
5. Write a 1-paragraph written summary of findings

If you finished cleanly with readable charts and a clear summary: you are at Level 2.

## Level 3 Test (3 hours)

Pick a business question with a clear comparison (e.g. "did the discount in May drive higher revenue than the discount in April").

1. Pull the relevant data
2. Run the appropriate statistical test using scipy.stats (t-test or chi-square)
3. Visualize the comparison clearly
4. Write a recommendation for the (mock) stakeholder
5. Wrap the whole thing in a reusable function

If you can do this and the function works on a different month's data without changes: you are at Level 3.

---

# 30-Day Python Plan for Data Analysts (DA-Specific)

## Week 1 to 2: Cement Level 1

Complete the Kaggle Pandas Course end to end. Take 2 real datasets and build clean exploratory analyses on them. Push them to GitHub with a written README.

## Week 3: Move into Level 2

Complete the Kaggle Data Visualization Course. Take one of your Week 1-2 datasets and rebuild the analysis with proper merging, pivot tables, and a full set of seaborn charts. Add a written findings document.

## Week 4: Touch Level 3

Pick a business question on a public dataset. Write a parameterized .py script that loads the data, runs a statistical test using scipy.stats, produces a clear chart, and outputs a written recommendation. Bonus: add a simple forecast using prophet or a rolling mean comparison. This single project, properly documented on GitHub, will outperform 90% of DA portfolios in Canada.

---

# Important: This Path is for DAs, Not DEs

If you find yourself reading about Airflow, SQLAlchemy ORM, Docker, Kafka, or microservices, stop. Those are signals that you are drifting into Data Engineer territory.

The DA path is:

- Master pandas analysis (Level 1)
- Add visualization and reshaping (Level 2)
- Layer in light automation and statistical analysis (Level 3)

That is the whole path. Anything more impressive than that, for a DA role specifically, is wasted prep time.

If you are actually interested in transitioning to Data Engineer or Analytics Engineer, the path changes. But for DA roles in Canada, Level 3 as defined above is the ceiling that matters.

---
### Want to Build Real Analytics Projects?

ORU's **Hands-On Data Analytics** course teaches you to think like a practitioner and execute like one — through realistic business problems across insurance, banking, fintech, and ecommerce. Tools covered include Python, SQL, BigQuery, dbt Core, Tableau, Power BI, Streamlit, and Vanna AI.

Use code **ORU10** for 10% off → [Enroll Now](https://joinoru.com/course/hands-on-data-analytics:-learn-by-building-industry-projects)

*For mentorship, live sessions, and community support: [joinoru.com](https://joinoru.com)*


---

*Sources: Job postings on LinkedIn and Indeed Canada (2025 to 2026), salary data from Glassdoor Canada and [Levels.fyi](http://Levels.fyi), ORU mentor interviews with hiring managers at RBC, TD, Shopify, and Lightspeed.*