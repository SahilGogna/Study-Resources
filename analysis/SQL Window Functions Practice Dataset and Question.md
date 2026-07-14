# SQL Window Functions Practice Dataset and Questions

This is the resource sent out when someone comments "WINDOW" on the reel. It is meant to be a proper guide, not just a quick answer key. Read the explanations first, then work through the questions.

## What is a window function

A window function runs a calculation across a set of rows that are related to the current row, but unlike GROUP BY, it does not collapse those rows into one. Every original row stays visible, and the result of the calculation is added as a new column next to it.

Here is the difference in practice. If you write:

```sql
SELECT category, SUM(amount)
FROM orders
GROUP BY category;
```

you get back one row per category. You lose the individual order rows.

If you write:

```sql
SELECT *, SUM(amount) OVER (PARTITION BY category) AS category_total
FROM orders;
```

you get back every single order row, and each one now also shows the total for its category. This is the entire point of window functions. You get aggregation and detail at the same time, which is exactly what most real dashboards and reports need.

## The anatomy of a window function

Every window function follows the same shape.

```sql
function_name() OVER (
  PARTITION BY column
  ORDER BY column
)
```

PARTITION BY splits your data into groups, the same way GROUP BY does, except the rows are not collapsed. If you skip PARTITION BY, the function treats the entire table as one group.

ORDER BY inside the OVER clause defines the sequence of rows within each partition. This matters a lot for ranking functions and running calculations, and it does nothing for a simple total like the category_total example above.

## The dataset

Table name: orders

| order_id | customer_name | category | product | sale_date | amount |
| --- | --- | --- | --- | --- | --- |
| 1 | Aman | Electronics | Headphones | 2026 01 03 | 80 |
| 2 | Aman | Electronics | Laptop | 2026 01 10 | 1200 |
| 3 | Priya | Home | Blender | 2026 01 04 | 60 |
| 4 | Priya | Home | Air Fryer | 2026 01 15 | 150 |
| 5 | Priya | Home | Chair | 2026 02 02 | 90 |
| 6 | Rohan | Electronics | Monitor | 2026 01 06 | 220 |
| 7 | Rohan | Electronics | Keyboard | 2026 01 20 | 45 |
| 8 | Rohan | Electronics | Headphones | 2026 02 05 | 80 |
| 9 | Neha | Home | Table | 2026 01 08 | 300 |
| 10 | Neha | Home | Lamp | 2026 01 25 | 40 |
| 11 | Aman | Electronics | Mouse | 2026 02 01 | 25 |
| 12 | Priya | Home | Blender | 2026 02 10 | 60 |
| 13 | Rohan | Electronics | Laptop | 2026 02 14 | 1300 |
| 14 | Neha | Home | Air Fryer | 2026 02 18 | 150 |
| 15 | Aman | Electronics | Monitor | 2026 02 20 | 220 |

Treat sale_date as an actual date column when you run these in your own environment.

## Section 1, ranking functions

**ROW_NUMBER**

Gives every row in a partition a unique, sequential number, starting at 1, based on the ORDER BY you provide. Even if two rows are tied, ROW_NUMBER will still give them different numbers.

```sql
SELECT *,
  ROW_NUMBER() OVER (PARTITION BY customer_name ORDER BY sale_date) AS rn
FROM orders;
```

Use case, finding the first order per customer, deduplicating rows where you only want to keep the latest record per group, pagination.

Common mistake, forgetting PARTITION BY. Without it, ROW_NUMBER numbers the entire table from 1 to however many rows exist, instead of restarting for each customer.

**RANK**

Also numbers rows based on ORDER BY, but if two rows tie, they get the same rank, and the next rank after a tie skips ahead. So if two products tie for rank 1, the next product is rank 3, not rank 2.

```sql
SELECT *,
  RANK() OVER (PARTITION BY category ORDER BY amount DESC) AS category_rank
FROM orders;
```

Use case, leaderboard style rankings where ties genuinely matter, like top selling products, where you want tied products to both show as rank 1.

