# Canadian Bank Hiring Guide
---

## Why This Guide Is Different

This is not a generic interview prep guide. This is written from 4 years of experience inside RBC as a Data Engineer. It covers how the hiring process actually works from the inside — what happens before your resume reaches a hiring manager, how interviews are structured, and what gives candidates an unfair advantage.

---

## The 5 Biggest Canadian Banks and Their Hiring Profiles

| Bank | Tech Hub | Key Roles | Stack |
| --- | --- | --- | --- |
| RBC | Toronto (Borealis AI, RBC Amplify) | Data Engineer, ML Engineer, Data Analyst | Azure, Databricks, Python, SQL |
| TD Bank | Toronto (TD Lab) | Data Analyst, Software Engineer, BA | AWS, Tableau, Python |
| Scotiabank | Toronto (Digital Factory) | Data Engineer, Full Stack, DevOps | GCP, dbt, Python |
| BMO | Toronto | Data Analyst, Risk Analyst, Cloud Engineer | Azure, Power BI, SQL |
| CIBC | Toronto | Data Analyst, Software Engineer | AWS, Python, Power BI |

---

## Stage 1 — How Your Resume Gets Filtered

Before any human sees your resume, it goes through an ATS (Applicant Tracking System). Canadian banks use Workday, Taleo, or SuccessFactors.

### How ATS Works at Canadian Banks

The system scans for exact keyword matches from the job description. It is not intelligent — it is literal. "Data Engineering" and "Data Engineer" are treated differently by some systems. "Power BI" and "PowerBI" may be treated differently.

### What to Do

Copy the job description into a document. Highlight every technical skill, tool, and methodology. Cross-reference with your resume. Add missing keywords naturally into your bullet points. Do not stuff keywords — add them where they are genuinely applicable.

### Keywords That Appear Most in Canadian Bank Job Postings

Data roles: SQL, Python, Tableau, Power BI, Excel, Azure, AWS, Databricks, dbt, Spark, ETL, data modeling, data warehousing, Agile

Software roles: Java, Python, REST APIs, microservices, CI/CD, Docker, Kubernetes, Azure DevOps, GitHub

BA roles: requirements gathering, JIRA, Confluence, Agile, Scrum, stakeholder management, SQL, Power BI

---

## Stage 2 — The Multi-Round Interview Structure

Canadian bank interviews are typically 3 to 4 rounds. Most candidates prepare only for one type of interview and get surprised by the others.

### Round 1 — HR Screen (30 minutes, phone or video)

What they are assessing: Are you who your resume says you are? Are you a communication risk?

What to prepare:

- Your 2-minute professional summary (who you are, what you have done, why this role)
- Why this bank specifically (not just "I like finance" — be specific about the team or initiative)
- Salary expectations — research the range on Glassdoor and LinkedIn Salary before this call
- Work authorization status if applicable

### Round 2 — Technical Interview (60 to 90 minutes)

What they are assessing: Can you actually do the job?

For data roles this typically includes:

- 2 to 3 SQL problems (live coding or whiteboard)
- Python or Excel questions depending on the role
- A data scenario or case study
- Questions about tools on your resume — if you listed Databricks, know Databricks

For software roles:

- DSA problems (LeetCode medium difficulty is the typical benchmark at Canadian banks)
- System design (for senior roles)
- Code review or debugging exercise

### Round 3 — Hiring Manager Interview (45 to 60 minutes)

What they are assessing: Can I work with this person? Will they fit the team?

This round is heavily behavioral. Prepare STAR stories for:

- A time you dealt with a difficult stakeholder
- A time you worked with messy or incomplete data
- A time you delivered something under a tight deadline
- A time you identified a problem nobody else noticed
- A time you had to learn something new quickly

Also prepare thoughtful questions to ask. Hiring managers remember candidates who asked smart questions.

### Round 4 — Panel or Senior Leadership (30 to 45 minutes)

Not always present but common for senior roles. Multiple interviewers, mix of behavioral and technical. Stay consistent with what you said in previous rounds — hiring teams debrief together.

---

## Stage 3 — The Referral Advantage

This is the biggest unlock most candidates miss.

