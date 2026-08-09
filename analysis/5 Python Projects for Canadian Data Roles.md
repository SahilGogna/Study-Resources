# 5 Python Projects for Canadian Data Roles — Resource Doc

## Why these 5 projects (and not the usual ones)

Canadian recruiters at RBC, TD, Shopify, Loblaws, and Lightspeed have all publicly said the same thing on LinkedIn: they skip Titanic and Iris. Those projects prove you can follow a Kaggle tutorial. They do not prove you can handle messy real-world data or think about a business problem.

The 5 projects below are designed against 3 filters:

1. **Canadian data** — recruiter can immediately relate
2. **Demonstrates a different skill** — your portfolio is balanced, not repetitive
3. **Feels like real work** — the closer it is to what an actual analyst does day-to-day, the more callbacks you get

---

## Project 1: Toronto Real Estate Price Analysis

**What it demonstrates:** Data cleaning, GroupBy, time series basics, geographic analysis, correlation.

**Dataset sources (all free, most no login needed):**

- **City of Toronto Open Data Portal**: [https://open.toronto.ca/catalogue/](https://open.toronto.ca/catalogue/) — filter by topic "Business & Economics" or search "neighbourhood profiles", "property", or "transit". CSV and JSON downloads.
- **TRREB Market Watch archives** (free monthly PDFs): [https://trreb.ca/market-data/market-watch/](https://trreb.ca/market-data/market-watch/) — parse with [pandas.read](http://pandas.read)_html or a PDF library like pdfplumber
- **CMHC Housing Data Portal**: [https://www.cmhc-schl.gc.ca/professionals/housing-markets-data-and-research/housing-data](https://www.cmhc-schl.gc.ca/professionals/housing-markets-data-and-research/housing-data) — market intelligence, rental market data by city, price indices
- **Statistics Canada Housing**: [https://www.statcan.gc.ca/en/subjects-start/housing](https://www.statcan.gc.ca/en/subjects-start/housing) — direct CSV downloads for house price index, ownership rates, mortgage data
- **Bank of Canada key indicators**: [https://www.bankofcanada.ca/rates/indicators/key-variables/](https://www.bankofcanada.ca/rates/indicators/key-variables/) — housing price index, 5-year mortgage rates
- **Kaggle Canadian house prices (starter option)**: [https://www.kaggle.com/datasets/rakannimer/canada-house-prices](https://www.kaggle.com/datasets/rakannimer/canada-house-prices)

Note: TRREB's live MLS data is behind broker credentials and RETS protocol — skip that path. The Market Watch archive PDFs give you the same aggregate trends without the broker access hassle.

**Tech stack:** Python, pandas, matplotlib, seaborn, geopandas (optional for maps).

**Key questions to answer in the notebook:**

- Which Toronto neighborhoods had the highest price growth over the last 5 years?
- Is there a correlation between subway proximity and average price?
- How do prices change by season?

**README template outline:**

- Problem statement (one paragraph)
- Data sources and cleaning steps
- Key findings (3 to 5 bullets with charts)
- What I would do next with more data

---

## Project 2: Canadian Retail Customer Segmentation (RFM)

**What it demonstrates:** Customer analytics, GroupBy at scale, segmentation logic, business framing.

**Dataset sources:**

- **UCI Online Retail** (original, 1 year, ~500K rows): [https://archive.ics.uci.edu/dataset/352/online+retail](https://archive.ics.uci.edu/dataset/352/online+retail)
- **UCI Online Retail II** (2 years, ~1M rows, preferred for RFM): [https://archive.ics.uci.edu/dataset/502/online+retail+ii](https://archive.ics.uci.edu/dataset/502/online+retail+ii)
- **Kaggle mirror of Online Retail II** (easier one-click download): [https://www.kaggle.com/datasets/mashlyn/online-retail-ii-uci](https://www.kaggle.com/datasets/mashlyn/online-retail-ii-uci)
- **Synthetic Canadian version**: use Mockaroo ([https://www.mockaroo.com](https://www.mockaroo.com)) with Canadian city names and CAD amounts if you want a fully Canadian narrative

In your notebook narrative, frame the dataset as a Canadian gift retailer with plans to expand across provinces. Recruiters recognize the RFM framework immediately and appreciate the localization.

**Tech stack:** Python, pandas, numpy, seaborn.

**What to build:**

- Calculate Recency, Frequency, Monetary values per customer
- Score each on a 1 to 5 scale
- Cluster into segments: Champions, Loyal, At Risk, Lost
- Recommend a marketing action per segment

**Why this works:** This is literally the analysis done at Loblaws, Canadian Tire, Shopify. Recruiters recognize the framework immediately.

---

## Project 3: Bank of Canada Rates and Inflation Dashboard

**What it demonstrates:** API integration, time series analysis, financial data storytelling, dashboarding, and business framing for banks and fintechs.

**Dataset sources:**

- **Bank of Canada Valet API** (the gold standard for Canadian financial data, no auth required): [https://www.bankofcanada.ca/valet/docs](https://www.bankofcanada.ca/valet/docs) — policy rate, prime rate, 5-year bond yield, USD/CAD, and hundreds of other series
- **Statistics Canada CPI (Consumer Price Index)**: [https://www.statcan.gc.ca/en/subjects-start/prices_and_price_indexes/consumer_price_indexes](https://www.statcan.gc.ca/en/subjects-start/prices_and_price_indexes/consumer_price_indexes) — headline inflation by category and by province
- **StatCan Web Data Service** (programmatic access to StatCan tables): [https://www.statcan.gc.ca/en/developers/wds](https://www.statcan.gc.ca/en/developers/wds)
- **Bank of Canada exchange rates archive**: [https://www.bankofcanada.ca/rates/exchange/](https://www.bankofcanada.ca/rates/exchange/) — daily USD/CAD, EUR/CAD, and 20+ others

**Tech stack:** Python, requests, pandas, plotly or matplotlib, Streamlit for the dashboard (Streamlit Community Cloud hosting is free).

**What to build:**

- Pull 10 years of monthly Bank of Canada overnight policy rate history from the Valet API
- Pull matching StatCan CPI headline inflation monthly series
- Chart both on the same timeline to show how the policy rate reacts to inflation, and quantify the lag
- Add USD/CAD exchange rate as a third series to show currency correlation with rate cycles
- Bucket historical periods into "hiking cycle", "cutting cycle", and "holding" using CASE-like logic
- Build a Streamlit dashboard with a date range slider, series selector, and a correlation heatmap
- Include a written analysis section: what patterns show up between rate decisions and inflation lag? What happened during the 2022-2023 hiking cycle?

**Bonus additions to stand out:**

- Overlay the 5-year fixed mortgage rate and calculate the spread over the policy rate
- Add a "what if" simulator that shows monthly mortgage payment changes for a $500K mortgage at each historical rate
- Add a Bank of Canada meeting date overlay so you can see rate decisions in context

**Why this works:** Canadian banks and fintechs live and breathe rate data. If your dashboard can be dropped into a mortgage, treasury, or economic research team meeting without any changes, you have built the exact skill they hire for. It also proves you can work with real APIs, handle time series properly, and think in financial context, which is rare in junior applicants.

---

## Project 4: Reddit Sentiment Analysis on Canadian Subreddits

**What it demonstrates:** API usage, NLP basics, time series, visualization.

**Dataset sources and access:**

- **Reddit API** (free with account, rate-limited): [https://www.reddit.com/dev/api/](https://www.reddit.com/dev/api/) — create your app at [https://www.reddit.com/prefs/apps](https://www.reddit.com/prefs/apps) to get client_id and client_secret
- **PRAW** (Python wrapper for the Reddit API): [https://praw.readthedocs.io/en/stable/](https://praw.readthedocs.io/en/stable/)
- **Academic Torrents Pushshift dumps** (historical bulk archives): [https://academictorrents.com](https://academictorrents.com) — large torrents, useful if you want years of history without hitting API limits

Target Canadian subreddits:

- **r/PersonalFinanceCanada** (~1.2M members) — banks, TFSA, RRSP, mortgages, rate decisions
- **r/canadahousing** (~120K members) — sentiment closely tracks Bank of Canada rate announcements
- **r/canada** (~1.5M members) — broader national mood indicator
- **r/toronto** or **r/vancouver** — regional angle if you want a city-specific twist

Be aware Reddit's 2023 API pricing changes affected commercial use — for portfolio scale (personal, non-commercial) you are still under the free tier.

**Tech stack:** Python, PRAW, VADER or TextBlob for sentiment, pandas, matplotlib.

**What to build:**

- Pull 3 months of posts from a Canadian sub
- Score each post for sentiment
- Plot sentiment trends over time
- Identify keyword-driven sentiment shifts (e.g. "interest rate" mentions plus sentiment)

**Why this works:** Shows you can work with unstructured text and APIs, without needing heavy ML. Great for BI or Product Analyst roles.

---

## Project 5: Canadian Credit Card Fraud Pattern Analysis

**What it demonstrates:** Anomaly detection, feature engineering, class imbalance handling, business relevance.

**Dataset sources:**

- **Kaggle Credit Card Fraud (ULB, the classic)**: [https://www.kaggle.com/datasets/mlg-ulb/creditcardfraud](https://www.kaggle.com/datasets/mlg-ulb/creditcardfraud) — 284K transactions, PCA-transformed features, real anonymized European bank data. Great for anomaly detection modeling but weaker on business storytelling because features are anonymized.
- **Kaggle Fraud Detection (Sparkov simulated) — recommended**: [https://www.kaggle.com/datasets/kartik2112/fraud-detection](https://www.kaggle.com/datasets/kartik2112/fraud-detection) — 1.85M transactions with richer, non-anonymized features (merchant, category, city, transaction time). Much better for narrative because you can talk about "grocery vs online electronics" patterns.
- **Kaggle Credit Card Fraud 2023**: [https://www.kaggle.com/datasets/nelgiriyewithana/credit-card-fraud-detection-dataset-2023](https://www.kaggle.com/datasets/nelgiriyewithana/credit-card-fraud-detection-dataset-2023) — newer, larger, class-balanced version

Recommendation: Use the Sparkov dataset (kartik2112). The category and merchant fields let you build a compelling story. Frame the notebook as if you are working in RBC's or TD's fraud analytics team analyzing patterns and proposing rule-based alerts — that framing lands with Canadian bank interviewers.

**Tech stack:** Python, pandas, matplotlib, seaborn, scikit-learn (basic Isolation Forest only).

**What to build:**

- Explore fraud vs non-fraud transaction patterns
- Feature engineering: time of day, amount buckets, transaction velocity per card
- Simple anomaly detection with Isolation Forest
- Business framing: what would a bank do with these findings?

**Why this works:** RBC, TD, Scotia, BMO all have fraud analytics teams. This shows you understand a real bank use case.

---

## Universal GitHub README template

Every project should have a README with these 6 sections:

```
# [Project Title]

## Problem
[One paragraph. What is the business question?]

## Data
[Where the data came from. Include row counts and any cleaning caveats.]

## Approach
[Bullet points. High level of what you did.]

## Key Findings
[3 to 5 findings with a chart or number for each.]

## Tech Stack
[List: Python, pandas, seaborn, Streamlit]

## How to Reproduce
[Steps to clone, install requirements, run notebook or app.]
```

---

## Portfolio structuring tips

- Pin these 5 projects to your GitHub profile so they show first.
- Each project should have a clean commit history (no "final final v2" commit messages).
- Add screenshots of the dashboards or charts inline in the README.
- Link to a live version if possible (Streamlit Community Cloud is free).

---

If you want mentors to review your projects before you apply to Canadian companies, check out ORU at [joinoru.com](http://joinoru.com).