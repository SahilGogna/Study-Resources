# Python Projects (Resource Doc)

---

These 5 projects are chosen specifically because they mirror what real data and engineering roles in Canada require day to day. Each one demonstrates a distinct set of skills that recruiters and hiring managers look for. Build them, document them on GitHub, and you will have a portfolio that speaks louder than any certification.

---

## Project 1 — Automated Job Tracker

### What It Is

A Python script that automatically collects job postings from job boards, stores them, and sends you a daily summary. The idea is simple but the implementation touches real engineering skills.

### Why It Impresses Employers

It shows you can automate a real workflow end to end. Any recruiter looking at this immediately understands you know web scraping, data storage, and notification systems — three things that come up in data engineering and automation roles constantly.

### Skills It Demonstrates

Web scraping, file handling, working with CSV or databases, email automation, scheduling scripts, error handling

### High Level Architecture

```
Job Board (LinkedIn / Indeed / Job Bank)
        |
        v
Python Scraper
(requests + BeautifulSoup)
        |
        v
Data Cleaning Layer
(filter duplicates, format fields)
        |
        v
CSV or SQLite Storage
        |
        v
Daily Email Summary
(smtplib or SendGrid API)
```

### Flow Explained

The script hits a job board URL, parses the HTML to extract job title, company, location, and posting date. It then cleans the data, removes duplicates from previous runs, and appends new entries to a CSV file or SQLite database. Finally it formats a summary and sends it to your email. You can schedule it to run every morning using a cron job or Windows Task Scheduler.

### Stretch Goal

Add a keyword filter so the tracker only saves jobs that match your target role. Add a score column that ranks each job by how well it matches your skills.

### How to Present It on GitHub

README should include: what the project does, why you built it, a screenshot of the email output, setup instructions, and a note on what you learned. Name the repo something like job-tracker-automation, not project1 or python-script.

---

## Project 2 — Sales Dashboard with Pandas and Matplotlib

### What It Is

A data analysis and visualization project where you take a real public dataset, clean it, analyze it, and produce a visual dashboard.

### Why It Impresses Employers

This is the closest thing to a real data analyst's daily job. You are taking raw data, transforming it, and producing something a business person can actually read. Almost every data role interview will ask you something that this project prepares you for.

### Skills It Demonstrates

Data cleaning, aggregation, groupby operations, data visualization, working with large datasets, translating data into insights

### High Level Architecture

```
Public Dataset
(Google BigQuery Public Data or Kaggle)
        |
        v
Pandas Data Loading
(read_csv or BigQuery client)
        |
        v
Cleaning Layer
(handle nulls, fix data types, remove outliers)
        |
        v
Aggregation and Analysis
(groupby, pivot, resample)
        |
        v
Visualization Layer
(Matplotlib or Seaborn charts)
        |
        v
Dashboard Output
(saved as PNG or interactive HTML via Plotly)
```

### Flow Explained

You load a dataset — a good one for this project is the Chicago sales dataset or any retail dataset from BigQuery public data. You clean it by handling missing values and fixing data types. Then you run aggregations: total sales by region, month over month growth, top performing products. Finally you build charts for each insight and either save them as images or combine them into an interactive Plotly dashboard.

### Stretch Goal

Add a second dataset and join them to answer a cross-dataset business question. For example, sales data joined with weather data to see if weather affects purchasing patterns.

### How to Present It on GitHub

Include the dataset source link, a few sample charts in the README, and a short paragraph describing the business questions you answered. Recruiters want to see that you thought like an analyst, not just that you ran some code.

---

## Project 3 — Resume Parser

### What It Is

A tool that reads a PDF resume and automatically extracts structured information — name, contact details, skills, and work experience — and outputs it in a clean format.

### Why It Impresses Employers

You are essentially building a basic ATS (Applicant Tracking System) component. Companies like Workday, Greenhouse, and Lever all have resume parsers at their core. Building one shows you understand file handling, text processing, and real world problem solving. It is also a conversation starter in any interview.

### Skills It Demonstrates

PDF parsing, regular expressions, string manipulation, data extraction, structuring unstructured data, file I/O

### High Level Architecture

```
PDF Resume File
        |
        v
Text Extraction Layer
(PyPDF2 or pdfplumber)
        |
        v
Section Detection
(identify headers: Experience, Education, Skills)
        |
        v
Information Extraction
(regex patterns for email, phone, dates, names)
        |
        v
Structured Output
(JSON or CSV with extracted fields)
```

### Flow Explained

The script takes a PDF file as input and converts it to raw text. It then uses pattern matching to identify sections of the resume. Within each section it applies specific extraction logic — for example, a regex pattern to find email addresses and phone numbers, keyword matching to pull out skills, and date pattern recognition to extract experience timelines. The output is a clean JSON object with all the structured information.

### Stretch Goal

Add a comparison feature. Pass in a job description and your resume and have the tool calculate a match score based on keyword overlap. This is exactly what ATS systems do.

### How to Present It on GitHub

Include a sample anonymized resume in the repo for testing. Show a before (raw PDF) and after (extracted JSON) example in the README. This visual contrast is very effective.

---

## Project 4 — Expense Tracker with a Database

### What It Is

A command line application that lets you log expenses, categorize them, store them in a local database, and query monthly summaries.

### Why It Impresses Employers

Simple idea, but it proves you can connect Python to a database — which is a must-have skill for nearly every data and backend role. The fact that you added categories and summary queries shows you think about data structure, not just code.

### Skills It Demonstrates

