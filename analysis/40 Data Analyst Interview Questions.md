# 40 Data Analyst Interview Questions
---

These 40 questions cover 85% of what gets asked in Canadian data analyst interviews across banks, telecom companies, tech firms, and consulting firms. Organised into 6 categories with model answer frameworks for each.

---

## Category 1 — SQL (10 Questions)

SQL is almost always tested live in Canadian DA interviews. Practice writing, not just reading.

**Q1. Write a query to find the second highest salary in a table.**

Approach: Use a subquery with MAX where salary is less than the overall MAX. Or use DENSE_RANK and filter for rank = 2.

**Q2. What is the difference between WHERE and HAVING?**

Approach: WHERE filters rows before aggregation. HAVING filters groups after aggregation. Use HAVING when you need to filter on an aggregate (e.g., departments with more than 10 employees).

**Q3. Explain the difference between INNER JOIN, LEFT JOIN, and FULL OUTER JOIN.**

Approach: INNER — only matching rows from both tables. LEFT — all rows from left, matching from right (NULLs where no match). FULL OUTER — all rows from both, NULLs where no match on either side. Always give a business example.

**Q4. What is a window function? Give an example.**

Approach: A function that performs a calculation across a set of rows related to the current row, without collapsing the result into a single row. Example: ROW_NUMBER() to rank employees by salary within each department using PARTITION BY.

**Q5. Write a query to calculate month-over-month revenue growth.**

Approach: Use LAG(revenue, 1) OVER (ORDER BY month) to pull the previous month's revenue. Calculate (current — previous) / previous * 100 for percentage growth.

**Q6. What is a CTE and when would you use it?**

Approach: A Common Table Expression (WITH clause) creates a named temporary result set. Use it to break complex queries into readable steps, to reference the same subquery multiple times, or to write recursive queries.

**Q7. How would you find duplicate records in a table?**

Approach: GROUP BY the columns that define a duplicate. Use HAVING COUNT(*) > 1 to return only the groups with more than one row.

**Q8. Write a query to find customers who made a purchase in January but not February.**

Approach: LEFT JOIN the January customer list with February. Filter WHERE the February column IS NULL. Or use NOT IN with a subquery.

**Q9. What is the difference between RANK and DENSE_RANK?**

Approach: RANK skips numbers after a tie (1, 1, 3). DENSE_RANK does not skip numbers (1, 1, 2). Use DENSE_RANK when you want a true top-N without gaps.

**Q10. How would you optimize a slow SQL query?**

Approach: Check for missing indexes. Avoid SELECT * — select only needed columns. Move filtering logic earlier (filter before joining). Avoid functions on indexed columns in WHERE clauses. Consider partitioning large tables. Check execution plan for full table scans.

---

## Category 2 — Python and Pandas (8 Questions)

Most Canadian DA interviews test Python through a take-home assignment. Banks sometimes test it live.

**Q11. How do you handle missing values in a Pandas DataFrame?**

Approach: isnull() to identify. dropna() to remove rows or columns. fillna() to fill with a value, mean, median, or forward/backward fill. The right approach depends on why the data is missing — explain this reasoning.

**Q12. What is the difference between merge, join, and concat in Pandas?**

Approach: merge() is the most flexible — like SQL JOIN, works on columns or index, supports all join types. join() is a shortcut for index-based merges. concat() stacks DataFrames vertically (rows) or horizontally (columns) without matching on a key.

**Q13. How would you calculate a rolling average in Pandas?**

Approach: Use df['column'].rolling(window=7).mean() for a 7-day rolling average. Explain that rolling averages smooth out noise and reveal underlying trends — give a business context like smoothing daily sales data.

**Q14. What is the difference between apply() and vectorized operations in Pandas?**

Approach: apply() runs a Python function row by row or column by column — flexible but slower. Vectorized operations use NumPy under the hood and operate on entire arrays at once — much faster on large datasets. Prefer vectorized where possible.

**Q15. How do you reshape a wide DataFrame to a long format?**

Approach: Use pd.melt() or df.melt(). Specify id_vars (columns to keep fixed) and value_vars (columns to unpivot). This converts multiple column headers into rows — useful for time series data stored as separate date columns.

**Q16. You have a CSV with 1 million rows. It is loading slowly. What do you do?**

Approach: Use chunksize parameter in read_csv to process in chunks. Specify dtypes upfront to avoid inference overhead. Use usecols to read only needed columns. Consider converting to Parquet format for repeated reads.

**Q17. How would you identify outliers in a dataset?**

