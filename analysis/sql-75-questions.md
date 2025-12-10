# 75 SQL Interview Questions for Data Analysts

**Master the 10 Patterns That Cover 90% of Interviews**

---

## 📊 PATTERN 1: JOINs (Questions 1-10)

### Beginner Level

**Q1. Find all customers and their orders** (Startup)
```sql
-- Tables: customers (customer_id, name), orders (order_id, customer_id, amount)
-- Task: List all customers with their order amounts

SELECT c.name, o.amount
FROM customers c
INNER JOIN orders o ON c.customer_id = o.customer_id;
```

**Q2. Find customers who never placed an order** (E-commerce)
```sql
-- Task: Identify customers without orders

SELECT c.customer_id, c.name
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;
```

### Intermediate Level

**Q3. Three-table JOIN for order details** (FAANG)
```sql
-- Tables: customers, orders, products
-- Task: Get customer name, product name, and order amount

SELECT c.name AS customer, p.product_name, o.amount
FROM customers c
INNER JOIN orders o ON c.customer_id = o.customer_id
INNER JOIN products p ON o.product_id = p.product_id;
```

**Q4. Find products never ordered** (E-commerce)
```sql
SELECT p.product_id, p.product_name
FROM products p
LEFT JOIN orders o ON p.product_id = o.product_id
WHERE o.order_id IS NULL;
```

### Advanced Level

**Q5. Multiple JOIN with aggregation** (Finance)
```sql
-- Task: Total revenue per customer category

SELECT c.category, SUM(o.amount) AS total_revenue
FROM customers c
INNER JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.category;
```

**Q6. Self JOIN to find employee-manager pairs** (FAANG)
```sql
-- Table: employees (employee_id, name, manager_id)

SELECT e1.name AS employee, e2.name AS manager
FROM employees e1
LEFT JOIN employees e2 ON e1.manager_id = e2.employee_id;
```

**Q7. Complex multi-condition JOIN** (Finance)
```sql
-- Task: Match transactions based on amount AND date

SELECT t1.transaction_id, t2.matching_transaction
FROM transactions t1
INNER JOIN transactions t2 
  ON t1.amount = t2.amount 
  AND t1.transaction_date = t2.transaction_date
  AND t1.transaction_id < t2.transaction_id;
```

**Q8. Full OUTER JOIN for reconciliation** (Finance)
```sql
-- Task: Find mismatches between two systems

SELECT 
  COALESCE(s1.id, s2.id) AS id,
  s1.amount AS system1_amount,
  s2.amount AS system2_amount
FROM system1 s1
FULL OUTER JOIN system2 s2 ON s1.id = s2.id
WHERE s1.amount != s2.amount OR s1.id IS NULL OR s2.id IS NULL;
```

**Q9. Cross JOIN for combinations** (Startup)
```sql
-- Task: Generate all possible product-color combinations

SELECT p.product_name, c.color
FROM products p
CROSS JOIN colors c;
```

**Q10. JOIN with multiple aggregations** (E-commerce)
```sql
-- Task: Customer lifetime value with order metrics

SELECT 
  c.customer_id,
  c.name,
  COUNT(o.order_id) AS total_orders,
  SUM(o.amount) AS lifetime_value,
  AVG(o.amount) AS avg_order_value
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name;
```

---

## 📈 PATTERN 2: GROUP BY + Aggregations (Questions 11-18)

### Beginner Level

**Q11. Count orders per customer** (Startup)
```sql
SELECT customer_id, COUNT(*) AS order_count
FROM orders
GROUP BY customer_id;
```

**Q12. Total sales by product** (E-commerce)
```sql
SELECT product_id, SUM(quantity * price) AS total_sales
FROM order_items
GROUP BY product_id;
```

**Q13. Average order value by month** (Finance)
```sql
SELECT 
  DATE_TRUNC('month', order_date) AS month,
  AVG(amount) AS avg_order_value
FROM orders
GROUP BY DATE_TRUNC('month', order_date);
```

### Intermediate Level

