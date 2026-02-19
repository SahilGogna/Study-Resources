[project_brief.md](https://github.com/user-attachments/files/25429228/project_brief.md)
# Project Brief — NorthPay Analytics Engineering

## Background

NorthPay is a Canadian FinTech payment processor. Their data engineering team has built raw data pipelines, but the analytics layer is a mess — analysts write ad hoc queries on raw tables, metrics differ across every report, and nothing is documented.

You're the analytics engineer hired to fix this. Your job is to design and build a clean, reliable analytics layer on top of their raw data.

---

## The Dataset

Four CSV files in the `data/` folder:

| File | Rows | Description |
|------|------|-------------|
| `transactions.csv` | 50,000 | Payment transactions — amount, currency, status, method |
| `refunds.csv` | ~3,500 | Full and partial refunds linked to transactions |
| `merchants.csv` | 10 | Merchant profiles with fee plan assignments |
| `fee_plans.csv` | 4 | Fee structures: base rate, fixed fee, FX markup |

### Data Challenges You Must Handle

These are intentional. Part of the assessment is whether you catch and address them:

1. **Multi-currency** — transactions are in CAD, USD, EUR. Normalize to CAD using the `amount_cad` column provided.
2. **Partial refunds** — a transaction may be partially refunded. Net amount must be calculated correctly.
3. **Same-day refunds** — refunds processed the same calendar day as the transaction; flagged in `same_day_refund`.
4. **Failed retries** — some transactions are retry attempts (`is_retry = True`). Completed retries represent real revenue; don't double-exclude them.
5. **Suspended merchant** — merchant M007 has `status = suspended`. Decide how to handle and document it.
6. **Empty card numbers** — digital wallet and bank transfer transactions have no `card_last4`. Handle as nullable, not an error.

---

## What You'll Deliver

### 1. Diagnosis
In your README or a `diagnosis.md` file:
- What are the 3–5 most significant data quality issues you found?
- What assumptions did you make?
- What questions would you ask the business before finalizing your models?

### 2. Data Model Design
- Define the **grain** of every model you build (one sentence each)
- Produce an **ERD** — hand-drawn photo, dbdiagram.io, Lucidchart, or ASCII
- Briefly explain your staging → marts architecture decisions

### 3. SQL Models

**Staging layer** (`models/staging/`):

| Model | Purpose |
|-------|---------|
| `stg_transactions.sql` | Clean, type, rename raw transactions |
| `stg_refunds.sql` | Clean refunds, add type flags |
| `stg_merchants.sql` | Clean merchant dimension |
| `stg_fee_plans.sql` | Fee plan lookup |

**Marts layer** (`models/marts/`):

| Model | Purpose |
|-------|---------|
| `fct_payments.sql` | One row per completed transaction, net of refunds, in CAD |
| `dim_merchants.sql` | Merchant dimension with fee plan enrichment |
| `mart_merchant_performance.sql` | Aggregated merchant metrics |
| `mart_daily_volume.sql` | Daily GMV and net revenue by currency |

### 4. Metrics

You must implement all 6 of these, queryable from your mart tables:

| Metric | Definition |
|--------|------------|
| **Gross Merchandise Volume (GMV)** | Sum of all completed transaction amounts in CAD |
| **Net Revenue** | GMV minus total refunds, in CAD |
| **Refund Rate** | Refund count ÷ completed transaction count |
| **Average Transaction Value (ATV)** | Mean transaction amount in CAD (completed only) |
| **Authorization Rate** | Completed ÷ (Completed + Failed) transactions |
| **Take Rate** | Total fees collected ÷ GMV |

Document each metric's definition and the model it lives in. Use `templates/metrics_template.md`.

### 5. Tests

Write at minimum these 6 tests (SQL assertions, dbt tests, or documented test queries):

- `not_null` on all primary keys
- `unique` on all primary keys
- `accepted_values` on all `status` fields
- Referential integrity: all `transaction_id` in refunds exist in transactions
- Business logic: `refund_amount` ≤ original `transaction_amount`
- Business logic: net revenue is never greater than gross revenue

### 6. Documentation

- Column-level descriptions for all mart models
- README with setup instructions, model DAG, and metric definitions
- At least one example query per mart showing how to use it

---

## Technical Setup

Pick one. DuckDB is strongly recommended — it's free, local, and works immediately.

**Option A — DuckDB (Recommended)**
```bash
pip install duckdb
duckdb northpay.db
-- Then: CREATE TABLE raw_transactions AS SELECT * FROM read_csv_auto('data/transactions.csv');
```
See `docs/setup_guide.md` for complete instructions.

**Option B — BigQuery sandbox**
**Option C — Snowflake 30-day free trial**

---

## Submission

1. Create a **public** GitHub repo named `northpay-analytics` (or similar)
2. Copy `templates/README_template.md` to your repo root as `README.md` and fill it in
3. Ensure your repo runs from a clean clone with your setup instructions
4. Submit your GitHub URL via the course portal

---

## Grading

See `docs/evaluation_rubric.md` for full scoring breakdown.

| Category | Weight |
|----------|--------|
| Data Modeling | 30% |
| SQL Quality | 25% |
| Business Acumen | 20% |
| Testing & Quality | 15% |
| Documentation | 10% |
