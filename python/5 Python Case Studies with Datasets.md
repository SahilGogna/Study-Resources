# 5 Python Case Studies with Datasets

---

Each case study includes the business problem, the dataset to practice on, questions to ask before coding, and the step-by-step solving approach. The goal is to build the thinking pattern, not memorise solutions.

---

## Case Study 1 — Sales Trend Analysis (Retail)

### The Problem

Your manager gives you 12 months of sales data and asks you to identify which product categories are growing, which are declining, and which customer segments drive the most revenue.

### Dataset

Online Retail Dataset

Kaggle: [kaggle.com/datasets/vijayuv/onlineretail](http://kaggle.com/datasets/vijayuv/onlineretail)

Columns: InvoiceNo, StockCode, Description, Quantity, InvoiceDate, UnitPrice, CustomerID, Country

### Questions to Ask

- What columns are available and what does each represent?
- Are there returns in the data (negative quantities)?
- How is growth defined — month over month or year over year?
- How should customer segments be defined?

### Assumptions to State

- Revenue = Quantity multiplied by UnitPrice, excluding negative quantities
- Growth = month-over-month change in total revenue
- Customer segments defined by total spend quantiles: High (top 20%), Mid (next 30%), Low (bottom 50%)

### Solving Approach

Step 1: Load and inspect. Check shape, dtypes, missing values, and duplicates before anything else.

Step 2: Clean. Remove negative quantities (returns). Drop rows with missing CustomerID. Convert InvoiceDate to datetime. Calculate a Revenue column.

Step 3: Category growth. Extract month from InvoiceDate. Group by Description (or a category column if available) and month. Calculate total revenue per group. Use pct_change() within each category to get month-over-month growth. Identify top 3 growing and top 3 declining.

Step 4: Customer segmentation. Group by CustomerID, sum Revenue. Use pd.qcut() to assign High, Mid, Low labels. Group by segment and sum revenue. Calculate what percentage of total revenue each segment represents.

Step 5: Output clean summary DataFrames and one line chart showing revenue trends for the top 3 growing categories.

### Key Pandas Concepts Tested

read_csv, dropna, drop_duplicates, to_datetime, groupby, agg, pct_change, qcut, merge, plot

---

## Case Study 2 — Customer Churn Prediction Prep (Telecom)

### The Problem

Before the data science team builds a churn model, they need a clean, feature-engineered dataset. Your job is to take raw customer data and prepare it for modelling.

### Dataset

Telco Customer Churn Dataset

Kaggle: [kaggle.com/datasets/blastchar/telco-customer-churn](http://kaggle.com/datasets/blastchar/telco-customer-churn)

Columns: customerID, gender, SeniorCitizen, tenure, MonthlyCharges, TotalCharges, Contract, Churn, and more

### Questions to Ask

- What is the target variable? (Churn yes/no)
- Are there any columns with mixed data types?
- Which categorical columns need encoding before modelling?
- Are there any columns that should not be used as features (like customer ID)?

### Assumptions to State

- TotalCharges should be numeric but may be stored as string in some rows
- Churn will be encoded as 1 (yes) and 0 (no)
- We will not include customerID as a feature
- Missing values in TotalCharges will be filled with the median

### Solving Approach

Step 1: Load and inspect. Check dtypes carefully. TotalCharges is often stored as object due to empty strings for new customers.

Step 2: Fix data types. Convert TotalCharges to numeric using [pd.to](http://pd.to)_numeric with errors set to coerce. Fill resulting NaN values with the median.

Step 3: Handle binary columns. Columns like gender, Partner, Dependents, PhoneService contain Yes/No. Map these to 1 and 0.

Step 4: Handle multi-category columns. Contract, InternetService, PaymentMethod have 3+ values. Use pd.get_dummies() to one-hot encode them. Drop the first category to avoid multicollinearity.

Step 5: Encode the target. Map Churn Yes to 1 and No to 0.

Step 6: Final check. Confirm no missing values remain. Confirm all columns are numeric. Print the shape and first 5 rows.

### Key Pandas Concepts Tested

to_numeric, fillna, map, get_dummies, astype, isnull, shape, dtypes

---

## Case Study 3 — Exploratory Data Analysis on a Health Dataset

### The Problem

A healthcare analytics team gives you a patient dataset and asks you to summarise key statistics, identify outliers, and flag any data quality issues before the dataset goes to the modelling team.

### Dataset

Heart Disease UCI Dataset

Kaggle: [kaggle.com/datasets/redwankarimsony/heart-disease-uci](http://kaggle.com/datasets/redwankarimsony/heart-disease-uci)

Columns: age, sex, cp (chest pain type), trestbps (resting blood pressure), chol (cholesterol), fbs, restecg, thalach, exang, oldpeak, slope, ca, thal, target

### Questions to Ask

- What does each column represent clinically?
- What range of values is medically valid for each numeric column?
- How should outliers be handled — removed, capped, or flagged?
- Are there any columns that should be treated as categorical even if stored as numbers?

### Assumptions to State

- Columns like sex, cp, fbs, restecg, exang, slope, ca, thal are categorical even though stored as integers
- Outliers defined as values more than 3 standard deviations from the mean for continuous columns
- We will flag outliers rather than remove them, as clinical edge cases may be real

### Solving Approach

Step 1: Load and inspect. Check shape, dtypes, missing values, and value counts for categorical columns.

Step 2: Descriptive statistics. Use describe() on numeric columns. Check min and max values against medically valid ranges. For example, a resting blood pressure of 0 is a data error.

Step 3: Distribution analysis. Plot histograms for age, chol, thalach, and trestbps. Look for skewness and unusual distributions.

Step 4: Outlier detection. Calculate mean and standard deviation for each continuous column. Flag rows where any value is more than 3 standard deviations from the mean. Return a summary of how many outliers exist per column.

Step 5: Correlation analysis. Use df.corr() to find which features correlate most strongly with the target variable. Visualise with a heatmap using Seaborn.

Step 6: Write a short data quality report summarising findings, flagged issues, and recommendations.

### Key Pandas Concepts Tested

describe, value_counts, isnull, hist, corr, std, mean, Seaborn heatmap, Boolean masking for outlier flagging

---

## Case Study 4 — API Data Pipeline and Analysis (Finance)

### The Problem

Your team wants a daily report showing the previous 30 days of stock price data for 3 Canadian bank stocks, including a 7-day rolling average and a flag for any day where the closing price dropped more than 2% from the previous day.

### Dataset

Alpha Vantage API (free tier)

[api.alphavantage.co](http://api.alphavantage.co) — free API key available, returns daily stock price data in JSON format

Alternative: Yahoo Finance via yfinance Python library

pip install yfinance

Import yfinance and use [yf.download](http://yf.download)() to fetch historical data for any ticker

Tickers to use: RY (RBC), TD (TD Bank), BNS (Scotiabank)

### Questions to Ask

- Which API or data source should be used?
- What date range is required?
- How is the rolling average calculated — on closing price or adjusted closing price?
- How should missing trading days (weekends, holidays) be handled?

### Assumptions to State

- Using yfinance for simplicity
- Rolling average calculated on adjusted closing price
- Missing days are expected (weekends and holidays) and will not be filled
- A drop of more than 2% is calculated as (today close minus yesterday close) divided by yesterday close

### Solving Approach

Step 1: Fetch data. Use yfinance to download the last 30 trading days of data for all three tickers in a single call. The result is a multi-level DataFrame.

Step 2: Clean and reshape. Extract just the adjusted close prices. Rename columns to ticker names. Reset the index so date is a regular column.

Step 3: Rolling average. For each ticker column, calculate a 7-day rolling mean using rolling(7).mean(). Add these as new columns.

Step 4: Daily change flag. Calculate the percentage change from the previous day using pct_change(). Flag rows where the change is less than -0.02 (a drop of more than 2%).

Step 5: Output a clean summary DataFrame and a line chart showing the closing price and rolling average for each stock over the 30-day period.

### Key Pandas Concepts Tested

API data ingestion, multi-level DataFrame handling, rolling, pct_change, Boolean masking for flagging, multi-line plotting

---

## Case Study 5 — Resume Parser and Job Match Scorer

### The Problem

Your team is building a basic internal tool that reads a candidate's resume text and a job description, extracts key skills from both, and produces a match score showing how well the candidate fits the role.

### Dataset

No external dataset needed. Use:

- Any plain text resume (your own, or generate a sample)
- Any Canadian job description copied from LinkedIn or Indeed

For a structured dataset to practice on:

Resume Dataset

Kaggle: [kaggle.com/datasets/gauravduttakiit/resume-dataset](http://kaggle.com/datasets/gauravduttakiit/resume-dataset)

Contains 962 resumes across 25 job categories in CSV format

### Questions to Ask

- What counts as a skill — only technical tools or also soft skills?
- Should the match be case-sensitive?
- Is partial matching acceptable (e.g., "Python" matching "Python 3")?
- How should the score be presented — percentage, ratio, or letter grade?

### Assumptions to State

- Skills are extracted using a predefined list of common tech and data skills
- Matching is case-insensitive
- Score = number of matching skills divided by total skills in the job description, expressed as a percentage
- Partial matches are not counted — exact word match only

### Solving Approach

Step 1: Define a skills list. Create a Python list of 50 to 100 common skills: SQL, Python, Pandas, Tableau, Power BI, dbt, Airflow, Snowflake, Azure, AWS, Excel, and so on.

Step 2: Extract skills from resume text. Convert both the resume text and the skills list to lowercase. Use a loop or list comprehension to check which skills from your list appear in the resume text. Return a set of matched skills.

Step 3: Extract skills from job description. Repeat the same process for the job description text.

Step 4: Calculate match score. Find the intersection of resume skills and JD skills. Score = intersection length divided by JD skills length multiplied by 100.

Step 5: Output a summary showing matched skills, missing skills (in JD but not in resume), and the match score. Print recommendations for which skills to add to the resume.

### Key Python Concepts Tested

String manipulation, set operations (intersection, difference), list comprehensions, function writing, f-strings for formatted output, basic text processing without NLP libraries

---

## The Universal Python Problem-Solving Framework

For any Python data case study in a Canadian interview, use this 5-step approach:

1. Load and inspect — always check shape, dtypes, missing values, and duplicates before touching the data
2. Clean — fix data types, handle missing values, remove or flag outliers, deal with inconsistent formatting
3. Transform — create new columns, aggregate, reshape, merge as needed to answer the question
4. Analyse — answer each sub-question with a separate groupby, calculation, or comparison
5. Communicate — output clean DataFrames and at least one chart, explain findings in plain language

Interviewers want to see that you think like an analyst, not just that you know Pandas syntax.

---

### Want to Build Real Analytics Projects?

ORU's **Hands-On Data Analytics** course teaches you to think like a practitioner and execute like one — through realistic business problems across insurance, banking, fintech, and ecommerce. Tools covered include Python, SQL, BigQuery, dbt Core, Tableau, Power BI, Streamlit, and Vanna AI.

Use code **ORU10** for 10% off → [Enroll Now](https://joinoru.com/course/hands-on-data-analytics:-learn-by-building-industry-projects)


*For mentorship, live sessions, and community support: [joinoru.com](http://joinoru.com)*