**Q14. Multiple aggregations in one query** (FAANG)
```sql
-- Task: Summary statistics per product category

SELECT 
  category,
  COUNT(*) AS product_count,
  AVG(price) AS avg_price,
  MIN(price) AS min_price,
  MAX(price) AS max_price,
  SUM(inventory) AS total_inventory
FROM products
GROUP BY category;
```

**Q15. GROUP BY with HAVING clause** (Finance)
```sql
-- Task: Find customers with total purchases > $1000

SELECT customer_id, SUM(amount) AS total_spent
FROM orders
GROUP BY customer_id
HAVING SUM(amount) > 1000;
```

**Q16. Nested aggregation** (FAANG)
```sql
-- Task: Find average of daily order counts

SELECT AVG(daily_orders) AS avg_daily_orders
FROM (
  SELECT DATE(order_date) AS date, COUNT(*) AS daily_orders
  FROM orders
  GROUP BY DATE(order_date)
) AS daily_counts;
```

### Advanced Level

**Q17. Multiple GROUP BY levels** (E-commerce)
```sql
-- Task: Sales by category and subcategory

SELECT 
  category,
  subcategory,
  COUNT(DISTINCT product_id) AS product_count,
  SUM(sales) AS total_sales
FROM products
GROUP BY category, subcategory
ORDER BY category, total_sales DESC;
```

**Q18. Conditional aggregation** (FAANG)
```sql
-- Task: Count orders by status in one row

SELECT 
  COUNT(CASE WHEN status = 'completed' THEN 1 END) AS completed_orders,
  COUNT(CASE WHEN status = 'pending' THEN 1 END) AS pending_orders,
  COUNT(CASE WHEN status = 'cancelled' THEN 1 END) AS cancelled_orders
FROM orders;
```

---

## 🪟 PATTERN 3: Window Functions (Questions 19-28)

### Beginner Level

**Q19. ROW_NUMBER for ranking** (FAANG)
```sql
-- Task: Rank products by sales within each category

SELECT 
  product_name,
  category,
  sales,
  ROW_NUMBER() OVER (PARTITION BY category ORDER BY sales DESC) AS rank
FROM products;
```

**Q20. Running total** (Finance)
```sql
SELECT 
  transaction_date,
  amount,
  SUM(amount) OVER (ORDER BY transaction_date) AS running_total
FROM transactions;
```

### Intermediate Level

**Q21. RANK vs DENSE_RANK** (FAANG)
```sql
-- Task: Show difference between RANK and DENSE_RANK

SELECT 
  employee_name,
  salary,
  RANK() OVER (ORDER BY salary DESC) AS rank,
  DENSE_RANK() OVER (ORDER BY salary DESC) AS dense_rank
FROM employees;
```

**Q22. LEAD and LAG for comparison** (E-commerce)
```sql
-- Task: Compare current month sales to previous month

SELECT 
  month,
  sales,
  LAG(sales) OVER (ORDER BY month) AS prev_month_sales,
  sales - LAG(sales) OVER (ORDER BY month) AS sales_change
FROM monthly_sales;
```

**Q23. Moving average** (Finance)
```sql
-- Task: 7-day moving average of stock prices

SELECT 
  date,
  price,
  AVG(price) OVER (ORDER BY date ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) AS moving_avg_7d
FROM stock_prices;
```

### Advanced Level

**Q24. Top N per group** (FAANG)
```sql
-- Task: Top 3 products per category by sales

WITH ranked_products AS (
  SELECT 
    category,
    product_name,
    sales,
    ROW_NUMBER() OVER (PARTITION BY category ORDER BY sales DESC) AS rank
  FROM products
)
SELECT category, product_name, sales
FROM ranked_products
WHERE rank <= 3;
```

**Q25. First and last value** (E-commerce)
```sql
-- Task: First and last order date per customer

SELECT DISTINCT
  customer_id,
  FIRST_VALUE(order_date) OVER (PARTITION BY customer_id ORDER BY order_date) AS first_order,
  LAST_VALUE(order_date) OVER (PARTITION BY customer_id ORDER BY order_date ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS last_order
FROM orders;
```

**Q26. Cumulative distribution** (Finance)
```sql
SELECT 
  salary,
  CUME_DIST() OVER (ORDER BY salary) AS cumulative_pct
FROM employees;
```

