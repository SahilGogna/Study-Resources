-- ============================================================
-- SQL 75 Questions — Practice Datasets
-- Database: PostgreSQL
-- ============================================================
-- Tables (17 total):
--   customers, products, colors, orders, order_items,
--   employees, transactions, subscriptions, stock_prices,
--   trades, accounts, sales, system1, system2,
--   monthly_sales, customer_summary, customer_totals,
--   product_versions
-- ============================================================
--
-- COLUMN NOTES (where question SQL differs from table schema):
--   Q21  → uses 'employee_name'  : column is 'name' in employees
--   Q42  → uses 'signup_date'    : included as column in orders
--   Q55  → uses 'customer_name'  : column included in customers
--   Q70  → WHERE employee_id = 101 : change to 2 (VP Engineering)
--   Q75  → WHERE e1.employee_id = 1001 : change to any id (e.g. 9)
--   Q22  → ORDER BY month (VARCHAR): change to ORDER BY month_num
--   Q33  → HAVING SUM > 5000    : lower to 1000 for sample data
--   Q64  → HAVING SUM > 10000   : lower to 500 for sample data
--   Q65  → HAVING COUNT(*) > 100: lower to 2 for sample data
--   Q72  → self-join on products : use product_versions table
-- ============================================================


-- ============================================================
-- DROP (in reverse FK dependency order)
-- ============================================================
DROP TABLE IF EXISTS customer_totals    CASCADE;
DROP TABLE IF EXISTS customer_summary   CASCADE;
DROP TABLE IF EXISTS monthly_sales      CASCADE;
DROP TABLE IF EXISTS product_versions   CASCADE;
DROP TABLE IF EXISTS system2            CASCADE;
DROP TABLE IF EXISTS system1            CASCADE;
DROP TABLE IF EXISTS sales              CASCADE;
DROP TABLE IF EXISTS accounts           CASCADE;
DROP TABLE IF EXISTS trades             CASCADE;
DROP TABLE IF EXISTS stock_prices       CASCADE;
DROP TABLE IF EXISTS subscriptions      CASCADE;
DROP TABLE IF EXISTS transactions       CASCADE;
DROP TABLE IF EXISTS order_items        CASCADE;
DROP TABLE IF EXISTS orders             CASCADE;
DROP TABLE IF EXISTS colors             CASCADE;
DROP TABLE IF EXISTS products           CASCADE;
DROP TABLE IF EXISTS employees          CASCADE;
DROP TABLE IF EXISTS customers          CASCADE;


-- ============================================================
-- 1. CUSTOMERS
-- Used in: Q1-Q5, Q10, Q30, Q32-Q33, Q38, Q41-Q42,
--          Q45, Q51-Q57, Q60-Q61, Q63-Q64, Q66, Q69
-- ============================================================
CREATE TABLE customers (
    customer_id   SERIAL PRIMARY KEY,
    name          VARCHAR(100),
    customer_name VARCHAR(100),   -- same as name; used in Q55
    first_name    VARCHAR(50),
    last_name     VARCHAR(50),
    email         VARCHAR(150),   -- NULL for some rows → Q45
    phone_number  VARCHAR(20),    -- invalid format for some → Q56
    country       VARCHAR(50),
    city          VARCHAR(50),
    birth_date    DATE,
    category      VARCHAR(50)     -- Premium / Standard / Budget → Q5
);

INSERT INTO customers
    (name, customer_name, first_name, last_name, email, phone_number, country, city, birth_date, category)