**DENSE_RANK**

Behaves exactly like RANK on ties, both tied rows get the same rank, but it does not leave a gap afterward. So two products tied for rank 1 are followed by rank 2, not rank 3.

```sql
SELECT *,
  DENSE_RANK() OVER (PARTITION BY category ORDER BY amount DESC) AS category_dense_rank
FROM orders;
```

Use case, when you want a clean, gapless ranking, for example showing top 3 distinct price tiers per category rather than top 3 rows.

**Side by side, same data**

Take the Electronics category, sorted by amount descending. If Laptop at 1300 and Laptop at 1200 were tied at 1200 for a moment, here is how the three functions would differ on that tie:

ROW_NUMBER gives them 1 and 2, breaking the tie arbitrarily.

RANK gives them both 1, then the next row jumps to 3.

DENSE_RANK gives them both 1, then the next row is 2.

This is the single most commonly asked follow up question in interviews, so run all three on the actual dataset above and compare the output yourself.

## Section 2, aggregate window functions

SUM, AVG, COUNT, MIN, and MAX all work as window functions the same way they work as regular aggregates, the difference is entirely in how you use ORDER BY inside OVER.

**Without ORDER BY**, the function calculates across the whole partition, and every row in that partition gets the same value.

```sql
SELECT *,
  SUM(amount) OVER (PARTITION BY category) AS category_total
FROM orders;
```

**With ORDER BY**, the function becomes a running calculation, it only looks at the current row and everything before it in that partition.

```sql
SELECT *,
  SUM(amount) OVER (PARTITION BY category ORDER BY sale_date) AS running_total
FROM orders;
```

This is the part that trips people up most. Adding ORDER BY silently changes SUM from a fixed total into a running total, because the default frame becomes "everything from the start of the partition up to the current row." If your numbers look wrong in an interview or on the job, this is usually why.

Use case, running totals for revenue over time, moving averages for smoothing out noisy daily numbers, a count of orders so far this month per customer.

## Section 3, value functions

**LAG and LEAD**

LAG pulls a value from a previous row in the same partition, LEAD pulls a value from a following row. Both take the column name, and optionally how many rows back or forward, and a default value to use when there is no previous or next row.

```sql
SELECT *,
  LAG(amount, 1, 0) OVER (PARTITION BY customer_name ORDER BY sale_date) AS previous_order_amount,
  LEAD(amount, 1, 0) OVER (PARTITION BY customer_name ORDER BY sale_date) AS next_order_amount
FROM orders;
```

Use case, month over month or order over order comparisons, calculating growth or change, detecting the first or last row in a sequence when combined with a null check.

**FIRST_VALUE and LAST_VALUE**

FIRST_VALUE returns the value from the first row in the partition, LAST_VALUE returns the value from the last row, based on your ORDER BY.

```sql
SELECT *,
  FIRST_VALUE(amount) OVER (PARTITION BY customer_name ORDER BY sale_date) AS first_order_amount
FROM orders;
```

Common mistake, LAST_VALUE often returns the current row instead of the true last row, because the default frame stops at the current row, the same default that affects running totals. To get the actual last value in the partition, you need to explicitly widen the frame.

```sql
SELECT *,
  LAST_VALUE(amount) OVER (
    PARTITION BY customer_name ORDER BY sale_date
    ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
  ) AS last_order_amount
FROM orders;
```

## Practice questions

Work through these in order, they build in difficulty.

**ROW_NUMBER**

1. Find the very first order made by each customer.
2. Find the second most recent order made by each customer.
3. You want to keep only the latest order per customer and discard the rest, as if you were deduplicating the table. Write the query that returns just those rows.

**RANK and DENSE_RANK**

1. Rank products within each category by amount, highest first, using RANK.
2. Run the same query using DENSE_RANK instead, and identify at least one row where the two outputs differ.
3. Return only the top 2 distinct amount tiers per category, using DENSE_RANK, not RANK. Explain in one line why RANK would give you the wrong count here.