**Q27. NTILE for quartiles** (FAANG)
```sql
-- Task: Divide customers into 4 segments by spending

SELECT 
  customer_id,
  total_spent,
  NTILE(4) OVER (ORDER BY total_spent) AS spending_quartile
FROM customer_totals;
```

**Q28. Window function with frame clause** (Finance)
```sql
-- Task: Calculate range-based moving average

SELECT 
  date,
  price,
  AVG(price) OVER (ORDER BY date RANGE BETWEEN INTERVAL '7 days' PRECEDING AND CURRENT ROW) AS avg_7d
FROM stock_prices;
```

---

## 🔍 PATTERN 4: Subqueries & CTEs (Questions 29-36)

### Beginner Level

**Q29. Simple subquery in WHERE** (Startup)
```sql
-- Task: Find products priced above average

SELECT product_name, price
FROM products
WHERE price > (SELECT AVG(price) FROM products);
```

**Q30. Subquery in SELECT** (E-commerce)
```sql
SELECT 
  customer_id,
  (SELECT COUNT(*) FROM orders WHERE orders.customer_id = customers.customer_id) AS order_count
FROM customers;
```

### Intermediate Level

**Q31. Correlated subquery** (FAANG)
```sql
-- Task: Find employees earning above their department average

SELECT e1.name, e1.salary, e1.department
FROM employees e1
WHERE e1.salary > (
  SELECT AVG(e2.salary)
  FROM employees e2
  WHERE e2.department = e1.department
);
```

**Q32. EXISTS for filtering** (Finance)
```sql
-- Task: Find customers with at least one large order

SELECT customer_id, name
FROM customers c
WHERE EXISTS (
  SELECT 1
  FROM orders o
  WHERE o.customer_id = c.customer_id
  AND o.amount > 1000
);
```

**Q33. Basic CTE** (FAANG)
```sql
-- Task: Use CTE for readability

WITH high_value_customers AS (
  SELECT customer_id, SUM(amount) AS total_spent
  FROM orders
  GROUP BY customer_id
  HAVING SUM(amount) > 5000
)
SELECT c.name, hvc.total_spent
FROM high_value_customers hvc
JOIN customers c ON hvc.customer_id = c.customer_id;
```

### Advanced Level

**Q34. Multiple CTEs** (FAANG)
```sql
WITH 
  monthly_sales AS (
    SELECT 
      DATE_TRUNC('month', order_date) AS month,
      SUM(amount) AS sales
    FROM orders
    GROUP BY DATE_TRUNC('month', order_date)
  ),
  sales_growth AS (
    SELECT 
      month,
      sales,
      LAG(sales) OVER (ORDER BY month) AS prev_month_sales,
      (sales - LAG(sales) OVER (ORDER BY month)) / LAG(sales) OVER (ORDER BY month) * 100 AS growth_pct
    FROM monthly_sales
  )
SELECT * FROM sales_growth WHERE growth_pct > 10;
```

**Q35. Recursive CTE** (FAANG)
```sql
-- Task: Organization hierarchy

WITH RECURSIVE org_hierarchy AS (
  SELECT employee_id, name, manager_id, 1 AS level
  FROM employees
  WHERE manager_id IS NULL
  
  UNION ALL
  
  SELECT e.employee_id, e.name, e.manager_id, oh.level + 1
  FROM employees e
  JOIN org_hierarchy oh ON e.manager_id = oh.employee_id
)
SELECT * FROM org_hierarchy;
```

**Q36. CTE with window functions** (Finance)
```sql
WITH ranked_trades AS (
  SELECT 
    trader_id,
    trade_date,
    profit_loss,
    ROW_NUMBER() OVER (PARTITION BY trader_id ORDER BY profit_loss DESC) AS profit_rank
  FROM trades
)
SELECT trader_id, trade_date, profit_loss
FROM ranked_trades
WHERE profit_rank <= 5;
```

---

## 📅 PATTERN 5: Date/Time Functions (Questions 37-43)

### Beginner Level