SQLite and SQL queries, database schema design, Python to database connection, CRUD operations, data aggregation from a database, optional predictive analysis

### High Level Architecture

```
User Input
(command line or simple form)
        |
        v
Input Validation
(check amount is a number, date is valid, category exists)
        |
        v
SQLite Database
(transactions table: id, date, amount, category, note)
        |
        v
Query Layer
(monthly totals, spending by category, trends)
        |
        v
Output
(terminal summary or Matplotlib chart)
```

### Flow Explained

The user enters a transaction — amount, category, date, and an optional note. The script validates the input and inserts it into an SQLite database. The database has a clean schema with a transactions table. The query layer lets you pull monthly summaries, see spending by category, or compare this month to last month. If you add the predictive analysis stretch goal, you train a simple linear regression on past months to forecast next month's spending.

### Stretch Goal

Add a budget feature. Set a monthly budget per category and have the tool alert you when you are approaching the limit. This turns it from a tracker into an actual financial tool.

### How to Present It on GitHub

Show the database schema in the README. Include a sample output screenshot. Mention the SQL queries you used to generate the summaries — recruiters who care about SQL will notice.

---

## Project 5 — API Data Pipeline

### What It Is

A pipeline that pulls live data from a public API, transforms and cleans it using Pandas, and stores it in a structured format ready for analysis. This is the most important project in this list.

### Why It Impresses Employers

This is the closest thing to what a real data engineer or analyst does on day one of their job. Real companies are constantly pulling data from APIs, transforming it, and storing it. Building this project and explaining it clearly in an interview will set you apart from candidates who only know textbook SQL.

### Skills It Demonstrates

API integration, JSON parsing, data transformation with Pandas, error handling for live data, storage to CSV or database, pipeline thinking

### High Level Architecture

```
Public API Source
(weather, news, crypto, sports — your choice)
        |
        v
API Request Layer
(requests library, handle auth and rate limits)
        |
        v
JSON Response Parsing
(extract relevant fields from nested JSON)
        |
        v
Pandas Transformation
(clean, rename columns, handle missing values, type casting)
        |
        v
Storage Layer
(append to CSV or insert into SQLite or PostgreSQL)
        |
        v
Scheduler
(cron job or APScheduler to run automatically every hour or day)
```

### Flow Explained

You pick a public API — a good starting point is the OpenWeather API, CoinGecko for crypto prices, or any API from the public APIs GitHub list linked in the reel. Your script makes a GET request, parses the JSON response, and extracts the fields you care about. Pandas cleans and structures the data — renaming columns, handling nulls, converting data types. The clean data gets appended to a CSV or inserted into a database. A scheduler runs the whole thing automatically at regular intervals so data accumulates over time.

### Stretch Goal

Add a simple analysis layer on top of the stored data. For example, if you are pulling crypto prices hourly, add a module that calculates rolling averages and flags unusual price movements. Now you have both a data engineering pipeline and a basic analytics layer.

### How to Present It on GitHub

This is your strongest project — make the README count. Include an architecture diagram, explain your choice of API and why, show a sample of the collected data, and describe what someone could do with this data. If you ran it for a few days and have real accumulated data, include a chart.

---

## How to Structure Your GitHub Portfolio

Building the projects is only half the work. How you present them determines whether a recruiter spends 30 seconds or 3 minutes on your profile.

### README Structure for Every Project

Every project README should have these five sections in this order:

1. One sentence description of what the project does
2. Why you built it and what business problem it solves
3. Architecture overview or flow diagram
4. Setup and run instructions (short, no jargon)
5. What you learned or what you would do differently

### GitHub Profile Tips

Pin your 3 best projects on your profile so they appear first. Make sure every pinned repo has a description filled in — not just the README. Use consistent naming: lowercase, words separated by hyphens, descriptive names. A repo called api-data-pipeline is infinitely better than pythonproject3.

### Which Project to Lead With by Role

If you are targeting data analyst roles, lead with Project 2 (Sales Dashboard) and Project 5 (API Pipeline). These directly mirror what analysts do.

If you are targeting data engineering roles, lead with Project 5 (API Pipeline) and Project 4 (Expense Tracker with Database). These show pipeline thinking and database skills.

If you are targeting backend or automation roles, lead with Project 1 (Job Tracker) and Project 3 (Resume Parser). These show practical automation and file processing skills.

---

## Free Dataset Sources

Google BigQuery Public Datasets — [console.cloud.google.com/bigquery](http://console.cloud.google.com/bigquery) (free tier available)

Kaggle Datasets — [kaggle.com/datasets](http://kaggle.com/datasets) (free, download directly)

Public APIs List — [github.com/public-apis/public-apis](http://github.com/public-apis/public-apis) (hundreds of free APIs across every category)

Canada Open Data — [open.canada.ca](http://open.canada.ca) (government datasets, good for Canada-specific analysis)

Statistics Canada — [statcan.gc.ca](http://statcan.gc.ca) (census, employment, economic data)


---

### Want to Build Real Analytics Projects?

ORU's **Hands-On Data Analytics** course teaches you to think like a practitioner and execute like one — through realistic business problems across insurance, banking, fintech, and ecommerce. Tools covered include Python, SQL, BigQuery, dbt Core, Tableau, Power BI, Streamlit, and Vanna AI.

Use code **ORU10** for 10% off → [Enroll Now](https://joinoru.com/course/hands-on-data-analytics:-learn-by-building-industry-projects)

*For mentorship, live sessions, and community support: [joinoru.com](https://joinoru.com)*
