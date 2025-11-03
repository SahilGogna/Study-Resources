# Privacy-First Expense Tracker
Understand your spending while building a complete data and analytics workflow of your own.

## 1. Project Overview

Most budgeting and wallet apps today ask users to connect their bank accounts directly — offering automated categorization and predictions in exchange for sensitive access.  
However, many users prefer not to authorize third-party apps with their financial information.

This project aims to build a personal expense tracking and analytics system that demonstrates how you can process, categorize, and visualize your own financial data securely — without depending on commercial tools.  
Instead of connecting to banks, users will upload their **monthly credit card statements (PDFs)**, which will be parsed, resolved, categorized, and analyzed.

The goal is to encourage community members to:
- Explore full-stack concepts: data parsing, enrichment, categorization, and visualization.  
- Build something functional using common tools like Streamlit, Pandas, and SQL databases.  
- Understand personal finance data patterns and experiment with AI/ML concepts for categorization and prediction.

This is not a commercial or startup project — it’s a **personal, educational project** meant to help you learn and create something of your own.

## 2. Technical Overview

The system consists of five main modules:
1. PDF Parsing Engine  
2. Merchant Resolution Engine  
3. Transaction Categorization  
4. Analytics and Visualization  
5. Predictive Insights  

These modules will be connected through a **Streamlit application** that provides a user-friendly interface to upload files, review transactions, and view analytics.  
The database layer can be flexible — SQLite, PostgreSQL, or MySQL — depending on the developer’s preference.

## 3. Module Breakdown

### Part 1: PDF Parsing Engine
- Input: Monthly credit card statement (PDF).  
- Output: Structured table or CSV with normalized transactions.  
- Implementation: Use libraries like `pdfplumber` or `PyMuPDF` to extract data and standardize fields such as date, merchant, and amount.

### Part 2: Merchant Resolution Engine
- Goal: Normalize merchant names that appear in different forms (e.g., TMHRTNS → Tim Hortons).  
- Approach: Combine rule-based cleaning, fuzzy matching, and optionally generative AI for text normalization.  
- Outcome: A clean list of standardized merchants written back to the database.

### Part 3: Transaction Categorization
- Goal: Assign categories like Groceries, Dining, Utilities, and Needs/Wants.  
- Start with rule-based logic, expand to ML or LLM-driven classification later.  
- Allow user overrides through the Streamlit UI.

### Part 4: Analytics and Visualization
- Goal: Enable users to explore their expense trends.  
- Features: Monthly or quarterly summaries, top spending areas, and category visualizations.  
- Use Streamlit charts (Altair, Plotly, Matplotlib) for interactive visualizations.

### Part 5: Predictive Insights
- Goal: Estimate future spending patterns and identify recurring transactions.  
- Use simple regression or time-series models for forecasting.  
- Compare actual vs. predicted results for analysis.

## 4. Architecture Overview

```
[ Streamlit UI ]
    |
    |-- Upload PDF --> [ PDF Parser ] --> [ Transactions (Raw) ]
    |                          |
    |                       [ Normalize ]
    |                          v
    |-- Merchant Review --> [ Resolver ] --> [ Canonical Merchants ]
    |                          |
    |-- Category Review --> [ Categorizer ] --> [ Enriched Dataset ]
    |                          |
    |-- Dashboards ---------> [ Analytics and Forecasts ]
    |
[ Storage: SQL database (SQLite/PostgreSQL/MySQL) + config files ]
```

## 5. Streamlit Application Design

### Pages
1. Upload and Parse  
2. Merchant Resolution  
3. Categorization  
4. Analytics  
5. Forecasts  
6. Settings  

### Features
- Simple, interactive interface for non-technical users.  
- Modular structure — each page represents one logical step of the workflow.  
- Database-agnostic design: compatible with SQLite, PostgreSQL, or MySQL.  
- Flexible storage for configuration and rule files.

## 6. Folder Structure

```
expense-tracker/
  app.py
  src/
    parsing/
    merchants/
    categorize/
    analytics/
    forecasts/
    storage/
  config/
  data/
  tests/
  requirements.txt
  README.md
```

## 7. Tech Stack

- Python  
- Streamlit  
- Pandas / NumPy  
- pdfplumber / PyMuPDF  
- RapidFuzz / FuzzyWuzzy  
- SQLAlchemy  
- Scikit-learn (for ML components)  
- Altair / Plotly for charts  
- PostgreSQL / MySQL / SQLite (any database of choice)

## 8. MVP Goals

- Upload and parse a credit card statement (PDF).  
- Extract, resolve, and categorize transactions.  
- View analytics dashboards and spending summaries.  
- Forecast future or recurring expenses.  
- Allow flexible database and configuration setup.  

## Future

- expense tracking per credit card