Approach: IQR method — values below Q1 minus 1.5*IQR or above Q3 plus 1.5*IQR. Z-score method — values more than 3 standard deviations from mean. Visualize with boxplots. Explain that outliers may be errors or genuine edge cases — context determines the treatment.

**Q18. How do you group data and apply multiple aggregations at once?**

Approach: Use groupby() with agg() and pass a dictionary mapping column names to aggregation functions. Example: df.groupby('category').agg({'revenue': 'sum', 'order_id': 'count', 'quantity': 'mean'}).

---

## Category 3 — Statistics (7 Questions)

Often tested verbally in Canadian interviews. Most candidates are not prepared for this category.

**Q19. Explain p-value in simple terms.**

Approach: The p-value is the probability of observing your results (or more extreme results) if there was actually no effect — if the null hypothesis were true. A small p-value (below 0.05 typically) means your results are unlikely to have occurred by chance, so you reject the null hypothesis.

**Q20. What is the difference between Type I and Type II errors?**

Approach: Type I error — false positive. You concluded there was an effect when there was not (rejected a true null hypothesis). Type II error — false negative. You missed a real effect (failed to reject a false null hypothesis). In fraud detection, a Type II error (missing real fraud) is more costly. In drug testing, a Type I error (approving an ineffective drug) is more costly.

**Q21. How would you design an A/B test for a new feature?**

Approach: Define the hypothesis (what you are testing). Define the primary metric (conversion rate, revenue per user, etc). Calculate required sample size based on expected effect size and desired statistical power. Randomly assign users to control and treatment groups. Run the test for a predetermined duration. Analyze results — check statistical significance and practical significance. Make a decision.

**Q22. When would you use median instead of mean?**

Approach: When the distribution is skewed or contains outliers. Classic example: household income. A few billionaires skew the mean dramatically upward. Median better represents the typical household. Also use median for ordinal data or when the distribution is not approximately normal.

**Q23. What is a confidence interval?**

Approach: A range of values that likely contains the true population parameter. A 95% confidence interval means that if you ran the same experiment 100 times, approximately 95 of those intervals would contain the true population value. It quantifies the uncertainty in your estimate.

**Q24. What is the Central Limit Theorem and why does it matter for analysts?**

Approach: As sample size increases, the distribution of sample means approaches a normal distribution regardless of the shape of the population distribution. It matters because it justifies using normal-distribution-based statistical tests (like z-tests and t-tests) on real-world data that may not be normally distributed — as long as sample sizes are large enough (typically 30+).

**Q25. What is the difference between correlation and causation?**

Approach: Correlation means two variables move together. Causation means one variable causes the other to change. Correlation does not imply causation. Example: ice cream sales and drowning rates are positively correlated (both increase in summer) but ice cream does not cause drowning — a third variable (hot weather) causes both. Establish causation through controlled experiments (A/B tests) or causal inference methods.

---

## Category 4 — Case Studies (5 Questions)

For every case study, use the framework: Clarify, Decompose, Analyze, Recommend, Caveat.

**Q26. Our app's daily active users dropped 20% last week. How would you investigate?**

Approach: Clarify — which platform, which region, which user segment? Decompose — is it fewer new users, fewer returning users, or both? Did session length also drop? Check for technical issues, marketing changes, competitor activity. Look at the funnel — acquisition, activation, retention, each separately.

**Q27. How would you measure the success of a new feature we launched last month?**

Approach: Define the north star metric for this feature (what it is designed to improve). Set up an A/B test or measure pre/post if no test was run. Look at adoption rate (who is using it), engagement (how much), and impact on the north star metric. Watch for cannibalization of other features.

**Q28. We are launching in a new Canadian province. How do you estimate expected revenue in year one?**

Approach: Top-down (market size  *expected market share) and bottom-up (expected customers*  average revenue per customer). Identify key assumptions. Use comparable province data if available. Sensitivity analysis — what if acquisition rate is 50% lower than expected?

**Q29. A client says our dashboard numbers do not match their spreadsheet. What do you do?**

Approach: Do not assume either source is right. Check data source and query logic in the dashboard. Check calculation methodology in the spreadsheet — are they defining the metric the same way? Check time periods, filters, and currency/unit conventions. Trace the discrepancy to the specific row or calculation level.

**Q30. How would you prioritize which data quality issues to fix first?**

Approach: Assess business impact — which issues affect the most important decisions or the most users? Assess severity — are issues causing wrong answers or just incomplete ones? Assess fix effort — quick wins first where impact is high and effort is low. Document everything so the priority logic is transparent to stakeholders.