VALUES
    ('Alice Johnson',  'Alice Johnson',  'Alice',  'Johnson',  'alice@gmail.com',   '555-123-4567',  'USA',       'New York',      '1990-03-15', 'Premium'),
    ('Bob Smith',      'Bob Smith',      'Bob',    'Smith',    'bob@yahoo.com',      '555-234-5678',  'USA',       'Los Angeles',   '1985-07-22', 'Standard'),
    ('Carol White',    'Carol White',    'Carol',  'White',    'carol@gmail.com',    '555-345-6789',  'UK',        'London',        '1992-11-30', 'Premium'),
    ('David Brown',    'David Brown',    'David',  'Brown',    'david@outlook.com',  '555.456.7890',  'Canada',    'Toronto',       '1988-04-10', 'Standard'),
    ('Eva Martinez',   'Eva Martinez',   'Eva',    'Martinez', 'eva@gmail.com',      '555-567-8901',  'USA',       'Chicago',       '1995-09-05', 'Budget'),
    ('Frank Lee',      'Frank Lee',      'Frank',  'Lee',      NULL,                 '5556789012',    'Australia', 'Sydney',        '1983-01-20', 'Standard'),
    ('Grace Kim',      'Grace Kim',      'Grace',  'Kim',      'grace@gmail.com',    '555-789-0123',  'USA',       'New York',      '1991-06-14', 'Premium'),
    ('Henry Davis',    'Henry Davis',    'Henry',  'Davis',    'henry@company.com',  '555-890-1234',  'UK',        'London',        '1987-12-03', 'Budget'),
    ('Iris Chen',      'Iris Chen',      'Iris',   'Chen',     'iris@gmail.com',     '555-901-2345',  'USA',       'San Francisco', '1993-08-25', 'Premium'),
    ('Jack Wilson',    'Jack Wilson',    'Jack',   'Wilson',   'jack@hotmail.com',   '555-012-3456',  'Canada',    'Toronto',       '1986-02-17', 'Standard'),
    ('Karen Taylor',   'Karen Taylor',   'Karen',  'Taylor',   NULL,                 'INVALID-PHONE', 'USA',       'Boston',        '1994-05-09', 'Budget'),
    ('Liam Anderson',  'Liam Anderson',  'Liam',   'Anderson', 'liam@gmail.com',     '555-111-2222',  'USA',       'Seattle',       '1997-10-31', 'Premium');
-- Customers 11 (Karen) and 12 (Liam) have NO orders → Q2 (customers without orders), Q45 (NULL email)
-- Duplicate cities: New York → 1,7 | London → 3,8 | Toronto → 4,10 → Q69 (customers in same city)
-- NULL emails: customers 6 (Frank), 11 (Karen) → Q45
-- Invalid phone: customer 11 (Karen) → Q56


-- ============================================================
-- 2. PRODUCTS
-- Used in: Q3-Q4, Q9, Q12, Q14, Q17, Q19, Q24, Q29, Q44, Q52
-- ============================================================
CREATE TABLE products (
    product_id     SERIAL PRIMARY KEY,
    product_name   VARCHAR(100),
    price          NUMERIC(10,2),
    category       VARCHAR(50),
    subcategory    VARCHAR(50),
    sales          NUMERIC(12,2),
    inventory      INTEGER,
    version        VARCHAR(20),
    version_number INTEGER,
    features       TEXT,
    email          VARCHAR(150)   -- vendor/supplier contact; used in Q52
);

INSERT INTO products
    (product_name, price, category, subcategory, sales, inventory, version, version_number, features, email)
VALUES
    ('Laptop Pro',     1299.99, 'Electronics', 'Computers',   45000.00, 50,  'v2', 2, 'Upgraded quad-core processor, 16GB RAM', 'vendor@laptopco.com'),
    ('Wireless Mouse',   29.99, 'Electronics', 'Peripherals',  8000.00, 200, 'v1', 1, 'Basic 2.4GHz wireless connectivity',     'peripherals@techsupply.com'),
    ('Python Book',      49.99, 'Books',       'Programming',  5000.00, 100, 'v3', 3, 'Updated to Python 3.12 with exercises',  'editor@bookpress.com'),
    ('Running Shoes',    89.99, 'Clothing',    'Footwear',    15000.00, 75,  'v1', 1, 'Lightweight foam sole, breathable mesh', 'footwear@sportsbrand.com'),
    ('Coffee Maker',     79.99, 'Electronics', 'Appliances',  12000.00, 30,  'v2', 2, 'Faster brew cycle, quieter motor',       'vendor@homeappliances.com'),
    ('SQL Workbook',     34.99, 'Books',       'Database',     3500.00, 60,  'v1', 1, 'Beginner-friendly SQL exercises',        'editor@bookpress.com'),
    ('Yoga Mat',         24.99, 'Clothing',    'Fitness',      4000.00, 150, 'v1', 1, 'Non-slip surface, 6mm thick',            'supplier@yogaworld.com'),
    ('USB Hub',          39.99, 'Electronics', 'Peripherals',  6000.00, 80,  'v2', 2, 'Added USB-C, expanded to 7 ports',       'peripherals@techsupply.com'),
    ('Desk Lamp',        54.99, 'Electronics', 'Lighting',     2000.00, 40,  'v1', 1, 'LED dimmable, touch control',            'vendor@lightingsupply.com'),
    ('Notebook',          9.99, 'Books',       'Stationery',   1000.00, 300, 'v1', 1, 'Ruled, 200 pages, A5 size',              'stationery@officesupply.com');