Canadian banks pay their employees a referral bonus — typically $1,000 to $3,000 CAD — for referring a candidate who gets hired. This means employees are incentivized to refer people.

### How to Get a Referral

1. Find the job posting on LinkedIn
2. Search for people who work at that bank in a similar role or team
3. Connect with a short personalized note: "Hi, I noticed you work at [bank] in [team]. I am applying for the [role] position and would love any insight into the team. If you are comfortable referring me, I would really appreciate it — no pressure at all."
4. Attach your resume
5. Follow up once after 5 to 7 days if no response

A referral does not guarantee an interview but it moves your resume from the ATS pile to a human's inbox. That alone dramatically improves your odds.

---

## Stage 4 — The "Canadian Experience" Myth

Many immigrants believe they cannot get a bank job without prior Canadian experience. This is not true — but there is a kernel of truth worth understanding.

What Canadian banks actually care about:

- Domain knowledge: do you understand banking concepts, financial products, risk, regulatory compliance?
- Communication: can you communicate clearly with Canadian stakeholders?
- Cultural fit: do you understand how Canadian workplaces operate (flat hierarchy, collaborative, direct feedback)?

What they do not require:

- Prior Canadian work experience if your international experience is strong and relevant
- A Canadian degree if your foreign degree is from a recognized institution

How to address it: In your cover letter and interview, explicitly reference Canadian banking context. Mention specific Canadian regulations (OSFI, FINTRAC), Canadian financial products, or specific initiatives the bank has announced. This signals domain awareness even without Canadian work history.

---

## Stage 5 — Proving Domain Knowledge Through Projects

The fastest way to overcome the "no Canadian banking experience" objection is to build projects that demonstrate you already understand banking problems. This section gives you specific project ideas for three roles — Data, Software Engineering, and Business Analyst — each with a public dataset, a clear scope, and the banking concepts it demonstrates.

You do not need to have worked at a bank. You need to show you can think like someone who does. A project built on a real banking scenario tells a hiring manager three things at once: you understand the business problem, you have the technical skills to solve it, and you took initiative without being asked.

---

### Data Roles — Project Ideas

---

#### Project 1 — Credit Risk Scoring Model

**The business problem:** Banks approve or reject loan applications every day based on how likely a borrower is to default. This is called credit risk. Building a model that predicts default probability is one of the most fundamental problems in Canadian banking and something every data team at RBC, TD, and Scotiabank works on.

**Dataset:**

Home Credit Default Risk — Kaggle