---

## Category 5 — Tools (5 Questions)

Only discuss tools you have actually used. Interviewers will probe deeply.

**Q31. Walk me through how you built a dashboard in Power BI or Tableau.**

Approach: Start with the data source and how you connected to it. Explain the data model — how tables are related. Walk through 2 to 3 specific visuals and why you chose them for the business question. Mention any calculated fields or measures you created. Describe how you made it actionable for the end user.

**Q32. What is DAX and when have you used it?**

Approach: DAX (Data Analysis Expressions) is the formula language in Power BI and Excel Power Pivot. Explain a specific DAX measure you created — for example, a year-over-year comparison measure using CALCULATE and DATEADD. Do not just define it — give a real example.

**Q33. How do you ensure your dashboards load quickly?**

Approach: Reduce the volume of data — aggregate where possible, filter to relevant date ranges. Avoid complex live queries — import mode is faster than DirectQuery. Optimize the data model — remove unused columns. Use summary tables for high-level views and drill-down for detail.

**Q34. What is Power Query and how have you used it?**

Approach: Power Query is the data transformation tool in Power BI and Excel. It uses a language called M. Used it to clean and reshape raw data before loading — removing duplicates, splitting columns, merging tables, changing data types. Explain a specific transformation you did.

**Q35. Have you used Excel for data analysis beyond basic formulas? What specifically?**

Approach: Pivot tables for aggregation and cross-tabulation. VLOOKUP or INDEX MATCH for data lookups. Power Query for data cleaning. Dynamic charts linked to pivot tables. Solver for optimization. Mention the scale of data you worked with — Excel struggles beyond a few hundred thousand rows.

---

## Category 6 — Behavioral (5 Questions)

Use the STAR method: Situation, Task, Action, Result. Always include numbers in the result.

**Q36. Tell me about a time you worked with messy or incomplete data.**

Prepare a story about: what the data quality issue was, how you identified it, how you cleaned or worked around it, and what the impact of the clean data was on the final analysis.

**Q37. Describe a time you had to explain a complex finding to a non-technical stakeholder.**

Prepare a story about: what the finding was, who the audience was, how you simplified the explanation (analogies, visuals, eliminating jargon), and how the stakeholder responded or acted on it.

**Q38. Tell me about a time you identified a business problem through data that nobody else had noticed.**

Prepare a story about: what you were looking at, what anomaly or pattern caught your attention, how you validated it, how you communicated it, and what action was taken.

**Q39. Describe a situation where you had conflicting priorities from different stakeholders.**

Prepare a story about: what the competing requests were, how you assessed urgency and importance, how you communicated your prioritization decision, and what the outcome was.

**Q40. Tell me about a time you made a mistake in your analysis. How did you handle it?**

Prepare a story about: what the mistake was (be honest — interviewers respect honesty), how you discovered it, how quickly you corrected it, what you communicated to stakeholders, and what process change you made to prevent it from happening again.

---

## Canadian Company-Specific Tips

**RBC, TD, Scotiabank, BMO:** SQL is tested live. Expect a business case study with financial context. Behavioral interviews are multi-round and heavily weighted. Know basic banking concepts — credit risk, customer lifetime value, churn.

**Shopify:** Product thinking matters as much as SQL. Be ready to define and measure a metric, design an experiment, or analyze a funnel. Python is more commonly tested than at banks.

**Telus, Bell, Rogers:** SQL and BI tools tested. Business case studies often telecom-themed — churn, ARPU, network utilization. Power BI common for reporting roles.

**Deloitte, KPMG, Accenture:** Case interviews sometimes included. Be ready to structure a business problem and give a recommendation. Statistics and visualization tested alongside SQL.

---

## Want to Go Deeper? ORU Hands-On Data Analytics Course

Most analytics courses teach you tools. This one teaches you how to think like a practitioner, then gives you the tools to execute. Every project is built around a realistic business problem — insurance, banking, fintech, and ecommerce. The tools span Python, SQL, BigQuery, dbt Core, Tableau, Power BI, Streamlit, and Vanna AI. Nothing is introduced for its own sake. By the final project, you are operating across a stack that reflects what senior practitioners use in production.

For analysts who are tired of concept-heavy courses with little real execution: [joinoru.com/course/hands-on-data-analytics](http://joinoru.com/course/hands-on-data-analytics)

---

*Resource compiled by Sahil Gogna — Co-founder, ORU ([joinoru.com](http://joinoru.com))*

*For mentorship, mock interviews, and community support: [joinoru.com](http://joinoru.com)*