-- Products 9 (Desk Lamp) and 10 (Notebook) are NEVER ordered → Q4 (products never ordered)
-- Electronics category has most products → interesting results for Q14, Q19


-- ============================================================
-- 3. COLORS (for Q9 — CROSS JOIN with products)
-- ============================================================
CREATE TABLE colors (
    color VARCHAR(30)
);

INSERT INTO colors (color) VALUES
    ('Red'), ('Blue'), ('Green'), ('Black');


-- ============================================================
-- 4. ORDERS
-- Used in: Q1-Q5, Q10-Q13, Q15-Q16, Q18, Q25, Q30,
--          Q34, Q37-Q38, Q42-Q43, Q46-Q47, Q58, Q60-Q61,
--          Q63-Q64, Q66, Q73
-- ============================================================
-- DESIGN NOTES:
--   order_id has intentional gaps at 4, 9, 14 → Q73 (gap finding)
--   signup_date = when customer first signed up → Q42 (cohort)
--   Multiple orders per customer for aggregation questions
--   Mix of statuses: completed / pending / cancelled → Q18, Q46
-- ============================================================
CREATE TABLE orders (
    order_id      INTEGER PRIMARY KEY,
    customer_id   INTEGER REFERENCES customers(customer_id),
    product_id    INTEGER REFERENCES products(product_id),
    amount        NUMERIC(10,2),
    quantity      INTEGER,
    order_date    DATE,
    delivery_date DATE,
    signup_date   DATE,          -- customer signup date; used in Q42
    status        VARCHAR(20),
    region        VARCHAR(50)
);

INSERT INTO orders
    (order_id, customer_id, product_id, amount, quantity, order_date, delivery_date, signup_date, status, region)
