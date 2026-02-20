# NorthPay Analytics Engineering Project

> A portfolio-grade take-home project for aspiring analytics engineers.

---

## What You'll Build

A complete analytics layer for **NorthPay** — a fictional Canadian FinTech payment processor. You'll work with 50K+ realistic transactions, design a data model, write SQL models, define metrics, and document everything to interview-ready standard.

---

## What's in This Repo

```
northpay-analytics-project/
├── data/
│   ├── transactions.csv       # 50,000 payment transactions
│   ├── refunds.csv            # ~3,500 full and partial refunds
│   ├── merchants.csv          # 10 merchants with fee plan assignments
│   └── fee_plans.csv          # 4 fee structures
├── docs/
│   ├── project_brief.md       # Full requirements and deliverables
│   ├── setup_guide.md         # DuckDB / BigQuery / Snowflake setup
│   ├── faq.md                 # Common questions answered
│   └── evaluation_rubric.md   # How you'll be graded
└── templates/
    ├── README_template.md     # Copy this to your repo root
    ├── metrics_template.md    # Define your metrics here
    └── sql_structure.md       # SQL model scaffold and conventions
```

---

## Getting Started

**Step 1** — Read [`docs/project_brief.md`](docs/project_brief.md) end to end before writing any SQL.

**Step 2** — Follow [`docs/setup_guide.md`](docs/setup_guide.md) to get your environment running (DuckDB recommended — free and local, no account needed).

**Step 3** — Create your own GitHub repo and copy [`templates/README_template.md`](templates/README_template.md) as your starting README.

**Step 4** — Build your models, tests, and documentation per the project brief.

**Step 5** — Submit your GitHub repo URL via the course portal before the deadline.

---

## Deliverables Summary

| # | Deliverable | Description |
|---|-------------|-------------|
| 1 | **Diagnosis** | Written analysis of data quality issues |
| 2 | **Data Model Design** | Grain decisions + ERD |
| 3 | **SQL Models** | Staging → Marts pipeline |
| 4 | **Metrics** | 6 defined business metrics, queryable |
| 5 | **Tests** | Minimum 6 SQL tests |
| 6 | **Documentation** | Column docs + README |

Full details in [`docs/project_brief.md`](docs/project_brief.md).

---

## Time Commitment

**6–10 hours.** This is designed to be done in a weekend.

---

## Questions?

Check [`docs/faq.md`](docs/faq.md) first — most common questions are answered there. Post anything else in the course discussion forum.