**Q37. Extract year/month/day** (Startup)
```sql
SELECT 
  order_id,
  EXTRACT(YEAR FROM order_date) AS year,
  EXTRACT(MONTH FROM order_date) AS month,
  EXTRACT(DAY FROM order_date) AS day
FROM orders;
```

**Q38. Calculate days between dates** (E-commerce)
```sql
-- Task: Days since last order

SELECT 
  customer_id,
  MAX(order_date) AS last_order_date,
  CURRENT_DATE - MAX(order_date) AS days_since_last_order
FROM orders
GROUP BY customer_id;
```

### Intermediate Level

**Q39. DATE_TRUNC for grouping** (Finance)
```sql
SELECT 
  DATE_TRUNC('week', transaction_date) AS week,
  SUM(amount) AS weekly_total
FROM transactions
GROUP BY DATE_TRUNC('week', transaction_date);
```

**Q40. DATEADD for future dates** (E-commerce)
```sql
-- Task: Calculate subscription expiration

SELECT 
  customer_id,
  subscription_start,
  subscription_start + INTERVAL '30 days' AS expiration_date
FROM subscriptions;
```

**Q41. Age calculation** (Finance)
```sql
SELECT 
  customer_id,
  birth_date,
  EXTRACT(YEAR FROM AGE(CURRENT_DATE, birth_date)) AS age
FROM customers;
```

### Advanced Level

**Q42. Cohort analysis by signup month** (E-commerce)
```sql
SELECT 
  DATE_TRUNC('month', signup_date) AS cohort_month,
  DATE_TRUNC('month', order_date) AS order_month,
  COUNT(DISTINCT customer_id) AS customers
FROM orders
GROUP BY cohort_month, order_month;
```

**Q43. Business days calculation** (Finance)
```sql
-- Task: Calculate business days between dates (excluding weekends)

SELECT 
  order_date,
  delivery_date,
  (delivery_date - order_date) - 
  (EXTRACT(WEEK FROM delivery_date) - EXTRACT(WEEK FROM order_date)) * 2 AS business_days
FROM orders;
```

---

## 🔀 PATTERN 6: CASE Statements (Questions 44-50)

### Beginner Level

**Q44. Simple CASE for categorization** (Startup)
```sql
SELECT 
  product_name,
  price,
  CASE 
    WHEN price < 20 THEN 'Budget'
    WHEN price BETWEEN 20 AND 50 THEN 'Mid-range'
    ELSE 'Premium'
  END AS price_category
FROM products;
```

**Q45. CASE with NULL handling** (E-commerce)
```sql
SELECT 
  customer_id,
  CASE 
    WHEN email IS NULL THEN 'No Email'
    ELSE email
  END AS email_status
FROM customers;
```

### Intermediate Level

**Q46. Multiple CASE statements** (FAANG)
```sql
SELECT 
  order_id,
  CASE 
    WHEN amount > 1000 THEN 'High Value'
    WHEN amount > 500 THEN 'Medium Value'
    ELSE 'Low Value'
  END AS order_segment,
  CASE 
    WHEN status = 'completed' THEN 'Success'
    WHEN status = 'pending' THEN 'In Progress'
    ELSE 'Failed'
  END AS order_status
FROM orders;
```

**Q47. CASE in aggregation** (Finance)
```sql
-- Task: Count orders by value tier

SELECT 
  COUNT(CASE WHEN amount < 50 THEN 1 END) AS small_orders,
  COUNT(CASE WHEN amount BETWEEN 50 AND 200 THEN 1 END) AS medium_orders,
  COUNT(CASE WHEN amount > 200 THEN 1 END) AS large_orders
FROM orders;
```

### Advanced Level

**Q48. Nested CASE statements** (E-commerce)
```sql
SELECT 
  customer_id,
  CASE 
    WHEN total_orders > 10 THEN
      CASE 
        WHEN avg_order_value > 100 THEN 'VIP'
        ELSE 'Frequent'
      END
    WHEN total_orders > 5 THEN 'Regular'
    ELSE 'New'
  END AS customer_tier
FROM customer_summary;
```