VALUES
    (1,  1,  1, 1299.99, 1, '2024-01-05', '2024-01-10', '2023-01-05', 'completed', 'North'),
    (2,  2,  2,   29.99, 2, '2024-01-08', '2024-01-12', '2023-02-10', 'completed', 'South'),
    (3,  1,  3,   49.99, 1, '2024-01-15', '2024-01-18', '2023-01-05', 'completed', 'North'),
    -- gap at order_id 4
    (5,  3,  4,   89.99, 1, '2024-01-20', '2024-01-25', '2023-03-15', 'completed', 'East'),
    (6,  4,  5,   79.99, 1, '2024-02-01', '2024-02-05', '2023-04-20', 'pending',   'North'),
    (7,  2,  1, 1299.99, 1, '2024-02-10', '2024-02-16', '2023-02-10', 'completed', 'South'),
    (8,  5,  6,   34.99, 2, '2024-02-14', '2024-02-17', '2023-05-01', 'completed', 'West'),
    -- gap at order_id 9
    (10, 6,  7,   24.99, 3, '2024-02-20', '2024-02-23', '2023-06-10', 'completed', 'South'),
    (11, 7,  8,   39.99, 1, '2024-03-01', '2024-03-05', '2023-01-20', 'cancelled', 'North'),
    (12, 1,  5,   79.99, 1, '2024-03-10', '2024-03-14', '2023-01-05', 'completed', 'North'),
    (13, 8,  3,   49.99, 2, '2024-03-15', '2024-03-19', '2023-07-15', 'completed', 'East'),
    -- gap at order_id 14
    (15, 3,  2,   29.99, 1, '2024-03-20', '2024-03-23', '2023-03-15', 'pending',   'East'),
    (16, 9,  1, 1299.99, 1, '2024-04-01', '2024-04-07', '2023-08-01', 'completed', 'West'),
    (17, 2,  4,   89.99, 2, '2024-04-05', '2024-04-10', '2023-02-10', 'completed', 'South'),
    (18, 4,  8,   39.99, 1, '2024-04-10', '2024-04-14', '2023-04-20', 'completed', 'North'),
    (19, 7,  3,   49.99, 1, '2024-04-15', '2024-04-18', '2023-01-20', 'completed', 'North'),
    (20, 5,  7,   24.99, 2, '2024-04-20', '2024-04-23', '2023-05-01', 'pending',   'West'),
    (21, 9,  6,   34.99, 3, '2024-05-01', '2024-05-04', '2023-08-01', 'completed', 'West'),
    (22, 1,  2,   29.99, 1, '2024-05-05', '2024-05-08', '2023-01-05', 'cancelled', 'North'),
    (23, 10, 4,   89.99, 1, '2024-05-10', '2024-05-14', '2023-09-05', 'completed', 'East'),
    -- Duplicate customer+date rows below → Q60 (ROW_NUMBER deduplication), Q61 (DISTINCT ON)
    (24,  1, 2,   29.99, 1, '2024-01-05', '2024-01-09', '2023-01-05', 'pending',   'North'),  -- same customer 1, same date as order 1
    (25,  2, 3,   49.99, 1, '2024-01-08', '2024-01-11', '2023-02-10', 'pending',   'South');  -- same customer 2, same date as order 2
-- Customers without orders: 11 (Karen), 12 (Liam) → Q2
-- order_id gaps: 4, 9, 14 → Q73 (gap finding query returns missing_ids 4, 9, 14)
-- North region customers with decent spend: customer 1 (≈1490), customer 7 (≈90)
-- Duplicate customer+order_date: orders 1+24 (customer 1, 2024-01-05), orders 2+25 (customer 2, 2024-01-08) → Q60, Q61


-- ============================================================
-- 5. ORDER_ITEMS
-- Used in: Q12 (total sales by product), Q65 (HAVING on items)
-- ============================================================
CREATE TABLE order_items (
    item_id    SERIAL PRIMARY KEY,
    order_id   INTEGER REFERENCES orders(order_id),
    product_id INTEGER REFERENCES products(product_id),
    quantity   INTEGER,
    price      NUMERIC(10,2)
);

INSERT INTO order_items (order_id, product_id, quantity, price) VALUES
    (1,  1, 1, 1299.99),
    (1,  2, 2,   29.99),
    (2,  2, 2,   29.99),
    (3,  3, 1,   49.99),
    (5,  4, 1,   89.99),
    (6,  5, 1,   79.99),
    (7,  1, 1, 1299.99),
    (7,  3, 2,   49.99),
    (8,  6, 2,   34.99),
    (10, 7, 3,   24.99),
    (11, 8, 1,   39.99),
    (12, 5, 1,   79.99),
    (12, 2, 1,   29.99),
    (13, 3, 2,   49.99),
    (15, 2, 1,   29.99),
    (16, 1, 1, 1299.99),
    (17, 4, 2,   89.99),
    (18, 8, 1,   39.99),
    (19, 3, 1,   49.99),
    (20, 7, 2,   24.99),
    (21, 6, 3,   34.99),
    (22, 2, 1,   29.99),
    (23, 4, 1,   89.99);
-- Note: Q65 HAVING COUNT(*) > 100 → lower threshold to > 2 for sample data
--       e.g.: HAVING COUNT(*) > 2 AND AVG(quantity) > 1


