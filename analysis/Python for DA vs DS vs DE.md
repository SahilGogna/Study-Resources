# Python for DA vs DS vs DE — Comparison Doc

# Python for Data Analysts vs Data Scientists vs Data Engineers — Canadian Interview Guide

> Companion doc for the Aug 5 reel. If you are targeting a Data Analyst role in Canada, this doc is your Python filter: what to learn, what to skip, and how it differs from DS and DE.
> 

## The 20 percent of Python you actually need as a Data Analyst

There are 5 skill clusters. If you nail these, you have covered ~90 percent of the Python questions in Canadian DA interviews.

### 1. Pandas basics

**What to learn:**

- Reading a CSV or SQL query into a DataFrame
- Filtering rows and selecting columns
- GroupBy with sum, mean, count
- Merging and joining DataFrames
- Sorting and getting top N rows

**Code you should be able to write from memory:**

```python
import pandas as pd

df = pd.read_csv('orders.csv')

# Filter and select
recent_orders = df[df['order_date'] > '2026-01-01'][['customer_id', 'total_amount']]

# GroupBy
revenue_by_city = df.groupby('city')['total_amount'].sum().sort_values(ascending=False)

# Merge
merged = df.merge(customers, on='customer_id', how='left')

# Top N
top_customers = df.groupby('customer_id')['total_amount'].sum().nlargest(10)
```

**Skip for DA:** MultiIndex slicing, custom aggregation functions with lambda, pivot_table with complex margins, memory optimization tricks.

### 2. Data cleaning

**What to learn:**

