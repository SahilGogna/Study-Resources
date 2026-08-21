# 30 Power BI Interview Questions — Resource Doc

> Companion resource for the Aug 17 reel. Every question is mapped to one of the 6 patterns that show up in Canadian BI and DA interviews.
> 

## How to use this guide

- Work through pattern by pattern. Do not skip ahead.
- For DAX questions, actually write the code in a scratch Power BI file. Reading is not enough.
- Save the star schema diagram at the bottom — it comes up in almost every interview.

---

## Pattern 1 — DAX Basics (Questions 1 to 5)

### Q1. What is the difference between SUM and SUMX?

**Answer:** SUM aggregates a single column. SUMX iterates row by row and evaluates an expression per row, then sums it. Use SUMX when you need a calculation before aggregation, like SUMX(Sales, Sales[Quantity] * Sales[Price]).

### Q2. Explain CALCULATE.

**Answer:** CALCULATE modifies the filter context of a measure. Syntax: CALCULATE(expression, filter1, filter2...). Example: `Total Sales Ontario = CALCULATE([Total Sales], Customers[Province] = "Ontario")`. It is the single most powerful DAX function.

### Q3. What does FILTER do?

**Answer:** FILTER returns a table that includes only rows meeting a condition. It is usually used inside CALCULATE for advanced filters. Example: `CALCULATE([Total Sales], FILTER(Products, Products[Category] = "Electronics"))`.

### Q4. When would you use RELATED vs RELATEDTABLE?

**Answer:** RELATED gets a column from a related table on the "one" side of a relationship. RELATEDTABLE returns all related rows on the "many" side. Example: In a Sales fact table with a Product dimension, use RELATED(Product[Category]) inside Sales.

### Q5. Write a DAX measure for year-to-date sales.

**Answer:**

```
Sales YTD = TOTALYTD(SUM(Sales[Amount]), 'Date'[Date])
```

You can also add a fiscal year end: `TOTALYTD([Total Sales], 'Date'[Date], "03/31")`.

---

## Pattern 2 — Row Context vs Filter Context (Questions 6 to 10)

### Q6. Explain row context and filter context.

**Answer:** Row context is the current row being evaluated in a calculated column or an iterator function like SUMX. Filter context is the set of filters applied to the data model at the time a measure is evaluated (from slicers, visuals, or CALCULATE).

### Q7. Why doesn’t a calculated column automatically respect a slicer?

**Answer:** Calculated columns are computed at data refresh time using row context. Slicers apply filter context at report render time. Because calculated columns run before slicers, they cannot see them. Use measures instead when you need slicer responsiveness.

### Q8. What does context transition mean?

**Answer:** When you use CALCULATE inside a row context, it converts the current row context into an equivalent filter context. This is how a measure works when called inside SUMX or a calculated column.

### Q9. Why does a measure show a different value in a card vs a matrix?

**Answer:** The filter context is different. The card has no row/column filters. The matrix cell inherits filters from its row and column groupings. Always sanity-check filter context first when debugging.

### Q10. How do you clear filter context in a measure?

**Answer:** Use ALL, ALLSELECTED, or REMOVEFILTERS. Example: `CALCULATE([Total Sales], ALL(Products))` removes all filters on the Products table.

---

## Pattern 3 — Time Intelligence (Questions 11 to 15)

### Q11. Write a measure for prior year sales.

**Answer:**

```
Prior Year Sales = CALCULATE([Total Sales], SAMEPERIODLASTYEAR('Date'[Date]))
```

### Q12. How do you calculate year-over-year growth?

**Answer:**

```
YoY Growth = DIVIDE([Total Sales] - [Prior Year Sales], [Prior Year Sales])
```

Always use DIVIDE, never `/`, so you handle the divide-by-zero case.

### Q13. What is the purpose of a marked Date table?

**Answer:** Time intelligence functions like TOTALYTD, SAMEPERIODLASTYEAR, and DATEADD require a proper Date table that is marked as a Date table. Without it, they either return incorrect results or fail.

### Q14. Write a rolling 3-month average.

**Answer:**

```
Rolling 3M Avg = AVERAGEX(
    DATESINPERIOD('Date'[Date], LASTDATE('Date'[Date]), -3, MONTH),
    [Total Sales]
)
```

### Q15. What is the difference between DATEADD and PARALLELPERIOD?

**Answer:** DATEADD shifts the current date selection by a specified number of periods. PARALLELPERIOD returns a full period (month, quarter, or year) parallel to the current selection.

---

## Pattern 4 — Data Modeling (Questions 16 to 20)

### Q16. Star schema vs snowflake schema.

**Answer:** Star schema has a fact table connected directly to denormalized dimensions. Snowflake normalizes those dimensions into multiple tables. Star schema is preferred in Power BI because it performs better and is simpler for measures.

### Q17. What is a fact table?