**Q49. CASE for data transformation** (FAANG)
```sql
-- Task: Pivot data using CASE

SELECT 
  product_id,
  SUM(CASE WHEN month = 'January' THEN sales ELSE 0 END) AS jan_sales,
  SUM(CASE WHEN month = 'February' THEN sales ELSE 0 END) AS feb_sales,
  SUM(CASE WHEN month = 'March' THEN sales ELSE 0 END) AS mar_sales
FROM monthly_sales
GROUP BY product_id;
```

**Q50. CASE with complex logic** (Finance)
```sql
SELECT 
  account_id,
  balance,
  CASE 
    WHEN balance < 0 THEN 'Overdrawn'
    WHEN balance = 0 THEN 'Zero Balance'
    WHEN balance < 1000 THEN 'Low Balance'
    WHEN balance BETWEEN 1000 AND 10000 THEN 'Standard'
    ELSE 'High Balance'
  END AS account_status,
  CASE 
    WHEN balance < 0 THEN balance * 0.15
    WHEN balance < 1000 THEN 0
    ELSE balance * 0.02
  END AS interest_earned
FROM accounts;
```

---

## 🔤 PATTERN 7: String Functions (Questions 51-56)

### Beginner Level

**Q51. CONCAT for combining strings** (Startup)
```sql
SELECT 
  first_name || ' ' || last_name AS full_name,
  CONCAT(first_name, ' ', last_name) AS full_name_alt
FROM customers;
```

**Q52. UPPER and LOWER case conversion** (E-commerce)
```sql
SELECT 
  UPPER(email) AS email_upper,
  LOWER(product_name) AS product_lower
FROM products;
```

**Q53. LIKE for pattern matching** (Startup)
```sql
-- Task: Find Gmail users

SELECT customer_id, email
FROM customers
WHERE email LIKE '%@gmail.com';
```

### Intermediate Level

**Q54. SUBSTRING extraction** (FAANG)
```sql
-- Task: Extract domain from email

SELECT 
  email,
  SUBSTRING(email FROM POSITION('@' IN email) + 1) AS email_domain
FROM customers;
```

**Q55. REPLACE for data cleaning** (Finance)
```sql
SELECT 
  customer_name,
  REPLACE(phone_number, '-', '') AS clean_phone
FROM customers;
```

### Advanced Level

**Q56. REGEXP for complex patterns** (FAANG)
```sql
-- Task: Validate phone numbers format

SELECT 
  customer_id,
  phone_number,
  CASE 
    WHEN phone_number ~ '^\d{3}-\d{3}-\d{4}$' THEN 'Valid'
    ELSE 'Invalid'
  END AS phone_validation
FROM customers;
```

---

## 🎯 PATTERN 8: DISTINCT & Duplicates (Questions 57-61)

### Beginner Level

**Q57. Simple DISTINCT** (Startup)
```sql
SELECT DISTINCT country
FROM customers;
```

**Q58. COUNT DISTINCT** (E-commerce)
```sql
SELECT 
  COUNT(DISTINCT customer_id) AS unique_customers,
  COUNT(*) AS total_orders
FROM orders;
```

### Intermediate Level

**Q59. Find duplicates** (Finance)
```sql
-- Task: Identify duplicate transactions

SELECT 
  customer_id,
  transaction_date,
  amount,
  COUNT(*) AS duplicate_count
FROM transactions
GROUP BY customer_id, transaction_date, amount
HAVING COUNT(*) > 1;
```

**Q60. Remove duplicates with ROW_NUMBER** (FAANG)
```sql
WITH ranked_records AS (
  SELECT 
    *,
    ROW_NUMBER() OVER (PARTITION BY customer_id, order_date ORDER BY order_id) AS rn
  FROM orders
)
SELECT * 
FROM ranked_records
WHERE rn = 1;
```

**Q61. DISTINCT ON (PostgreSQL specific)** (FAANG)
```sql
-- Task: Get latest order per customer

SELECT DISTINCT ON (customer_id)
  customer_id,
  order_date,
  amount
FROM orders
ORDER BY customer_id, order_date DESC;
```

---

## ⚖️ PATTERN 9: HAVING vs WHERE (Questions 62-66)

### Beginner Level