- Handling nulls: isnull, dropna, fillna
- Removing duplicates
- Type conversion (astype)
- Basic string cleaning
- Date parsing with [pd.to](http://pd.to)_datetime

**Code:**

```python
# Nulls
df['email'] = df['email'].fillna('unknown@none.com')
df = df.dropna(subset=['customer_id'])

# Duplicates
df = df.drop_duplicates(subset=['email'])

# Type conversion
df['total_amount'] = df['total_amount'].astype(float)
df['order_date'] = pd.to_datetime(df['order_date'])

# String cleaning
df['city'] = df['city'].str.strip().str.title()
```

**Skip for DA:** Regex-heavy transformations, applying user-defined cleaning functions across the whole frame, complex text normalization pipelines.

### 3. Reading and writing files

**What to learn:**

- CSV read/write
- Excel read/write with sheet names
- SQL connection with SQLAlchemy or [pandas.read](http://pandas.read)_sql
- Parquet (nice to have)

**Code:**

```python
from sqlalchemy import create_engine

# CSV
df = pd.read_csv('data.csv')
df.to_csv('output.csv', index=False)

# Excel with multiple sheets
df = pd.read_excel('report.xlsx', sheet_name='Q3')
df.to_excel('summary.xlsx', sheet_name='Results', index=False)

# SQL
engine = create_engine('postgresql://user:pass@host:port/db')
df = pd.read_sql('SELECT * FROM orders WHERE order_date > CURRENT_DATE - 90', engine)
```

**Skip for DA:** Async file IO, streaming huge files in chunks, custom serializers.

### 4. Basic visualization

**What to learn:**

- Bar chart, line chart, histogram
- Seaborn heatmap for correlation
- Setting title, xlabel, ylabel

**Code:**

```python
import matplotlib.pyplot as plt
import seaborn as sns

# Bar chart
revenue_by_city.plot(kind='bar', title='Revenue by City')
plt.ylabel('Revenue (CAD)')
plt.show()

# Correlation heatmap
sns.heatmap(df.corr(numeric_only=True), annot=True, cmap='coolwarm')
plt.show()
```

**Skip for DA:** Interactive Plotly dashboards, complex subplot grids, custom matplotlib themes. Your dashboards will live in Power BI or Tableau.

### 5. Statistics via numpy and pandas

**What to learn:**

- Descriptive stats: describe, mean, median, std, quantile
- Correlation: corr()
- Basic hypothesis check via scipy (t-test) — nice to have

**Code:**

```python
df['total_amount'].describe()
df.corr(numeric_only=True)
df.groupby('city')['total_amount'].agg(['mean', 'median', 'std'])
```

**Skip for DA:** Building statistical models, PCA, distributions from scratch. That is data science territory.

---

## Detailed topic breakdown — what you actually need to learn inside each cluster

This goes one level deeper than the code above. For each skill cluster, here is the specific knowledge map: what concepts to understand, what functions to know, what to skip, and in what order to learn it.

### 1. Pandas basics — detailed breakdown

**Core concept first:** A DataFrame is a 2D table with labelled rows and columns. Before anything else, get comfortable with the idea that pandas lets you query and transform tabular data without writing loops — you operate on entire columns at once.

**Specific functions and concepts to learn, in order:**

- `pd.DataFrame()` — creating a DataFrame from scratch from a dict or list
- `pd.read_csv()` — reading a file into a DataFrame; learn the common parameters: `sep`, `encoding`, `header`, `usecols`, `nrows`
- `.head()`, `.tail()`, `.shape`, `.info()`, `.describe()` — the first five things you run on any new dataset
- Selecting a single column: `df['column_name']` returns a Series
- Selecting multiple columns: `df[['col1', 'col2']]` returns a DataFrame
- Filtering rows with a condition: `df[df['salary'] > 80000]`
- Combining filters: `df[(df['city'] == 'Toronto') & (df['salary'] > 80000)]` — the `&` and `|` operators, not `and`/`or`
- `.loc[]` — label-based selection; used when you want rows and columns by name
- `.iloc[]` — integer-position selection; used when you want rows and columns by number
- `.sort_values(by='column', ascending=False)` — sort the DataFrame
- `.reset_index(drop=True)` — reset the row index after filtering
- `.value_counts()` — count how often each unique value appears in a column
- `.groupby('column').agg({'col2': 'sum', 'col3': 'mean'})` — group by a category and aggregate
- `.merge(other_df, on='key', how='left')` — join two DataFrames; know the four join types: left, right, inner, outer
- `.nlargest(n, 'column')` and `.nsmallest(n, 'column')` — shortcut for top N

**What to actually practice:** Load a CSV, filter it, group it, merge it with another table, sort the result, and write it back to CSV. Do this 5 times with different datasets. Kaggle Datasets is your source.

**Skip for now:** MultiIndex DataFrames, `.apply()` with lambda across rows (slow and rarely needed for DA), `.pivot_table()` with complex margins, method chaining with `.pipe()`.

---

### 2. Data cleaning — detailed breakdown

**Core concept first:** Real data from any source — SQL, Excel, a third-party API — will almost always have missing values, wrong types, duplicates, or inconsistent formatting. Cleaning is not a one-time step; it is the first 30 minutes of every analysis.

**Specific functions and concepts to learn, in order:**

- `.isnull()` and `.isnull().sum()` — identify which columns have nulls and how many
- `.dropna()` — drop rows where any value is null
- `.dropna(subset=['column'])` — drop rows only where a specific column is null
- `.fillna(value)` — fill nulls with a fixed value
- `.fillna(df['col'].mean())` — fill nulls with the column mean
- `.ffill()` and `.bfill()` — forward-fill and backward-fill; useful for time series data
- `.duplicated()` — returns a boolean Series marking duplicate rows
- `.drop_duplicates()` and `.drop_duplicates(subset=['email'])` — remove duplicates, optionally based on specific columns
- `.dtypes` — check the data type of each column
- `.astype(float)`, `.astype(int)`, `.astype(str)` — convert a column's data type
- `pd.to_datetime(df['date_column'])` — convert a string column to datetime
- `.str.strip()` — remove leading and trailing whitespace from string columns
- `.str.lower()`, `.str.upper()`, `.str.title()` — standardize text casing
- `.str.replace('old', 'new')` — find and replace within a string column
- `.rename(columns={'old_name': 'new_name'})` — rename columns

**Decision logic interviewers test:** When do you drop nulls vs fill them? If a column is the primary key or a joining key, drop rows with nulls there. If it's a metric you can approximate (like price or age), fill with mean or median. If the null represents something meaningful (like no purchase), fill with 0 or a placeholder string.

**Skip for now:** Regex-heavy string transformations, applying complex user-defined cleaning functions across an entire DataFrame with `.apply()`, text normalization pipelines with NLP libraries.

---

### 3. Reading and writing files — detailed breakdown

**Core concept first:** In most DA jobs, you will not receive a clean CSV. You will connect to a database, write a SQL query, pull the result into Python as a DataFrame, clean and transform it, then either save it back or push it into a visualization tool. The SQL-to-pandas pipeline is the single most common real-world workflow.

**Specific functions and concepts to learn, in order:**

- `pd.read_csv('file.csv')` — read a local CSV file
- `df.to_csv('output.csv', index=False)` — write a DataFrame to CSV; always set `index=False` unless you want the row numbers written as a column
- `pd.read_excel('file.xlsx', sheet_name='Sheet1')` — read a specific sheet from an Excel file
- `df.to_excel('output.xlsx', sheet_name='Results', index=False)` — write to Excel
- `from sqlalchemy import create_engine` — the standard way to connect to a database from Python
- `create_engine('postgresql://user:password@host:port/database')` — building a connection string; know this format for PostgreSQL, and the simpler `sqlite:///local.db` format for SQLite
- `pd.read_sql('SELECT * FROM table WHERE condition', engine)` — run a SQL query and get the result as a DataFrame in one line
- `df.to_sql('table_name', engine, if_exists='replace', index=False)` — write a DataFrame back to a SQL table; know the `if_exists` options: `replace`, `append`, `fail`

**What to practice:** Download SQLite (no setup needed), create a small local database, write a query with `pd.read_sql()`, clean the result, and write it back with `df.to_sql()`. This covers the full loop.

**Skip for now:** Async database connections, streaming large files in chunks with `chunksize`, custom serialization formats, Parquet (nice to have but not needed for interviews).

---

### 4. Basic visualization — detailed breakdown

**Core concept first:** In a DA role in Canada, Python visualization is for exploration only — finding patterns, checking distributions, spotting anomalies during analysis. Your actual stakeholder-facing dashboards will be in Power BI or Tableau. So you only need to know a handful of chart types and how to label them correctly.

**Specific functions and concepts to learn, in order:**

- `import matplotlib.pyplot as plt` and `import seaborn as sns` — the two libraries you need
- `df['column'].plot(kind='bar')` — quick bar chart directly from a pandas Series or DataFrame
- `df['column'].plot(kind='line')` — quick line chart; good for time series
- `df['column'].plot(kind='hist', bins=20)` — histogram; shows the distribution of a numeric column
- `plt.title('My Chart')` — add a title
- `plt.xlabel('X Axis Label')` and `plt.ylabel('Y Axis Label')` — label the axes
- `plt.show()` — render the chart
- `plt.figure(figsize=(10, 5))` — control the size of the chart before plotting
- `sns.heatmap(df.corr(numeric_only=True), annot=True, cmap='coolwarm')` — correlation heatmap; one of the most commonly asked-about visualization types in DA interviews
- `sns.boxplot(x='category', y='value', data=df)` — useful for showing distribution across groups
- `sns.scatterplot(x='col1', y='col2', data=df)` — show the relationship between two numeric columns

**The 3 charts that cover 80% of DA work:** bar chart for comparing categories, line chart for trends over time, heatmap for correlation. Learn these three well before anything else.

**Skip for now:** Plotly interactive charts, complex subplot grids with `plt.subplots()`, custom Matplotlib themes and styles, Bokeh, Altair.

---

### 5. Statistics via NumPy and pandas — detailed breakdown

**Core concept first:** You do not need to be a statistician. But in DA interviews, especially ones that include a case study or take-home assignment, you will be expected to summarize a dataset numerically and explain what the numbers mean. These are the numbers that show up.

**Specific functions and concepts to learn, in order:**

- `df.describe()` — returns count, mean, std, min, max, and the 25th/50th/75th percentiles for all numeric columns in one shot; run this on every new dataset
- `df['column'].mean()` — arithmetic average; sensitive to outliers
- `df['column'].median()` — middle value; more robust to outliers than mean; when mean and median differ a lot, it signals a skewed distribution
- `df['column'].std()` — standard deviation; how spread out the values are; a large std means high variance in the data
- `df['column'].min()` and `df['column'].max()` — range of the column
- `df['column'].quantile(0.25)`, `.quantile(0.75)` — 25th and 75th percentile; together they define the interquartile range
- `df.corr(numeric_only=True)` — correlation matrix for all numeric columns; values range from -1 to +1; above 0.7 is strong positive correlation, below -0.7 is strong negative
- `import numpy as np` — numpy gives you array-level versions of the same operations: `np.mean()`, `np.median()`, `np.std()`, `np.percentile(arr, 75)`
- **Population vs sample standard deviation:** pandas `.std()` uses sample std (divides by n-1) by default; numpy `.std()` uses population std (divides by n) by default; interviewers sometimes ask about this difference, so know it

**Interview application:** When you get a dataset in a case study, the expected flow is: run `.describe()` first, look for anything unusual (very high max, very low min, large std, big gap between mean and median), then interpret what you found. That interpretation is what separates a candidate who just ran code from one who actually analyzed the data.

**Skip for now:** Building statistical models, hypothesis testing with scipy beyond a basic t-test, probability distributions from scratch, PCA, regression from scratch. All of that is data science territory.

---

## Side by side comparison

| Skill area | Data Analyst | Data Scientist | Data Engineer |
| --- | --- | --- | --- |
| **Pandas basics** | Must have | Must have | Must have |
| **Advanced pandas** | Skip | Must have | Nice to have |
| **Data cleaning** | Must have (80% of job) | Must have | Must have (part of pipelines) |
| **File and SQL IO** | Must have | Must have | Must have |
| **Visualization** | Basic (Matplotlib/Seaborn) | Basic + Plotly | Skip |
| **Statistics** | Basic | Deep (distributions, tests, regression) | Skip |
| **Machine learning (sklearn)** | Skip | Must have | Skip |
| **Deep learning (PyTorch/TF)** | Skip | Nice to have | Skip |
| **OOP and design patterns** | Skip | Basic | Must have (build maintainable pipelines) |
| **Decorators, context managers** | Skip | Basic | Must have |
| **Async and multiprocessing** | Skip | Basic | Must have |
| **PySpark** | Skip | Nice to have | Must have |
| **Airflow / Prefect** | Skip | Skip | Must have |
| **dbt** | Nice to have | Skip | Must have |
| **Testing (pytest)** | Skip | Basic | Must have |
| **Cloud SDKs (boto3, azure-sdk)** | Skip | Basic | Must have |

---

## Where Canadian companies actually use Python

**At RBC, TD, and other Canadian banks:**

- DAs use Python mostly for ad-hoc analysis and data cleaning before loading into Power BI
- DEs run Python pipelines through Airflow, and PySpark on Databricks
- DS teams (much smaller) use Python + scikit-learn + statsmodels for credit models and fraud detection

**At Shopify, Lightspeed, D2L:**

- DAs use Python + SQL heavily; visualization is often Mode Analytics or Looker instead of Power BI
- DEs are Python-heavy with dbt + Snowflake or Databricks
- DS uses Python for experimentation platforms and A/B test analysis

---

## Where to actually learn the 20 percent

All free.

- **Kaggle Python course** (5 hours). Covers pandas basics.
- **DataCamp free tier** — first chapter of "Data Manipulation with pandas".
- **W3Schools pandas tutorial** — quick reference.
- **Real Python’s pandas GroupBy article** — the single best explanation of GroupBy you will find.
- **A YouTube playlist**: Corey Schafer’s pandas series (older but timeless).

**Practice:**

- **Kaggle Datasets** — pick a small one, clean it, group it, plot it. Repeat 5 times.
- **StrataScratch** — free tier has pandas problems tagged by difficulty.

---

## What Canadian DA interviewers actually ask about Python

- **Live coding round:** almost always a pandas problem — read a CSV, clean, group, output the answer. Rarely more than 30 minutes.
- **Conceptual:** "Explain the difference between loc and iloc." "How would you handle nulls in a column that has 40 percent missing values?" "How is pandas different from SQL for aggregation?"
- **Case study:** "Here is a dataset. Find the top 5 [insight] and explain." Answer in pandas, then defend the choices.

If you can nail these 5 skill clusters, you are ready for any Canadian DA interview. Master these first. Everything else is optional.

If you want mentorship from data analysts and data engineers already working at Canadian companies, check out ORU at [joinoru.com](http://joinoru.com).