**Answer:** A table that stores measurable events — sales, orders, transactions. Rows are usually many. Columns include foreign keys to dimensions plus numeric measures.

### Q18. What is a dimension table?

**Answer:** A table that stores descriptive attributes about the business entities — customers, products, dates. Rows are usually few. Columns include a primary key and descriptive columns.

### Q19. Should relationships be single or bidirectional?

**Answer:** Default to single direction (from dimension to fact). Bidirectional can cause ambiguity and performance issues. Use bidirectional only when necessary, e.g. for many-to-many bridge tables.

### Q20. What is role-playing dimension? Give a Power BI example.

**Answer:** A dimension used in multiple contexts. Example: a Date table connected to Sales[OrderDate] and Sales[ShipDate]. In Power BI, you either duplicate the Date table or use USERELATIONSHIP to activate an inactive relationship in a measure.

---

## Pattern 5 — Power Query M (Questions 21 to 25)

### Q21. Difference between Merge and Append queries.

**Answer:** Merge combines columns side by side (like SQL JOIN). Append stacks rows on top of each other (like UNION).

### Q22. What is query folding and why does it matter?

**Answer:** Query folding pushes transformation steps back to the source database as SQL. It dramatically improves refresh performance. Not all transformations fold. Custom column with M code often breaks folding.

### Q23. How do you unpivot columns and when would you do it?

**Answer:** Right-click selected columns > Unpivot. You do this when data is in wide format (columns for each month) and you need long format (one row per month). Long format is required for star schema.

### Q24. What is the difference between Import mode and DirectQuery?

**Answer:** Import loads data into the in-memory VertiPaq engine, fast queries but stale until refresh. DirectQuery queries the source live, always fresh but slower and more source-dependent. Composite models let you combine both.

### Q25. How do you handle a source column with mixed data types?

**Answer:** Use "Detect Data Type" cautiously, then apply explicit `Table.TransformColumnTypes` in the M script. For nulls or errors, use `try...otherwise` to provide a fallback value.

---

## Pattern 6 — Performance Optimization (Questions 26 to 30)

### Q26. Name 5 ways to improve Power BI report performance.

**Answer:** 1) Star schema over snowflake. 2) Reduce column cardinality. 3) Remove unused columns. 4) Use aggregations for large fact tables. 5) Avoid calculated columns when a measure works.

### Q27. When should you use aggregations?

**Answer:** When a fact table is very large (tens of millions of rows) and users mostly view summarized data. Aggregations pre-compute totals at higher grain (e.g. daily instead of per transaction), and Power BI transparently routes queries to them.

### Q28. How do you detect performance issues in Power BI?

**Answer:** Performance Analyzer in Power BI Desktop. It shows the DAX query duration for each visual. For deeper analysis, use DAX Studio to profile queries.

### Q29. What is the difference between CALCULATE and CALCULATETABLE?

**Answer:** CALCULATE returns a scalar value. CALCULATETABLE returns a table. Both modify filter context the same way, but you use CALCULATETABLE inside functions that expect a table.

### Q30. How would you optimize a slow measure that uses FILTER?

**Answer:** 1) Check if you can replace FILTER with a simple boolean expression inside CALCULATE. 2) Ensure the table being filtered has minimal columns. 3) Consider adding a pre-computed calculated column if the filter logic is expensive and static.

---

## Sample star schema for practice

```
           +----------------+
           |  Date          |
           |----------------|
           |  DateKey PK    |
           |  FullDate      |
           |  Month         |
           |  Quarter       |
           |  Year          |
           +--------+-------+
                    |
                    |
+----------------+  |  +----------------+
|  Customers     |  |  |  Products      |
|----------------|  |  |----------------|
|  CustomerKey PK|--+--|  ProductKey PK |
|  Name          |  |  |  ProductName   |
|  City          |  |  |  Category      |
|  Country       |  |  |  Price         |
+----------------+  |  +----------------+
         |          |          |
         |    +-----+-----+    |
         +--> |  Sales     | <-+
              |------------|
              | SaleKey PK |
              | DateKey FK |
              | CustKey FK |
              | ProdKey FK |
              | Quantity   |
              | Amount     |
              +------------+
```

---

## Interview tips for Canadian companies

- **RBC, TD, Scotiabank, BMO:** Very DAX-heavy. Expect scenario questions like "Write a measure for MoM growth."
- **Big 4 consulting (Deloitte, EY, PwC, KPMG):** Focus on data modeling and business framing. "How would you model this dataset?"
- **Loblaws, Canadian Tire:** Retail-heavy questions on time intelligence and category-based measures.
- **Insurance (Manulife, Sun Life):** Financial reporting DAX, YTD/QTD, complex filter propagation.

If you want mentorship from BI Analysts already working at Canadian banks and consulting firms, check out ORU at [joinoru.com](http://joinoru.com).