-- ============================================================
-- 6. EMPLOYEES
-- Used in: Q6, Q21, Q26, Q31, Q35, Q67, Q68, Q70, Q75
-- ============================================================
-- Hierarchy (4 levels):
--   L1: CEO (no manager)
--   L2: VP Engineering, VP Sales, VP Finance
--   L3: Senior Engineers, Sales Manager, Finance Manager
--   L4: Engineers, Sales Rep
-- ============================================================
CREATE TABLE employees (
    employee_id INTEGER PRIMARY KEY,
    name        VARCHAR(100),
    manager_id  INTEGER REFERENCES employees(employee_id),
    department  VARCHAR(50),
    salary      NUMERIC(10,2)
);

INSERT INTO employees (employee_id, name, manager_id, department, salary) VALUES
    (1,  'Sarah Connor',  NULL, 'Executive',   250000.00),   -- CEO
    (2,  'Tom Bradley',   1,    'Engineering', 180000.00),   -- VP Engineering
    (3,  'Lisa Park',     1,    'Sales',       160000.00),   -- VP Sales
    (4,  'Mark Rivera',   1,    'Finance',     170000.00),   -- VP Finance
    (5,  'James Liu',     2,    'Engineering', 120000.00),   -- Senior Engineer
    (6,  'Nina Patel',    2,    'Engineering', 115000.00),   -- Senior Engineer
    (7,  'Anna Torres',   3,    'Sales',        95000.00),   -- Sales Manager
    (8,  'Chris Evans',   4,    'Finance',     110000.00),   -- Finance Manager
    (9,  'Mike Johnson',  5,    'Engineering',  90000.00),   -- Engineer
    (10, 'Emily Wong',    5,    'Engineering',  85000.00),   -- Engineer
    (11, 'Ryan Kim',      6,    'Engineering',  88000.00),   -- Engineer
    (12, 'Sophie Hall',   7,    'Sales',        72000.00);   -- Sales Rep
-- Q21: references 'employee_name' → change to 'name'
-- Q70: WHERE employee_id = 101 → change to 2 (VP Engineering; shows 4-level chain)
-- Q75: WHERE e1.employee_id = 1001 → change to 9 (shows full chain up to CEO)
-- Salary spread: 72k–250k → good spread for Q21 RANK/DENSE_RANK, Q26 CUME_DIST, Q31 dept avg


-- ============================================================
-- 7. TRANSACTIONS
-- Used in: Q7, Q20, Q39, Q59, Q71
-- ============================================================
-- Includes:
--   Exact duplicates (same customer + amount + timestamp) → Q59
--   Transactions within 24h for same customer → Q71
--   Same amount + same timestamp → Q7 (multi-condition self-join)
-- ============================================================
CREATE TABLE transactions (
    transaction_id   SERIAL PRIMARY KEY,
    customer_id      INTEGER REFERENCES customers(customer_id),
    amount           NUMERIC(10,2),
    transaction_date TIMESTAMP
);

INSERT INTO transactions (customer_id, amount, transaction_date) VALUES
    (1,  500.00,  '2024-01-05 09:00:00'),
    (2,  150.00,  '2024-01-06 14:30:00'),
    (3,  750.00,  '2024-01-07 10:00:00'),
    (4,  200.00,  '2024-01-08 11:00:00'),
    (1,  300.00,  '2024-01-09 15:00:00'),
    (5,  450.00,  '2024-01-10 08:00:00'),
    (6,  100.00,  '2024-01-11 16:00:00'),
    (3,  750.00,  '2024-01-07 10:00:00'),  -- duplicate of row 3 → Q59
    (7,  600.00,  '2024-01-12 09:30:00'),
    (1,  200.00,  '2024-01-12 20:00:00'),  -- customer 1, sequential pair start → Q71
    (1,  350.00,  '2024-01-13 10:00:00'),  -- customer 1, within 14h of row 10 → Q71
    (8,  250.00,  '2024-01-15 12:00:00'),
    (2,  150.00,  '2024-01-06 14:30:00'),  -- duplicate of row 2 → Q59
    (9,  800.00,  '2024-01-16 09:00:00'),
    (4,  200.00,  '2024-01-08 11:00:00');  -- duplicate of row 4 → Q59