**Q62. WHERE for row filtering** (Startup)
```sql
SELECT product_id, price
FROM products
WHERE price > 50;
```

**Q63. HAVING for group filtering** (E-commerce)
```sql
SELECT customer_id, COUNT(*) AS order_count
FROM orders
GROUP BY customer_id
HAVING COUNT(*) > 5;
```

### Intermediate Level

**Q64. WHERE and HAVING together** (Finance)
```sql
-- Task: High-value customers in specific region

SELECT 
  region,
  customer_id,
  SUM(amount) AS total_spent
FROM orders
WHERE region = 'North'
GROUP BY region, customer_id
HAVING SUM(amount) > 10000;
```

**Q65. HAVING with multiple conditions** (FAANG)
```sql
SELECT 
  product_id,
  COUNT(*) AS order_count,
  AVG(quantity) AS avg_quantity
FROM order_items
GROUP BY product_id
HAVING COUNT(*) > 100 AND AVG(quantity) > 2;
```

**Q66. Complex HAVING with subquery** (Finance)
```sql
SELECT 
  customer_id,
  AVG(amount) AS avg_order_value
FROM orders
GROUP BY customer_id
HAVING AVG(amount) > (SELECT AVG(amount) FROM orders);
```

---

## 🔄 PATTERN 10: Self JOINs (Questions 67-75)

### Beginner Level

**Q67. Find employee-manager relationships** (Startup)
```sql
SELECT 
  e.name AS employee,
  m.name AS manager
FROM employees e
LEFT JOIN employees m ON e.manager_id = m.employee_id;
```

**Q68. Find employees in same department** (E-commerce)
```sql
SELECT 
  e1.name AS employee1,
  e2.name AS employee2,
  e1.department
FROM employees e1
JOIN employees e2 
  ON e1.department = e2.department 
  AND e1.employee_id < e2.employee_id;
```

### Intermediate Level

**Q69. Find customers from same city** (E-commerce)
```sql
SELECT 
  c1.customer_id AS customer1,
  c2.customer_id AS customer2,
  c1.city
FROM customers c1
JOIN customers c2 
  ON c1.city = c2.city 
  AND c1.customer_id < c2.customer_id;
```

**Q70. Hierarchical query** (FAANG)
```sql
-- Task: Find all direct and indirect reports for a manager

WITH RECURSIVE reports AS (
  SELECT employee_id, name, manager_id, 0 AS level
  FROM employees
  WHERE employee_id = 101
  
  UNION ALL
  
  SELECT e.employee_id, e.name, e.manager_id, r.level + 1
  FROM employees e
  JOIN reports r ON e.manager_id = r.employee_id
)
SELECT * FROM reports;
```

### Advanced Level

**Q71. Find sequential transactions** (Finance)
```sql
-- Task: Find transactions that happened within 24 hours for same customer

SELECT 
  t1.transaction_id AS first_transaction,
  t2.transaction_id AS second_transaction,
  t2.transaction_date - t1.transaction_date AS time_diff
FROM transactions t1
JOIN transactions t2 
  ON t1.customer_id = t2.customer_id
  AND t2.transaction_date > t1.transaction_date
  AND t2.transaction_date <= t1.transaction_date + INTERVAL '24 hours';
```

**Q72. Compare product versions** (FAANG)
```sql
-- Task: Compare current vs previous product version

SELECT 
  current.product_id,
  current.version AS current_version,
  previous.version AS previous_version,
  current.features AS new_features
FROM products current
LEFT JOIN products previous 
  ON current.product_id = previous.product_id
  AND current.version_number = previous.version_number + 1;
```

**Q73. Find gaps in sequence** (Finance)
```sql
-- Task: Find missing order IDs

SELECT 
  t1.order_id + 1 AS missing_id_start,
  MIN(t2.order_id) - 1 AS missing_id_end
FROM orders t1
LEFT JOIN orders t2 ON t1.order_id < t2.order_id
WHERE t2.order_id IS NOT NULL
GROUP BY t1.order_id
HAVING t1.order_id + 1 < MIN(t2.order_id);
```

