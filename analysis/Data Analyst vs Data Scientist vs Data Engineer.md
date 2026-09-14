# Data Analyst vs Data Scientist vs Data Engineer in Canada

Three different jobs. Three different salary bands. Only one of them has real entry-level volume in Canada. Here is the whole picture, including a 6 month learning roadmap for each of the three roles.

---

## Side by side

|  | Data Analyst | Data Engineer | Data Scientist |
| --- | --- | --- | --- |
| **Salary (CAD)** | $65,000 to $95,000 | $100,000 to $140,000 | $95,000 to $135,000 |
| **Entry-level volume** | High | Low | Very low |
| **Core question** | What happened and why | How does the data get here | What will happen next |
| **Primary tools** | SQL, Excel, Power BI or Tableau | SQL, Python, dbt, Airflow, cloud | Python, statistics, ML |
| **Degree expectation** | None, portfolio matters more | None, experience matters | Often Masters or PhD |
| **Realistic entry from a switch** | 4 to 8 months | Usually via another role | Usually via another role |

---

## Data Analyst

**What the job actually is:** someone in the business has a question. You get the data, answer it, and present it in a way a non-technical person can act on. Most of the work is SQL and communication, not modelling.

**A normal week:** pulling data for recurring reports, building or fixing a dashboard, answering ad hoc questions from a business team, and one deeper analysis.

**Tool stack:** SQL first and by a distance. Then Excel, which Canadian banks still test harder than people expect. Then Power BI or Tableau. Python is a plus, not a gate.

**Who hires in Canada:** banks and insurance (RBC, TD, Scotiabank, Sun Life, Manulife), retail, healthcare, government, and effectively every mid-size company.

**Why this is the entry point:** it has the most openings, the least gatekeeping on credentials, and a portfolio can substitute for experience. Every other role on this page is reachable from here.

---

## Data Engineer

**What the job actually is:** you build and maintain the pipelines that move data from source systems into somewhere analysts can use it. When a dashboard is wrong at 8am, this is whose problem it is.

**A normal week:** building or modifying pipelines, fixing a broken job, modelling tables in dbt, reviewing someone's SQL, and thinking about cost.

**Tool stack:** advanced SQL, Python, dbt, Airflow, Snowflake or Databricks, and one cloud platform. Git is not optional here the way it sometimes is for analysts.

**Who hires in Canada:** the same banks, plus Shopify, Lightspeed, and most scale-ups.

**Why it is hard to enter directly:** companies are handing you production systems. They want evidence you have operated something before. The common paths in are analyst to analytics engineer to data engineer, or software developer to data engineer.

---

## Data Scientist

**What the job actually is:** framing a business problem as a statistical one, building a model or an experiment, and being honest about uncertainty. Far more experimentation and stakeholder work than the job title suggests.

**A normal week:** defining a metric, designing or reading an A/B test, feature engineering, model iteration, and explaining to a product team why the result is weaker than they hoped.

**Tool stack:** Python, strong statistics, ML libraries, experimentation frameworks, and enough SQL to get your own data.

**Who hires in Canada:** larger tech companies, banks with mature analytics functions, and a smaller set of specialised firms.

**Why it is the hardest entry:** a large share of Canadian DS postings are mid or senior. Many list a Masters or PhD. The competition per posting is the highest of the three.

---

## How to choose

Answer these honestly.

**Do you enjoy explaining things to non-technical people?** That points to Analyst.

**Do you enjoy making systems work reliably, and does a broken job at 7am sound like a puzzle rather than a nightmare?** That points to Engineer.

**Do you have real statistics depth, and do you enjoy being uncertain in public?** That points to Scientist.

**Are you switching careers and need income within a year?** Analyst. This is not a compromise. It is the entry point that leads to the other two.

---

## The two year path

Months 0 to 6: SQL to a genuine intermediate level, one BI tool, three portfolio projects on Canadian public data, resume and LinkedIn fixed.

Months 6 to 12: land the analyst role. Learn the business.

Months 12 to 24: pick a direction. Toward engineering, add Python, dbt, Airflow, and one cloud platform. Toward science, add statistics depth, experimentation, and ML fundamentals.