-- Q59 duplicates: customer 3 (750, 2024-01-07), customer 2 (150, 2024-01-06), customer 4 (200, 2024-01-08)
-- Q71 pairs: customer 1 rows 10→11 (14h apart, within 24h window)
-- Q7  pairs: rows 3+8, 2+13, 4+15 (same amount AND same timestamp)


-- ============================================================
-- 8. SUBSCRIPTIONS (for Q40 — subscription expiration dates)
-- ============================================================
CREATE TABLE subscriptions (
    subscription_id    SERIAL PRIMARY KEY,
    customer_id        INTEGER REFERENCES customers(customer_id),
    subscription_start DATE
);

INSERT INTO subscriptions (customer_id, subscription_start) VALUES
    (1,  '2024-01-01'),
    (2,  '2024-01-15'),
    (3,  '2024-02-01'),
    (4,  '2024-02-10'),
    (5,  '2024-03-01'),
    (6,  '2024-03-15'),
    (7,  '2024-04-01'),
    (8,  '2024-04-20');


-- ============================================================
-- 9. STOCK_PRICES (for Q23, Q28 — 7-day moving average)
-- ============================================================
CREATE TABLE stock_prices (
    date  DATE PRIMARY KEY,
    price NUMERIC(10,2)
);

INSERT INTO stock_prices (date, price) VALUES
    ('2024-01-01', 150.25),
    ('2024-01-02', 152.50),
    ('2024-01-03', 148.75),
    ('2024-01-04', 155.00),
    ('2024-01-05', 153.25),
    ('2024-01-06', 157.50),
    ('2024-01-07', 156.00),
    ('2024-01-08', 160.25),
    ('2024-01-09', 158.75),
    ('2024-01-10', 162.50),
    ('2024-01-11', 165.00),
    ('2024-01-12', 163.25),
    ('2024-01-13', 168.50),
    ('2024-01-14', 170.00);
-- 14 daily rows → first 7-day moving avg becomes meaningful at row 7


-- ============================================================
-- 10. TRADES (for Q36 — top 5 trades per trader via CTE + window)
-- ============================================================
CREATE TABLE trades (
    trade_id     SERIAL PRIMARY KEY,
    trader_id    INTEGER,
    trade_date   DATE,
    profit_loss  NUMERIC(12,2)
);

INSERT INTO trades (trader_id, trade_date, profit_loss) VALUES
    (101, '2024-01-05',  5000.00),
    (101, '2024-01-10', -2000.00),
    (101, '2024-01-15',  8000.00),
    (101, '2024-01-20',  3500.00),
    (101, '2024-01-25', -1000.00),
    (101, '2024-01-30',  6000.00),
    (102, '2024-01-05',  4000.00),
    (102, '2024-01-12',  7500.00),
    (102, '2024-01-18', -3000.00),
    (102, '2024-01-22',  9000.00),
    (102, '2024-01-28',  2000.00),
    (103, '2024-01-07',  1500.00),
    (103, '2024-01-14',  5500.00),
    (103, '2024-01-21',  -500.00),
    (103, '2024-01-28',  4500.00);
-- Trader 101: 6 trades → top 5 by profit_loss will exclude the -2000 row
-- Trader 102: 5 trades → all 5 returned
-- Trader 103: 4 trades → all 4 returned (fewer than 5)


-- ============================================================
-- 11. ACCOUNTS (for Q50 — CASE with balance tier logic)
-- ============================================================
CREATE TABLE accounts (
    account_id SERIAL PRIMARY KEY,
    balance    NUMERIC(12,2)
);

INSERT INTO accounts (balance) VALUES
    ( -500.00),   -- Overdrawn
    (    0.00),   -- Zero Balance
    (  250.00),   -- Low Balance
    (  750.00),   -- Low Balance
    ( 1000.00),   -- Standard (exactly at boundary)
    ( 5000.00),   -- Standard
    ( 9999.99),   -- Standard
    (15000.00),   -- High Balance
    (50000.00),   -- High Balance
    ( -150.00);   -- Overdrawn