[kaggle.com/c/home-credit-default-risk](http://kaggle.com/c/home-credit-default-risk)

This dataset has 300,000+ loan applications with features like income, credit history, loan amount, and a binary target (1 = defaulted, 0 = repaid). It is one of the most realistic credit risk datasets publicly available.

Alternative: German Credit Data

[kaggle.com/datasets/uciml/german-credit](http://kaggle.com/datasets/uciml/german-credit)

Smaller and cleaner, good for beginners. 1,000 customers with credit risk labels.

**What to build:**

Step 1: Load the data and perform exploratory analysis. What is the default rate? Which features correlate most with default? Are there missing values and how should they be handled?

Step 2: Clean and engineer features. Handle missing values. Create derived features like debt-to-income ratio. Encode categorical variables.

Step 3: Build a baseline model using logistic regression. Evaluate using precision, recall, and AUC-ROC. Logistic regression is interpretable and banks prefer explainable models over black box ones — mention this in your presentation.

Step 4: Try a gradient boosting model (XGBoost or LightGBM) and compare results. Identify the top 10 most important features.

Step 5: Document your findings as if presenting to a risk committee. What is the trade-off between approving more loans (higher recall) and reducing defaults (higher precision)? This business framing is what separates a portfolio project from a real analysis.

**Banking concepts demonstrated:** Probability of default (PD), credit scoring, Basel III risk framework, model interpretability, precision-recall trade-off in risk decisions

**Resume bullet point:** Built a credit risk scoring model on 300,000+ loan applications using XGBoost, achieving 0.76 AUC-ROC. Analyzed precision-recall trade-offs and documented findings in a risk committee presentation format.

---

#### Project 2 — Customer Churn Analysis for a Bank

**The business problem:** Canadian banks spend enormous resources retaining customers. A customer who closes their chargeable accounts costs the bank not just the revenue from that account but the lifetime value of all future products they might have purchased. Identifying at-risk customers before they leave is a high-priority problem for every Canadian bank's analytics team.

**Dataset:**

Bank Customer Churn Dataset — Kaggle

[kaggle.com/datasets/gauravtopre/bank-customer-churn-dataset](http://kaggle.com/datasets/gauravtopre/bank-customer-churn-dataset)

10,000 customers with demographics, account details, product holdings, and a churn label. Columns include credit score, country, gender, age, tenure, balance, number of products, credit card ownership, active membership status, estimated salary, and whether the customer exited.

**What to build:**

Step 1: Exploratory analysis. What is the overall churn rate? Is it higher for certain demographics, geographies, or tenure groups? Build a churn rate table by each categorical variable.

Step 2: Deep dive on the strongest predictors. Age, number of products, and active membership are typically the strongest signals in this dataset. Show this visually with bar charts and a correlation heatmap.

Step 3: Build a churn risk model (logistic regression or random forest). Evaluate with precision, recall, and F1-score. Handle class imbalance using SMOTE or class weight adjustment.

Step 4: Create a churn risk segmentation. Using CASE WHEN in SQL or pd.cut in Python, assign each active customer a risk label (High, Medium, Low) based on the model's predicted probability or rule-based thresholds.

Step 5: Write a retention strategy recommendation. Which segment should the retention team call first? What offer might reduce churn for the highest-risk segment? This is the business deliverable that makes the project stand out.

**Banking concepts demonstrated:** Customer lifetime value (CLV), retention strategy, product cross-sell, churn modeling, customer segmentation

**Resume bullet point:** Analyzed bank customer churn across 10,000 accounts using Python. Identified age and product holdings as the strongest churn predictors. Built a risk segmentation model and recommended a targeted retention strategy for the high-risk cohort.

---

#### Project 3 — Fraud Detection Pipeline

**The business problem:** Canadian banks are legally required under FINTRAC (Financial Transactions and Reports Analysis Centre of Canada) to detect and report suspicious financial activity. Every major bank has a fraud analytics team. Building a system that flags suspicious transactions — even a simple rule-based one — demonstrates you understand this problem domain.

**Dataset:**

Credit Card Fraud Detection — Kaggle

[kaggle.com/datasets/mlg-ulb/creditcardfraud](http://kaggle.com/datasets/mlg-ulb/creditcardfraud)

284,807 real anonymized credit card transactions with 492 fraud cases. The extreme class imbalance (0.17% fraud rate) is itself a teaching moment — this mirrors the real challenge banks face.

**What to build:**

Step 1: Load the data and immediately note the class imbalance. Calculate the fraud rate. Visualize the distribution of transaction amounts for fraud vs non-fraud cases.

Step 2: Build a rule-based flagging system first. Flag transactions that are more than 3 standard deviations above the average amount, or that occur in the middle of the night (if time data is available). Calculate the precision and recall of your rules alone.

Step 3: Build a machine learning model. Try logistic regression with class weighting, then a Random Forest. Evaluate on recall specifically — in fraud detection, missing a real fraud (false negative) is more costly than a false alarm (false positive). Explain this trade-off.

Step 4: Combine rules and model into a tiered flagging system. Transactions flagged by both rules and model = High risk. Flagged by one = Medium. Neither = Low. Present the final flagged transaction list.

Step 5: Document the AML (Anti-Money Laundering) context. Briefly explain what FINTRAC requires Canadian banks to report and why automated detection matters. One paragraph showing you understand the regulatory context goes a long way.

**Banking concepts demonstrated:** Fraud detection, AML, FINTRAC compliance, class imbalance, precision-recall trade-off in high-stakes decisions

**Resume bullet point:** Built a fraud detection pipeline on 284,000+ transactions combining rule-based flagging and a Random Forest classifier. Addressed 0.17% class imbalance using SMOTE. Documented findings in the context of FINTRAC reporting requirements.

---

#### Project 4 — Financial KPI Dashboard (Power BI or Tableau)

**The business problem:** Bank executives review KPI dashboards every Monday morning. These dashboards track loan portfolio performance, deposit growth, product adoption, and regional revenue. Building a clean, executive-ready financial dashboard demonstrates data visualization skills and business communication — two things banks value highly.

**Dataset:**

World Bank Financial Inclusion Data — [data.worldbank.org/topic/financial-sector](http://data.worldbank.org/topic/financial-sector)

Free, downloadable, covers financial access and banking metrics across countries and years.

Alternative: Statistics Canada Banking and Financial Data — [statcan.gc.ca](http://statcan.gc.ca)

Search for "chartered banks" or "credit market" datasets. Real Canadian data.

**What to build:**

Page 1: Portfolio overview. Total loans, total deposits, number of active accounts, month-over-month growth rates. Use KPI cards at the top and trend lines below.

Page 2: Regional breakdown. Revenue or loan volume by province. Use a map visual and a bar chart ranked by performance. Include a year-over-year comparison.

Page 3: Product mix analysis. What percentage of customers hold multiple products (current account, savings, credit card, mortgage)? Show the cross-sell opportunity.

Publish to Tableau Public (free) or export as PDF if using Power BI Desktop. Add the link to your LinkedIn and GitHub README.

**Banking concepts demonstrated:** KPI design, executive reporting, loan portfolio, deposit growth, product cross-sell, regional banking operations

**Resume bullet point:** Built a 3-page interactive banking KPI dashboard in Tableau using World Bank financial data. Covered portfolio overview, regional performance, and product mix analysis. Published to Tableau Public.

---

### Software Engineering Roles — Project Ideas

---

#### Project 5 — Core Banking REST API

**The business problem:** Every bank runs on a core banking system — a backend that handles accounts, transactions, and balances. Building a simplified version demonstrates you understand transactional systems, data integrity, and API design. These are the exact concepts SWE teams at Canadian banks work with every day.

**Dataset:** No external dataset needed. You generate the data as part of the system.

**What to build:**

Build a REST API with the following endpoints:

POST /accounts — create a new bank account with customer ID, account type (chequing or savings), and initial balance.

GET /accounts/{id} — retrieve account details and current balance.

POST /accounts/{id}/deposit — deposit an amount. Validate that the amount is positive. Return the updated balance.

POST /accounts/{id}/withdraw — withdraw an amount. Validate sufficient funds. Return an error with a clear message if balance is insufficient. Never allow a negative balance.

POST /transfers — transfer between two accounts atomically. This is the most important endpoint. Both the debit and the credit must succeed or both must fail. This is a database transaction — use BEGIN, COMMIT, and ROLLBACK.

GET /accounts/{id}/transactions — return the full transaction history for an account with timestamps, amounts, and transaction types.

**Tech stack:** FastAPI (Python) or Express (Node.js). PostgreSQL for the database. SQLAlchemy or pg for the ORM. JWT for basic authentication. Pytest or Jest for unit tests. Deploy to Railway or Render free tier.

**What to document:** Explain how atomic transfers work in your README. Explain what happens if the server crashes mid-transfer. This shows you understand data integrity — a critical concept in banking.

**Banking concepts demonstrated:** Core banking operations, ACID transactions, account ledger, idempotency, API security

**Resume bullet point:** Built a core banking REST API using FastAPI and PostgreSQL implementing account management, deposits, withdrawals, and atomic transfers. Deployed to cloud with JWT authentication and 85% test coverage.

---

#### Project 6 — Loan Application Processing System

**The business problem:** When a customer applies for a loan online at a Canadian bank, their application goes through an automated intake system that validates inputs, checks eligibility rules, and routes the application to the right team. Building this system shows you understand backend validation, business rules, and database design in a financial context.

**Dataset:** Use the German Credit or Home Credit dataset as the basis for your eligibility scoring logic.

**What to build:**

Step 1: Build the intake API. POST /applications accepts: applicant name, date of birth, annual income, employment status, loan amount requested, loan purpose, credit score (self-reported for simplicity). Validate every field — income must be positive, loan amount must be within allowed range, applicant must be over 18.

Step 2: Implement a simple eligibility scoring engine. Rules: Debt-to-income ratio below 40% (loan payment divided by monthly income). Credit score above 600. Employment status is employed or self-employed. If all three pass, status = Approved for Review. If one fails, status = Referred. If two or more fail, status = Declined.

Step 3: Store all applications in a PostgreSQL database with a full audit trail — every status change logged with a timestamp and reason.

Step 4: Build a GET /applications/{id} endpoint that returns the application status and the reason for any decline.

Step 5: Add a simple admin dashboard using Streamlit that shows all applications, their statuses, and a summary of decline reasons.

**Banking concepts demonstrated:** Loan origination, credit eligibility rules, debt-to-income ratio, audit trail, regulatory record-keeping

**Resume bullet point:** Built an automated loan application processing system with eligibility scoring engine, full audit trail, and admin dashboard. Implemented debt-to-income and credit score rules aligned with Canadian lending standards.

---

### Business Analyst Roles — Project Ideas

---

#### Project 7 — Canadian Mortgage Market Analysis

**The business problem:** Every Canadian bank's strategy team tracks the mortgage market closely. Who is borrowing, how much, in which regions, and what the approval rates look like — these are questions a BA at a Canadian bank might be asked to analyze for a product review.

**Dataset:**

CMHC (Canada Mortgage and Housing Corporation) Open Data

[cmhc-schl.gc.ca/en/data-and-research](http://cmhc-schl.gc.ca/en/data-and-research)

Free, publicly available. Includes mortgage loan insurance data, housing starts, and mortgage arrears by province.

Statistics Canada Housing Data

[statcan.gc.ca](http://statcan.gc.ca) — search "residential mortgage" or "housing starts"

Free downloads, real Canadian data.

**What to build:**

Step 1: Download the CMHC mortgage insurance data. Load into Excel or Python. Clean for missing values and inconsistent region names.

Step 2: Analyze approval trends over the past 3 to 5 years. Has the approval rate changed? In which provinces did volumes grow most? Is there a difference between first-time buyer applications and renewals?

Step 3: Compare average loan-to-value (LTV) ratios by province. Higher LTV = higher risk. Flag provinces where average LTV is increasing.

Step 4: Build an Excel or Power BI report with three tabs: Executive Summary (3 key findings and 1 recommendation), Regional Analysis (province-level charts), and Data Appendix (the cleaned raw data with source notes).

Step 5: Write a 1-page business analysis memo as if presenting to the Head of Retail Lending. State the market trend, the risk implication, and the recommended response. This document is your portfolio piece.

**Banking concepts demonstrated:** Mortgage lending, loan-to-value ratio (LTV), CMHC insurance, first-time buyer programs, Canadian housing market, business memo writing

**Why this stands out:** Using real CMHC and Statistics Canada data signals you know where Canadian banking data lives. Most candidates use generic datasets. This immediately marks you as someone who did their homework.

---

#### Project 8 — Branch Performance Scorecard

**The business problem:** Canadian banks have hundreds of branches across the country. Regional managers need a structured way to compare branch performance and identify which locations need support. Building a scorecard that ranks branches is a classic BA deliverable.

**Dataset:**

Create a structured mock dataset using Excel or Python's Faker library. Generate 50 fictional branches with realistic metrics:

Columns to include: Branch ID, City, Province, Total deposits this quarter, Total loans originated, Number of new accounts opened, Customer satisfaction score (1 to 5), Average wait time (minutes), Number of complaints, Year-over-year revenue change.

Alternative: Use Statistics Canada economic data by CMA (Census Metropolitan Area) as a proxy for branch market potential.

**What to build:**

Step 1: Define 5 KPIs and assign weights. Example: Customer satisfaction (25%), Deposit growth (25%), Loan origination (20%), New account openings (15%), Complaint rate (15%). Document the rationale for each weight.

Step 2: Normalize each KPI to a 0 to 100 scale so they are comparable despite different units.

Step 3: Calculate a composite score for each branch by multiplying each normalized KPI by its weight and summing. Rank branches from highest to lowest.

Step 4: Segment branches into three tiers — High Performing, Needs Improvement, At Risk — using thresholds on the composite score.

Step 5: Build a Power BI or Tableau dashboard with a branch ranking table, a map showing performance by province, and a drill-down view for individual branch KPIs. Write a one-page executive summary with your top 3 findings and 2 recommendations.

**Banking concepts demonstrated:** Branch banking operations, KPI design and weighting, performance management, tiered segmentation, executive communication

---

#### Project 9 — OSFI Regulatory Compliance Gap Analysis

**The business problem:** Every Canadian bank is regulated by OSFI (Office of the Superintendent of Financial Institutions). OSFI publishes guidelines that banks must follow. A BA who understands OSFI guidelines is immediately more valuable than one who does not. Building a gap analysis document using a real OSFI guideline demonstrates regulatory awareness that very few candidates have.

**Dataset:**

OSFI Public Guidelines — [osfi-bsif.gc.ca/en/guidance](http://osfi-bsif.gc.ca/en/guidance)

Free, publicly available. Start with Guideline B-20: Residential Mortgage Underwriting Practices and Procedures. This is one of the most referenced guidelines in Canadian banking and directly affects how banks approve mortgages.

**What to build:**

Step 1: Read OSFI Guideline B-20. It is approximately 20 pages. Summarize each of the 6 key expectations in plain language (2 to 3 sentences each).

Step 2: Create a fictional bank called "Northern Trust Bank" with a brief profile — size, provinces served, mortgage portfolio size.

Step 3: Build a gap analysis table in Excel with these columns: OSFI Requirement, Current State at Northern Trust, Gap Identified (Yes/No), Risk Level (High/Medium/Low), Recommended Action, Timeline.

Step 4: Fill in 10 to 12 rows with realistic scenarios. For example: OSFI requires stress testing at the higher of the contract rate plus 2% or 5.25%. Northern Trust only stress tests at the contract rate plus 1%. Gap: Yes. Risk: High. Recommendation: Update underwriting policy immediately.

Step 5: Write a 2-page executive summary addressed to the Chief Risk Officer. State the overall compliance posture, the top 3 gaps, and the prioritized remediation plan.

**Banking concepts demonstrated:** OSFI regulation, B-20 mortgage underwriting guideline, stress testing, gap analysis methodology, risk assessment, compliance documentation, executive writing

**Why this stands out:** Almost no candidate applying for BA roles at Canadian banks knows what OSFI is. Mentioning B-20, stress testing, or FINTRAC in your interview immediately signals you have done serious domain preparation. This project gives you that vocabulary and more importantly, the confidence to use it accurately.

---

### How to Present These Projects at Canadian Bank Interviews

Put every project on GitHub with a clean README. The README should explain the business problem in the first paragraph, the dataset and approach in the second, the key findings or what you built in the third, and what you would add or do differently in the fourth. A recruiter reading your GitHub should understand the project in 60 seconds without opening a single file.

In your interview, always lead with the business context before the technical details. Do not say "I built a logistic regression model." Say "I analyzed a credit risk dataset to predict loan defaults — the kind of problem RBC's risk team deals with daily. I found that debt-to-income ratio and credit score were the strongest predictors, and I documented the precision-recall trade-off the same way a real risk committee would review it."

Mentioning specific Canadian banking terms like OSFI, FINTRAC, CMHC, B-20, LTV, probability of default, and Basel III in the right context signals you built these projects with serious intent. That is the difference between a portfolio piece and a conversation starter.

The fastest way to overcome the "no Canadian banking experience" objection is to build projects that demonstrate you already understand banking problems. This is exactly what hiring managers mean when they say they want domain knowledge.

You do not need to have worked at a bank. You need to show you can think like someone who does.

### Why Projects Work

A project built on a real banking scenario tells a hiring manager three things at once: you understand the business problem, you have the technical skills to solve it, and you took initiative without being asked. That combination is rare and memorable.

### Data Roles — Project Ideas with Public Datasets

**Credit Risk Scoring Model**

Build a model that predicts whether a loan applicant is likely to default. This is one of the most fundamental problems in Canadian banking.

Dataset: German Credit Data on Kaggle ([kaggle.com/datasets/uciml/german-credit](http://kaggle.com/datasets/uciml/german-credit)) or Home Credit Default Risk ([kaggle.com/c/home-credit-default-risk](http://kaggle.com/c/home-credit-default-risk))

What to do: Clean the data, perform exploratory analysis, build a logistic regression or decision tree classifier, evaluate with precision and recall. Document your findings as if presenting to a risk committee.

Banking concepts demonstrated: Credit risk, probability of default, risk scoring, model evaluation

**Customer Churn Analysis for a Bank**

Identify which bank customers are most likely to close their accounts and what factors predict churn.

Dataset: Bank Customer Churn Dataset on Kaggle ([kaggle.com/datasets/gauravtopre/bank-customer-churn-dataset](http://kaggle.com/datasets/gauravtopre/bank-customer-churn-dataset))

What to do: Segment customers by churn status, find the strongest predictors, calculate churn rate by product type and tenure, build a risk profile of at-risk customers.

Banking concepts demonstrated: Customer lifetime value, retention strategy, product analytics

**Fraud Detection Pipeline**

Build a rule-based and statistical system to flag suspicious transactions.

Dataset: Credit Card Fraud Detection on Kaggle ([kaggle.com/datasets/mlg-ulb/creditcardfraud](http://kaggle.com/datasets/mlg-ulb/creditcardfraud))

What to do: Analyze the class imbalance, build flagging rules using CASE WHEN in SQL or conditional logic in Python, evaluate false positive and true positive rates, document the trade-offs.

Banking concepts demonstrated: Fraud risk, AML (Anti-Money Laundering), transaction monitoring

**Financial Dashboard (Power BI or Tableau)**

Build an executive-level dashboard showing key banking metrics.

Dataset: World Bank Financial Inclusion Data ([data.worldbank.org](http://data.worldbank.org)) or any public Canadian financial dataset from Statistics Canada ([statcan.gc.ca](http://statcan.gc.ca))

What to do: Pull the data, clean it, build a 3-page interactive dashboard with KPIs, trends, and drill-downs. Publish to Tableau Public or export as a PDF.

Banking concepts demonstrated: KPI reporting, financial literacy, data visualization for non-technical audiences

---

### Software Engineering Roles — Project Ideas with Public Datasets

**Banking Transaction API**

Build a REST API that handles basic banking operations — create account, deposit, withdraw, transfer, check balance.

Dataset: No external dataset needed. Generate mock data or use Faker library in Python.

What to do: Build with FastAPI or Express, add authentication with JWT, write unit tests, deploy to a free cloud service (Railway, Render, or AWS Lambda free tier). Document the API with Swagger.

Banking concepts demonstrated: Core banking systems, API design, security, transaction logic

**Loan Application Processing System**

Build a backend system that accepts loan applications, validates inputs, calculates a basic credit score using provided fields, and returns an approval decision.

Dataset: Use the Home Credit or German Credit dataset as the basis for your scoring logic.

What to do: Build the intake form and validation logic, implement a simple scoring algorithm, store results in a SQLite or PostgreSQL database, expose results via API endpoints.

Banking concepts demonstrated: Loan origination, credit scoring, data validation, system design

**Real-Time Transaction Monitoring Dashboard**

Build a system that simulates a stream of transactions and flags suspicious ones in near real time.

Dataset: Generate mock transaction data using Python. Use the fraud dataset patterns as a basis for your flagging rules.

What to do: Use Python to simulate a transaction stream, apply flagging logic, display flagged transactions in a simple Streamlit dashboard that updates every few seconds.

Banking concepts demonstrated: Real-time monitoring, fraud detection, alerting systems

---

### Business Analyst Roles — Project Ideas with Public Datasets

**Mortgage Market Analysis**

Analyze Canadian mortgage data to identify trends in approval rates, loan amounts, and borrower profiles.

Dataset: Canada Mortgage and Housing Corporation (CMHC) open data ([cmhc-schl.gc.ca/en/data-and-research](http://cmhc-schl.gc.ca/en/data-and-research)) or Statistics Canada housing data.

What to do: Download the data, clean it in Excel or Python, build pivot tables and charts, write a 2-page business analysis report as if presenting to a bank's product team. Include a recommendation.

Banking concepts demonstrated: Mortgage products, housing market analysis, business writing

**Branch Performance Scorecard**

Build a scorecard that ranks fictional bank branches by performance using publicly available proxy data.

Dataset: Use Statistics Canada economic data by region or create a structured mock dataset with realistic metrics.

What to do: Define KPIs (customer satisfaction, loan volume, account openings, complaint rate), weight them, calculate a composite score per branch, visualize in Excel or Power BI, present as a BA deliverable.

Banking concepts demonstrated: Performance management, KPI design, branch banking operations

**Regulatory Compliance Checklist and Gap Analysis**

Research OSFI (Office of the Superintendent of Financial Institutions) guidelines and build a structured gap analysis document for a fictional bank.

Dataset: OSFI public guidelines at [osfi-bsif.gc.ca](http://osfi-bsif.gc.ca) (free, publicly available regulatory documents)

What to do: Pick one OSFI guideline (e.g., B-20 on residential mortgage underwriting), summarize the key requirements in plain language, create a gap analysis table showing compliant vs non-compliant areas for a fictional bank, and write recommendations.

Banking concepts demonstrated: Regulatory compliance, OSFI, risk management, BA documentation skills

---

### How to Present These Projects at Canadian Bank Interviews

Put every project on GitHub with a clean README. The README should explain the business problem, the approach, the dataset used, the key findings, and what you would do differently or add next.

In your interview, lead with the business context before the technical details. Do not say "I built a logistic regression model." Say "I analyzed a credit risk dataset and built a model to predict loan defaults — the kind of problem RBC's risk team deals with every day. Here is what I found."

Mentioning specific Canadian banking concepts (OSFI, FINTRAC, CMHC, residential mortgage underwriting, Basel III) signals that you did not just build a generic project — you built it with the Canadian banking context in mind. That is the difference.

---

## What Canadian Banks Actually Value Beyond the Resume

Having hired and worked alongside people at RBC, here is what actually stands out:

Curiosity about the business, not just the technology. Engineers and analysts who understand why they are building something, not just how.

Clear communication under pressure. Can you explain a technical finding to a non-technical stakeholder in 60 seconds?

Ownership mentality. Canadian banks have large, slow-moving systems. People who proactively identify and fix problems without being asked stand out immediately.

Documentation habits. RBC, TD, and Scotiabank all have institutional knowledge loss problems. People who document their work well are valued more than they realize.

---

## Where to Find Canadian Bank Job Postings

RBC Careers — [jobs.rbc.com](http://jobs.rbc.com)

TD Careers — [jobs.td.com](http://jobs.td.com)

Scotiabank Careers — [scotiabank.com/careers](http://scotiabank.com/careers)

BMO Careers — [jobs.bmo.com](http://jobs.bmo.com)

CIBC Careers — [cibc.com/careers](http://cibc.com/careers)

LinkedIn — filter by company name, Canada, posted in last 7 days

Government of Canada Job Bank — [jobbank.gc.ca](http://jobbank.gc.ca) (also lists bank roles)

---

## Salary Ranges at Canadian Banks (2026)

| Role | Entry Level | Mid Level | Senior |
| --- | --- | --- | --- |
| Data Analyst | $65,000 – $80,000 | $80,000 – $100,000 | $100,000 – $130,000 |
| Data Engineer | $85,000 – $105,000 | $105,000 – $130,000 | $130,000 – $160,000 |
| Software Engineer | $80,000 – $100,000 | $100,000 – $130,000 | $130,000 – $165,000 |
| Business Analyst | $65,000 – $85,000 | $85,000 – $105,000 | $105,000 – $130,000 |

Note: These are base salaries. Canadian banks also offer pension plans, health benefits, RRSP matching, and annual bonuses.

---

### Want to Build Real Analytics Projects?

ORU's **Hands-On Data Analytics** course teaches you to think like a practitioner and execute like one — through realistic business problems across insurance, banking, fintech, and ecommerce. Tools covered include Python, SQL, BigQuery, dbt Core, Tableau, Power BI, Streamlit, and Vanna AI.

Use code **ORU10** for 10% off → [Enroll Now](https://joinoru.com/course/hands-on-data-analytics:-learn-by-building-industry-projects)

*For mentorship, live sessions, and community support: [joinoru.com](https://joinoru.com)*
