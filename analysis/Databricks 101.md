# Databricks 101 — Beginner Primer

## What is Databricks in one sentence

Databricks is a unified analytics platform built on top of Apache Spark that lets data engineers, data scientists, and analysts collaborate on the same data at any scale, from gigabytes to petabytes.

## The bigger problem it solves

Before Databricks, most large companies had three separate systems:

1. **Data warehouse** — for structured, business-ready data (Redshift, Snowflake, Teradata)
2. **Data lake** — for raw, unstructured data (Amazon S3, Azure Data Lake)
3. **Machine learning platform** — for model training (SageMaker, custom infra)

Moving data between them, keeping it consistent, and giving different teams access created constant friction. Databricks packages all three into a single "lakehouse" architecture, so raw data, analytics-ready tables, and ML models live in one place.

---

## Core concepts

### Apache Spark

Open source distributed computing engine. Databricks was founded by the creators of Spark. When you write PySpark or Spark SQL in a Databricks notebook, Spark distributes the work across a cluster of machines.

### Notebooks

Databricks work happens in notebooks. They look like Jupyter, but you can mix Python, SQL, Scala, and R in the same file. Cells run on a Spark cluster that you attach to the notebook.

### Clusters

A set of virtual machines that execute your code. You spin one up, run your workload, and shut it down. Costs are per-second on the cloud provider (AWS, Azure, GCP).

### Delta Lake

The storage layer that makes Databricks reliable. Delta Lake adds three things to a plain data lake:

- **ACID transactions** — no more partial writes or corrupted tables
- **Time travel** — query previous versions of a table (`VERSION AS OF 3`)
- **Schema enforcement** — stops bad data from silently corrupting a table

Without Delta Lake, a data lake is a dumping ground. With it, the lake behaves like a warehouse.

### Unity Catalog

Databricks’ governance layer. Central place to manage table access, permissions, and lineage across all workspaces. Every serious enterprise deployment uses it.

### MLflow

Open source ML lifecycle tool built into Databricks. Track experiments, log parameters and metrics, register models, and deploy them. If you are on the DS or MLE path, MLflow is core.

### Databricks SQL

A warehouse-style SQL editor and dashboard tool inside Databricks. Analysts can write SQL queries against Delta tables without touching a notebook. Good for BI use cases.

### Workflows

Databricks’ native orchestrator. Chain notebooks or jobs together, schedule them, and monitor runs. Similar to Airflow but built-in.

---

## Lakehouse architecture, layered

The common pattern is the medallion architecture:

**Bronze layer** — raw data as-is from source systems. No transformations, just an audit trail.

**Silver layer** — cleaned and conformed data. Deduped, typed, standardized. Ready for analysis.

**Gold layer** — aggregated business-ready tables. Star schema, dimensional models. What dashboards and downstream consumers read.

A Data Engineer’s job in a Databricks environment is largely building pipelines that move data through Bronze → Silver → Gold.

---

## When you need Databricks

- Your data volume is in tens of TBs or bigger
- You have both analytics and ML workloads on the same data
- Multiple teams (DE, DA, DS) need to work on the same data
- You need Spark for processing (Python or SQL alone is too slow)
- Your company is in regulated finance, healthcare, or insurance and needs governance

## When you DON’T need Databricks

- Your data fits in a single Postgres instance (under 1 TB)
- You only need dashboards, not ML
- You are a solo analyst or a small analytics team
- Your team already has a working Snowflake plus dbt stack

A data analyst role rarely uses Databricks directly. Data engineer roles often do.

---

## Who uses Databricks in Canada

- **Banks:** RBC, TD, Scotiabank, BMO, CIBC, National Bank
- **Insurance:** Manulife, Sun Life
- **Retail:** Loblaws, Canadian Tire
- **Tech:** Shopify (partial), Lightspeed, D2L
- **Consulting:** Deloitte, EY, PwC, KPMG (client work)
- **Telco:** Bell, Rogers, Telus

Almost every Canadian enterprise larger than 5000 employees has a Databricks footprint by 2026.

---

## Free 30-day learning path

All of this is free. You just need a Databricks Community Edition account (free forever, single small cluster).

### Week 1 — Fundamentals

- Sign up for Databricks Community Edition
- Walk through Databricks Academy free course: "Get Started with Databricks"
- Build your first notebook: read a CSV, do a simple transformation with PySpark, write to Delta Lake

### Week 2 — SQL and Delta Lake

- Complete Databricks Academy: "Databricks SQL for Data Analysts"
- Practice: create a small fact table, do INSERT, UPDATE, DELETE using Delta
- Time travel: query a previous version of your table

### Week 3 — Data engineering patterns

- Build the medallion architecture on a sample dataset
- Use Auto Loader to ingest streaming data
- Add data quality checks with Delta constraints

### Week 4 — MLflow and Workflows

- Log a basic ML experiment with MLflow
- Register a model, deploy it to a batch job
- Create a Databricks Workflow chaining 2-3 notebooks

### Portfolio project

- Take a Canadian public dataset (StatCan census, City of Toronto Open Data, or Bank of Canada data)
- Build the full Bronze → Silver → Gold pipeline
- Add a Databricks SQL dashboard on the Gold layer
- Document the whole thing in a GitHub README

---

## Cheatsheet: Databricks vs alternatives

| Use case | Databricks | Snowflake + dbt | AWS EMR + Glue |
| --- | --- | --- | --- |
| **Big data ETL** | Excellent | Good | Fair |
| **BI dashboards** | Good (Databricks SQL) | Excellent | Poor |
| **Machine learning** | Excellent (MLflow) | Fair | Fair |
| **Governance** | Excellent (Unity Catalog) | Good | Fair |
| **Cost transparency** | Fair | Excellent | Fair |
| **Learning curve** | Medium | Easy | Hard |

---

## Interview tips

- **Data Engineer interviews** at Canadian banks will absolutely ask Databricks + Delta Lake + PySpark. You should be able to write a PySpark UDF, explain when to use it vs Spark SQL, and describe Delta Lake’s ACID guarantees.
- **Data Analyst interviews** rarely go deep on Databricks. If you say you have used Databricks SQL for dashboarding, that is enough for most Canadian DA roles.
- **ML Engineer interviews** will test MLflow experiment tracking and model registry.

If you want mentorship from Data Engineers already using Databricks at Canadian companies, check out ORU at [joinoru.com](http://joinoru.com).