The people who get to $130,000 in Canada mostly did not start there. They started at $70,000 and moved deliberately.

---

## 6 month roadmap: Data Analyst

This is the one to follow if you need income inside a year.

**Month 1 to 2, foundations.** SQL to a real intermediate level: joins, aggregations, CTEs, window functions. Practise on StrataScratch and DataLemur. Excel properly, pivot tables and XLOOKUP, because Canadian banks still test this harder than people expect. Start reading business context, not just syntax.

**Month 3, visualization.** Pick one BI tool and go deep rather than sampling three. Power BI through Microsoft Learn, or Tableau through Tableau Public. Build 5 dashboards from public data. Use StatCan and Toronto Open Data so your portfolio is visibly Canadian.

**Month 4, Python for analysts.** pandas, data cleaning, basic plotting. You need the 20 percent that analysts actually use, not a full software course. Practise on Kaggle.

**Month 5, stats and A/B testing.** Hypothesis testing, p-values, confidence intervals, and how to read an experiment result. This is what separates a $70,000 analyst from a $95,000 one.

**Month 6, portfolio and case prep.** Three portfolio dashboards on Canadian datasets. Practise product and business case interviews, Exponent has a usable free tier. Fix the resume and LinkedIn in this month, not later.

**Who hires:** RBC, TD, Scotiabank, BMO, CIBC, Sun Life, Manulife, Loblaws, Canadian Tire, Bell, Rogers, Telus, Air Canada, WestJet, and effectively every mid-size company in the country.

---

## 6 month roadmap: Data Engineer

Realistic if you already code. If you do not, do the Analyst roadmap first and come back at month 12.

**Month 1 to 2, foundations.** Advanced SQL, well past the analyst level. Production Python, meaning OOP, testing and packaging, not just scripts. Linux and Git are assumed knowledge here in a way they are not for analysts.

**Month 3, data modelling.** Kimball dimensional modelling, fact and dimension tables, star schema, slowly changing dimensions. This is the part self-taught engineers skip and interviewers always find.

**Month 4, cloud and orchestration.** Pick one cloud, AWS or Azure, and use the free tier. Airflow basics: DAGs, operators, scheduling. Astronomer Academy is free and good.

**Month 5, modern data stack.** dbt fundamentals through dbt Labs free courses. Snowflake or Databricks on a free trial. These two names appear in most Canadian DE postings now.

**Month 6, portfolio and interview prep.** Build 2 genuine end to end pipelines: ingest, transform, model, dashboard. Case practice on [DataExpert.io](http://DataExpert.io) or Interview Query.

**Who hires:** the same banks, plus Shopify, Lightspeed, D2L, Wealthsimple, Nuvei, and most scale-ups.

---

## 6 month roadmap: Data Scientist

Be honest with yourself before starting this one. Without a Masters, the realistic route into DS in Canada is analyst first, then an internal move. This roadmap assumes you have quantitative background already.

**Month 1 to 2, foundations.** Python properly. Statistics with real depth: distributions, hypothesis testing, confidence intervals, regression. Enough SQL to pull your own data without asking anyone.

**Month 3, experimentation.** A/B test design, power analysis, and the common traps like peeking and multiple comparisons. Canadian product teams interview on this more than they interview on deep learning.

**Month 4, machine learning fundamentals.** Regression, classification, tree based models, cross-validation, overfitting. scikit-learn is enough. Skip deep learning unless the role specifically asks.

**Month 5, applied projects.** Two end to end projects built around a real business question. Not Titanic, not Iris. A recruiter can tell instantly.

**Month 6, portfolio and interview prep.** Case studies, statistics interviews, and practising how you communicate uncertainty. Being confidently wrong is the fastest way to fail a DS loop.

**Who hires:** larger tech companies, banks with mature analytics functions, and a smaller set of specialised firms. Fewer postings than the other two, and more competition per posting.

---

## The mistake this document exists to prevent

Picking the role with the highest salary and applying to it for eight months with no interviews.

Pick by entry point. Move by salary later.

---

If you want help deciding which role fits your background, ORU offers 1-on-1 mentorship with people already working in all three. [joinoru.com](http://joinoru.com)