**Aggregate window functions**

1. Calculate the running total of amount across the whole table, ordered by sale_date, with no partition.
2. Calculate the same running total, but partitioned by category.
3. Calculate a 3 order moving average of amount per customer, ordered by sale_date. Hint, you will need an explicit ROWS BETWEEN clause for this one.

**LAG and LEAD**

1. For each customer, pull the amount of their previous order into the same row using LAG.
2. Add a column that labels each order as Increased, Decreased, or First Order compared to that customer's previous order.
3. For each category, find the number of days between one order and the next order in that category, ordered by sale_date.
- Answer key, SQL solutions
    
    **1**
    
    ```sql
    SELECT * FROM (
      SELECT *, ROW_NUMBER() OVER (PARTITION BY customer_name ORDER BY sale_date) AS rn
      FROM orders
    ) t WHERE rn = 1;
    ```
    
    **2**
    
    ```sql
    SELECT * FROM (
      SELECT *, ROW_NUMBER() OVER (PARTITION BY customer_name ORDER BY sale_date DESC) AS rn
      FROM orders
    ) t WHERE rn = 2;
    ```
    
    **3**
    
    ```sql
    SELECT * FROM (
      SELECT *, ROW_NUMBER() OVER (PARTITION BY customer_name ORDER BY sale_date DESC) AS rn
      FROM orders
    ) t WHERE rn = 1;
    ```
    
    **4**
    
    ```sql
    SELECT *, RANK() OVER (PARTITION BY category ORDER BY amount DESC) AS product_rank
    FROM orders;
    ```
    
    **5**
    
    ```sql
    SELECT *,
      RANK() OVER (PARTITION BY category ORDER BY amount DESC) AS rnk,
      DENSE_RANK() OVER (PARTITION BY category ORDER BY amount DESC) AS dense_rnk
    FROM orders;
    ```
    
    Look at the Electronics category, both Headphones rows sit at 80. RANK will skip a number after that tie, DENSE_RANK will not.
    
    **6**
    
    ```sql
    SELECT * FROM (
      SELECT *, DENSE_RANK() OVER (PARTITION BY category ORDER BY amount DESC) AS tier
      FROM orders
    ) t WHERE tier <= 2;
    ```
    
    RANK would give the wrong count because if two rows tie for the top spot, RANK still leaves a gap and can end up excluding a distinct second tier that DENSE_RANK correctly includes.
    
    **7**
    
    ```sql
    SELECT *, SUM(amount) OVER (ORDER BY sale_date) AS running_total_all
    FROM orders;
    ```
    
    **8**
    
    ```sql
    SELECT *, SUM(amount) OVER (PARTITION BY category ORDER BY sale_date) AS running_total_by_category
    FROM orders;
    ```
    
    **9**
    
    ```sql
    SELECT *,
      AVG(amount) OVER (
        PARTITION BY customer_name ORDER BY sale_date
        ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
      ) AS moving_avg_3
    FROM orders;
    ```
    
    **10**
    
    ```sql
    SELECT *,
      LAG(amount) OVER (PARTITION BY customer_name ORDER BY sale_date) AS previous_order_amount
    FROM orders;
    ```
    
    **11**
    
    ```sql
    SELECT *,
      CASE
        WHEN LAG(amount) OVER (PARTITION BY customer_name ORDER BY sale_date) IS NULL THEN 'First Order'
        WHEN amount > LAG(amount) OVER (PARTITION BY customer_name ORDER BY sale_date) THEN 'Increased'
        WHEN amount < LAG(amount) OVER (PARTITION BY customer_name ORDER BY sale_date) THEN 'Decreased'
        ELSE 'Same'
      END AS trend
    FROM orders;
    ```
    
    **12**
    
    ```sql
    SELECT *,
      sale_date - LAG(sale_date) OVER (PARTITION BY category ORDER BY sale_date) AS days_since_last_order
    FROM orders;
    ```