-- ============================================================
-- 12. SALES (for Q74 — compare each sale to next sale via self-join)
-- ============================================================
CREATE TABLE sales (
    sale_id     INTEGER PRIMARY KEY,
    sale_amount NUMERIC(10,2)
);

INSERT INTO sales (sale_id, sale_amount) VALUES
    (1, 1500.00),
    (2, 2300.00),
    (3, 1800.00),
    (4, 2100.00),
    (5,  950.00),
    (6, 3200.00),
    (7, 2800.00),
    (8, 1600.00);
-- Sequential IDs → self-join on sale_id + 1 = sale_id works cleanly
-- Row 8 has no next sale → returns NULL for next_sale_amount


-- ============================================================
-- 13. SYSTEM1 & SYSTEM2 (for Q8 — FULL OUTER JOIN reconciliation)
-- ============================================================
CREATE TABLE system1 (
    id     INTEGER PRIMARY KEY,
    amount NUMERIC(10,2)
);

CREATE TABLE system2 (
    id     INTEGER PRIMARY KEY,
    amount NUMERIC(10,2)
);

INSERT INTO system1 (id, amount) VALUES
    (1,  500.00),
    (2, 1200.00),
    (3,  750.00),
    (4,  300.00),   -- amount mismatch with system2 → returned by Q8
    (5,  900.00);   -- only in system1 (no matching id in system2) → returned by Q8

INSERT INTO system2 (id, amount) VALUES
    (1,  500.00),
    (2, 1200.00),
    (3,  750.00),
    (4,  350.00),   -- amount mismatch with system1 → returned by Q8
    (6,  450.00);   -- only in system2 (no matching id in system1) → returned by Q8
-- Q8 result: ids 4 (mismatch), 5 (system1 only), 6 (system2 only)


-- ============================================================
-- 14. MONTHLY_SALES
-- Used in: Q22 (LAG for month-over-month), Q49 (CASE pivot)
-- ============================================================
-- month     : month name VARCHAR ('January' etc.) → used in Q49
-- month_num : integer 1-12 for correct chronological ORDER BY
-- ============================================================
-- NOTE for Q22: replace ORDER BY month with ORDER BY month_num
-- ============================================================
CREATE TABLE monthly_sales (
    id         SERIAL PRIMARY KEY,
    product_id INTEGER REFERENCES products(product_id),
    month      VARCHAR(20),
    month_num  INTEGER,
    sales      NUMERIC(12,2)
);

INSERT INTO monthly_sales (product_id, month, month_num, sales) VALUES
    (1, 'January',  1, 12000.00),
    (1, 'February', 2, 13500.00),
    (1, 'March',    3, 11800.00),
    (2, 'January',  1,  2500.00),
    (2, 'February', 2,  2800.00),
    (2, 'March',    3,  2300.00),
    (3, 'January',  1,  1200.00),
    (3, 'February', 2,  1500.00),
    (3, 'March',    3,  1800.00),
    (4, 'January',  1,  3000.00),
    (4, 'February', 2,  3500.00),
    (4, 'March',    3,  2800.00);
-- Q22 (LAG): filter by product_id for clean month-over-month comparison
--   e.g. add: WHERE product_id = 1
-- Q49 (CASE pivot): groups by product_id, sums Jan/Feb/Mar columns


-- ============================================================
-- 15. CUSTOMER_SUMMARY (for Q48 — nested CASE customer tiers)
-- ============================================================
CREATE TABLE customer_summary (
    customer_id     INTEGER REFERENCES customers(customer_id),
    total_orders    INTEGER,
    avg_order_value NUMERIC(10,2)
);

INSERT INTO customer_summary (customer_id, total_orders, avg_order_value) VALUES
    (1,  15, 250.00),   -- VIP:      total_orders > 10 AND avg > 100
    (2,  12,  80.00),   -- Frequent: total_orders > 10 AND avg <= 100
    (3,   8, 150.00),   -- Regular:  total_orders > 5
    (4,   3,  60.00),   -- New:      total_orders <= 5
    (5,  11, 120.00),   -- VIP
    (6,   4,  45.00),   -- New
    (7,  20, 300.00),   -- VIP
    (8,   7,  90.00),   -- Regular
    (9,  13, 200.00),   -- VIP
    (10,  2,  30.00);   -- New


