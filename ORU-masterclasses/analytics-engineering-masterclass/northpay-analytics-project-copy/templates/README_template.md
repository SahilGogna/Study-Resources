# NorthPay Analytics Engineering

> Built with [DuckDB / BigQuery / Snowflake] | [Your Name] | [Date]

---

## Overview

[2–3 sentences describing what you built and what problem it solves.]

---

## Data Model

### Architecture

```
Raw CSVs
   │
   ▼
Staging Layer          ← clean, type, rename only
   │
   ▼
Marts Layer            ← business logic, aggregations, metrics
```

### Model Grain

| Model | Grain |
|-------|-------|
| `stg_transactions` | 1 row per raw transaction |
| `stg_refunds` | 1 row per refund |
| `stg_merchants` | 1 row per merchant |
| `stg_fee_plans` | 1 row per fee plan |
| `fct_payments` | 1 row per completed transaction |
| `dim_merchants` | 1 row per merchant |
| `mart_merchant_performance` | 1 row per merchant per month |
| `mart_daily_volume` | 1 row per day per currency |

### ERD

[Insert your ERD here — image, dbdiagram.io link, or ASCII diagram]

---

## Setup

```bash
# Install DuckDB
pip install duckdb

# Start DuckDB
duckdb northpay.db
```

Inside the DuckDB shell:

```sql
CREATE TABLE raw_transactions AS SELECT * FROM read_csv_auto('data/transactions.csv');
CREATE TABLE raw_refunds      AS SELECT * FROM read_csv_auto('data/refunds.csv');
CREATE TABLE raw_merchants    AS SELECT * FROM read_csv_auto('data/merchants.csv');
CREATE TABLE raw_fee_plans    AS SELECT * FROM read_csv_auto('data/fee_plans.csv');
```

Run models in order:

```bash
duckdb northpay.db < models/staging/stg_transactions.sql
duckdb northpay.db < models/staging/stg_refunds.sql
duckdb northpay.db < models/staging/stg_merchants.sql
duckdb northpay.db < models/staging/stg_fee_plans.sql
duckdb northpay.db < models/marts/fct_payments.sql
duckdb northpay.db < models/marts/dim_merchants.sql
duckdb northpay.db < models/marts/mart_merchant_performance.sql
duckdb northpay.db < models/marts/mart_daily_volume.sql
```

Run tests:

```bash
duckdb northpay.db < tests/run_all_tests.sql
```

---

## Metrics

| Metric | Definition | Model |
|--------|-----------|-------|
| GMV | Sum of completed transaction amounts in CAD | `mart_merchant_performance` |
| Net Revenue | GMV minus total refunds in CAD | `fct_payments` |
| Refund Rate | Refund count ÷ completed transaction count | `mart_merchant_performance` |
| ATV | Avg transaction amount in CAD (completed only) | `mart_merchant_performance` |
| Authorization Rate | Completed ÷ (Completed + Failed) | `mart_merchant_performance` |
| Take Rate | Total fees ÷ GMV | `mart_merchant_performance` |

---

## Example Queries

### Top Merchants by Net Revenue

```sql
-- Replace with your actual query
SELECT
    merchant_name,
    ROUND(SUM(net_revenue_cad), 2) AS net_revenue
FROM mart_merchant_performance
WHERE year = 2024
GROUP BY merchant_name
ORDER BY net_revenue DESC;
```

---

## Diagnosis

### Data Quality Issues Found

1. [Issue + business impact]
2. [Issue + business impact]
3. [Issue + business impact]

### Assumptions

- [Assumption 1]
- [Assumption 2]

### Open Questions for the Business

- [Question 1]
- [Question 2]

---

## Project Structure

```
northpay-analytics/
├── data/
│   ├── transactions.csv
│   ├── refunds.csv
│   ├── merchants.csv
│   └── fee_plans.csv
├── models/
│   ├── staging/
│   │   ├── stg_transactions.sql
│   │   ├── stg_refunds.sql
│   │   ├── stg_merchants.sql
│   │   └── stg_fee_plans.sql
│   └── marts/
│       ├── fct_payments.sql
│       ├── dim_merchants.sql
│       ├── mart_merchant_performance.sql
│       └── mart_daily_volume.sql
├── tests/
│   └── run_all_tests.sql
└── README.md
```

---

**[Your Name]** | [LinkedIn](https://linkedin.com/in/you) | [GitHub](https://github.com/you)
