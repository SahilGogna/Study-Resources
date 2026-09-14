# 10 SQL Queries for Data Analyst Interviews

These aren't random questions. After reviewing 100+ data analyst interviews, these patterns show up repeatedly.

**What you'll learn:**

- Based on real FAANG + startup interviews
- Covers beginner to intermediate difficulty
- Tests your practical SQL knowledge

**Pro tip:** Practice writing these without looking at solutions first. Answers are at the end.

---

## The 10 Queries

### Query #1: Basic SELECT with WHERE

**Question:** Find all customers who made purchases over $1000 in the last 30 days.

*Concepts tested:* Filtering with WHERE, date functions, basic aggregation.

### Query #2: JOIN Operations

**Question:** Show all employees and their department names, including employees without departments.

*Concepts tested:* LEFT JOIN understanding, NULL handling.

### Query #3: Subqueries

**Question:** Find employees earning more than their department's average salary.

*Concepts tested:* Correlated subqueries, comparison logic.

### Query #4: Window Functions

**Question:** Rank products by revenue within each category.

*Concepts tested:* ROW_NUMBER() or RANK(), PARTITION BY.

### Query #5: Self JOIN

**Question:** Find all employees who earn more than their manager.

*Concepts tested:* Self-referencing tables, JOIN conditions.

### Query #6: Finding Duplicates

**Question:** Find all duplicate email addresses in the users table.

*Concepts tested:* GROUP BY with HAVING, duplicate detection.

### Query #7: Second Highest Value

**Question:** Find the second highest salary in the company.

*Concepts tested:* Subqueries or LIMIT/OFFSET, distinct values.

### Query #8: Running Totals

**Question:** Calculate cumulative revenue by date.

*Concepts tested:* SUM() with OVER(), running calculations.

### Query #9: NULL Handling

**Question:** Find products with missing descriptions and replace with 'No description available'.

*Concepts tested:* COALESCE or IFNULL, NULL operations.

### Query #10: String Operations

**Question:** Extract domain from email addresses.

*Concepts tested:* String functions (SUBSTRING, POSITION), pattern matching.

---

## Answers

### Answer #1

```sql
SELECT customer_id, SUM(amount) as total_spent
FROM purchases
WHERE purchase_date >= CURRENT_DATE - INTERVAL '30 days'
GROUP BY customer_id
HAVING SUM(amount) > 1000;
```

### Answer #2

```sql
SELECT e.employee_name, d.department_name
FROM employees e
LEFT JOIN departments d ON e.dept_id = d.dept_id;
```

### Answer #3

```sql
SELECT employee_name, salary, dept_id
FROM employees e
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
    WHERE dept_id = e.dept_id
);
```

### Answer #4

```sql
SELECT product_name, category, revenue,
       RANK() OVER (PARTITION BY category ORDER BY revenue DESC) as rank
FROM products;
```

### Answer #5

```sql
SELECT e.employee_name, e.salary as emp_salary,
       m.employee_name as manager, m.salary as mgr_salary
FROM employees e
JOIN employees m ON e.manager_id = m.employee_id
WHERE e.salary > m.salary;
```

### Answer #6

```sql
SELECT email, COUNT(*) as count
FROM users
GROUP BY email
HAVING COUNT(*) > 1;
```

### Answer #7

```sql
SELECT MAX(salary) as second_highest
FROM employees
WHERE salary < (SELECT MAX(salary) FROM employees);
```

### Answer #8

```sql
SELECT order_date, revenue,
       SUM(revenue) OVER (ORDER BY order_date) as cumulative_revenue
FROM orders
ORDER BY order_date;
```

### Answer #9

```sql
SELECT product_id, product_name,
       COALESCE(description, 'No description available') as description
FROM products;
```

### Answer #10

```sql
SELECT email,
       SUBSTRING(email FROM POSITION('@' IN email) + 1) as domain
FROM users;
```