**Q74. Running comparison** (E-commerce)
```sql
-- Task: Compare each sale to the next sale

SELECT 
  s1.sale_id,
  s1.sale_amount,
  s2.sale_amount AS next_sale_amount,
  s2.sale_amount - s1.sale_amount AS difference
FROM sales s1
LEFT JOIN sales s2 
  ON s1.sale_id + 1 = s2.sale_id
ORDER BY s1.sale_id;
```

**Q75. Multi-level hierarchy** (FAANG)
```sql
-- Task: Find all employees and their chain of command

SELECT 
  e1.name AS employee,
  e2.name AS direct_manager,
  e3.name AS skip_level_manager,
  e4.name AS director
FROM employees e1
LEFT JOIN employees e2 ON e1.manager_id = e2.employee_id
LEFT JOIN employees e3 ON e2.manager_id = e3.employee_id
LEFT JOIN employees e4 ON e3.manager_id = e4.employee_id
WHERE e1.employee_id = 1001;
```

---

## 🎓 PRACTICE PLATFORMS

### Beginner Level
1. **SQLBolt** (sqlbolt.com) - Interactive tutorials
2. **W3Schools SQL** (w3schools.com/sql) - Basic concepts
3. **Mode Analytics SQL Tutorial** (mode.com/sql-tutorial) - Free lessons

### Intermediate Level
4. **LeetCode Database** (leetcode.com/problemset/database) - 200+ problems
5. **HackerRank SQL** (hackerrank.com/domains/sql) - Skill certification
6. **Stratascratch** (stratascratch.com) - Real interview questions

### Advanced Level
7. **DataLemur** (datalemur.com) - FAANG interview questions
8. **SQLPad** (sqlpad.io) - Practice with real datasets
9. **WindowFunctions.com** - Window function drills

### Company-Specific Practice
10. **Glassdoor Interview Questions** - Real company experiences
11. **Blind 75 SQL** - Curated list of most-asked questions
12. **interviewing.io** - Mock interviews with engineers

---

## 📚 STUDY PLAN

### Week 1-2: Foundations
- Patterns 1-3: JOINs, GROUP BY, Basic Window Functions
- Questions 1-28
- Platform: SQLBolt + W3Schools

### Week 3-4: Intermediate
- Patterns 4-7: Subqueries, Date Functions, CASE, Strings
- Questions 29-56
- Platform: LeetCode Easy/Medium

### Week 5-6: Advanced
- Patterns 8-10: DISTINCT, HAVING, Self JOINs
- Questions 57-75
- Platform: DataLemur + Stratascratch

### Interview Prep Week
- Review all patterns
- Do 10 random questions daily
- Focus on company-specific patterns
- Practice explaining your thought process

---

## 🎯 COMPANY-SPECIFIC FOCUS

**If interviewing at FAANG:**
Focus on: Q19-28 (Window Functions), Q29-36 (CTEs), Q60-61 (Deduplication), Q70-75 (Complex Self JOINs)

**If interviewing at Startups:**
Focus on: Q1-10 (Basic JOINs), Q11-18 (Aggregations), Q37-43 (Date Functions), Q51-56 (String Functions)

**If interviewing at Finance:**
Focus on: Q5, Q7-8 (Multi-condition JOINs), Q13-18 (Aggregations), Q20, Q23, Q26, Q28 (Window Functions), Q39-43 (Date/Time)

**If interviewing at E-commerce:**
Focus on: Q2, Q4, Q10 (Customer queries), Q17 (Category analysis), Q22 (Period comparisons), Q42 (Cohort analysis), Q69 (Customer relationships)

---

## 💡 TIPS FOR SUCCESS

1. **Understand the Pattern**: Don't memorize solutions, understand the approach
2. **Practice Explaining**: Talk through your logic out loud
3. **Optimize**: Always consider if there's a more efficient solution
4. **Test Edge Cases**: NULL values, empty results, duplicates
5. **Clean Code**: Use clear aliases, proper indentation, meaningful names
6. **Performance**: Know when to use indexes, avoid SELECT *, use EXPLAIN

---

**Master these 75 questions = Cover 90% of Data Analyst SQL interviews!**