-- ============================================================
-- 16. CUSTOMER_TOTALS (for Q27 — NTILE spending quartiles)
-- ============================================================
CREATE TABLE customer_totals (
    customer_id INTEGER REFERENCES customers(customer_id),
    total_spent NUMERIC(12,2)
);

INSERT INTO customer_totals (customer_id, total_spent) VALUES
    (1,   4500.00),
    (2,   1200.00),
    (3,   8900.00),
    (4,    350.00),
    (5,   2100.00),
    (6,    150.00),
    (7,   6700.00),
    (8,    800.00),
    (9,  12000.00),
    (10,   500.00);
-- NTILE(4) quartile split (sorted):
--   Q1 (lowest): 150, 350
--   Q2:          500, 800
--   Q3:         1200, 2100
--   Q4 (highest):4500, 6700, 8900, 12000


-- ============================================================
-- 17. PRODUCT_VERSIONS (for Q72 — self-join comparing versions)
-- ============================================================
-- WHY separate table: products uses product_id as PRIMARY KEY
--   (one row per product). Q72 requires multiple rows per
--   product_id (one per version). Use product_versions instead.
-- ============================================================
-- NOTE for Q72: replace 'products' with 'product_versions'
-- ============================================================
CREATE TABLE product_versions (
    id             SERIAL PRIMARY KEY,
    product_id     INTEGER,
    product_name   VARCHAR(100),
    version        VARCHAR(20),
    version_number INTEGER,
    features       TEXT
);

INSERT INTO product_versions (product_id, product_name, version, version_number, features) VALUES
    (1, 'Laptop Pro',   'v1', 1, 'Dual-core processor, 8GB RAM'),
    (1, 'Laptop Pro',   'v2', 2, 'Quad-core processor, 16GB RAM'),
    (5, 'Coffee Maker', 'v1', 1, 'Basic brew, manual temperature'),
    (5, 'Coffee Maker', 'v2', 2, 'Faster brew cycle, quieter motor'),
    (8, 'USB Hub',      'v1', 1, 'Standard 4-port USB-A hub'),
    (8, 'USB Hub',      'v2', 2, 'Added USB-C, expanded to 7 ports');
-- Each product has 2 versions → Q72 self-join (current LEFT JOIN previous)
-- returns: current version, previous version, and new features for each product


-- ============================================================
-- VERIFICATION (run after loading to confirm row counts)
-- ============================================================
SELECT 'customers'       AS table_name, COUNT(*) AS rows FROM customers
UNION ALL SELECT 'products',       COUNT(*) FROM products
UNION ALL SELECT 'colors',         COUNT(*) FROM colors
UNION ALL SELECT 'orders',         COUNT(*) FROM orders
UNION ALL SELECT 'order_items',    COUNT(*) FROM order_items
UNION ALL SELECT 'employees',      COUNT(*) FROM employees
UNION ALL SELECT 'transactions',   COUNT(*) FROM transactions
UNION ALL SELECT 'subscriptions',  COUNT(*) FROM subscriptions
UNION ALL SELECT 'stock_prices',   COUNT(*) FROM stock_prices
UNION ALL SELECT 'trades',         COUNT(*) FROM trades
UNION ALL SELECT 'accounts',       COUNT(*) FROM accounts
UNION ALL SELECT 'sales',          COUNT(*) FROM sales
UNION ALL SELECT 'system1',        COUNT(*) FROM system1
UNION ALL SELECT 'system2',        COUNT(*) FROM system2
UNION ALL SELECT 'monthly_sales',  COUNT(*) FROM monthly_sales
UNION ALL SELECT 'customer_summary', COUNT(*) FROM customer_summary
UNION ALL SELECT 'customer_totals',  COUNT(*) FROM customer_totals
UNION ALL SELECT 'product_versions', COUNT(*) FROM product_versions
ORDER BY table_name;
