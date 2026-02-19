[setup_guide.md](https://github.com/user-attachments/files/25429239/setup_guide.md)
# Setup Guide

## Option A — DuckDB (Recommended)

DuckDB is free, runs locally, needs no account, and can query CSVs directly. Start here.

### Install

```bash
pip install duckdb
```

### Load the Data

```bash
duckdb northpay.db
```

Inside the DuckDB shell:

```sql
CREATE TABLE raw_transactions AS SELECT * FROM read_csv_auto('data/transactions.csv');
CREATE TABLE raw_refunds      AS SELECT * FROM read_csv_auto('data/refunds.csv');
CREATE TABLE raw_merchants    AS SELECT * FROM read_csv_auto('data/merchants.csv');
CREATE TABLE raw_fee_plans    AS SELECT * FROM read_csv_auto('data/fee_plans.csv');

-- Verify
SELECT 'transactions', COUNT(*) FROM raw_transactions
UNION ALL SELECT 'refunds', COUNT(*) FROM raw_refunds
UNION ALL SELECT 'merchants', COUNT(*) FROM raw_merchants
UNION ALL SELECT 'fee_plans', COUNT(*) FROM raw_fee_plans;
```

Expected:
```
transactions  50000
refunds       ~3518
merchants     10
fee_plans     4
```

### Run Your Models

Exit DuckDB (`Ctrl+D`), then run each model file:

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

### Troubleshooting

```sql
-- If CSV parsing fails, inspect types first:
DESCRIBE SELECT * FROM read_csv_auto('data/transactions.csv');

-- Force a column type:
SELECT * FROM read_csv('data/transactions.csv',
    columns={'amount': 'DOUBLE', 'created_at': 'TIMESTAMP'});
```

**Recommended GUI:** [DBeaver](https://dbeaver.io) — free, connects to DuckDB, has a schema browser.

---

## Option B — BigQuery Sandbox

### Setup

1. Create a GCP project at [console.cloud.google.com](https://console.cloud.google.com)
2. Enable the BigQuery API
3. Create datasets:

```bash
bq mk --dataset northpay_raw
bq mk --dataset northpay_staging
bq mk --dataset northpay_marts
```

### Load CSVs

```bash
bq load --source_format=CSV --autodetect northpay_raw.transactions data/transactions.csv
bq load --source_format=CSV --autodetect northpay_raw.refunds      data/refunds.csv
bq load --source_format=CSV --autodetect northpay_raw.merchants    data/merchants.csv
bq load --source_format=CSV --autodetect northpay_raw.fee_plans    data/fee_plans.csv
```

### Optional: Use dbt

```bash
pip install dbt-bigquery
dbt init northpay_project
# Configure profiles.yml with your GCP project
dbt run && dbt test
```

---

## Option C — Snowflake Trial

1. Sign up at [signup.snowflake.com](https://signup.snowflake.com) — 30-day free trial, no credit card
2. Create warehouse and schemas:

```sql
CREATE WAREHOUSE northpay_wh WITH WAREHOUSE_SIZE = 'X-SMALL' AUTO_SUSPEND = 60;
CREATE DATABASE northpay;
CREATE SCHEMA northpay.raw;
CREATE SCHEMA northpay.staging;
CREATE SCHEMA northpay.marts;
```

3. Load CSVs via Snowsight UI: **Data → Add Data → Load files from your computer**

---

## Useful Tools

| Tool | Purpose | Link |
|------|---------|-------|
| DBeaver | Free SQL GUI | [dbeaver.io](https://dbeaver.io) |
| dbdiagram.io | Draw your ERD | [dbdiagram.io](https://dbdiagram.io) |
| SQLFluff | SQL linter | [sqlfluff.com](https://sqlfluff.com) |
| dbt Core | SQL transformation framework | [docs.getdbt.com](https://docs.getdbt.com) |
