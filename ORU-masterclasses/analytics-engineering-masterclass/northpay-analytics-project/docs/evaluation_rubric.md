[evaluation_rubric.md](https://github.com/user-attachments/files/25429256/evaluation_rubric.md)
# Evaluation Rubric

**Total: 100 points**

---

## Data Modeling — 30 pts

### Grain Decisions (10 pts)

| Score | Criteria |
|-------|----------|
| 9–10 | Correct grain defined for every model, explicitly stated. No duplicates from joins. `fct_payments` is at transaction grain. |
| 7–8 | Grain correct for primary models, minor ambiguity in one mart. |
| 5–6 | Grain stated but at least one model has duplicate rows. |
| 0–4 | No grain definition. Models produce incorrect aggregations. |

### Architecture / Layer Design (10 pts)

| Score | Criteria |
|-------|----------|
| 9–10 | Clean staging → marts separation. Staging only cleans/renames/types. Marts hold business logic. No raw table references in marts. |
| 7–8 | Mostly clean. Minor business logic bleed into staging. |
| 5–6 | Layers partially blended. Logic scattered across models. |
| 0–4 | No layering. Everything in one file or raw tables used directly in marts. |

### ERD / Relationships (10 pts)

| Score | Criteria |
|-------|----------|
| 9–10 | ERD present. All tables shown with correct cardinality. PKs and FKs labeled. |
| 7–8 | ERD present. Minor cardinality error or one missing relationship. |
| 5–6 | ERD present but incomplete or significantly wrong. |
| 0–4 | No ERD, or just a list of table names. |

---

## SQL Quality — 25 pts

### Correctness (15 pts)

| Score | Criteria |
|-------|----------|
| 13–15 | All models run without error. Edge cases handled: same-day refunds, multi-currency, partial refunds, retries, nulls. Fees calculated correctly. |
| 10–12 | Models run. 1–2 edge cases missed. |
| 7–9 | Models run but key calculations (net revenue, fees) have bugs. |
| 0–6 | Models fail to run or produce clearly wrong results. |

### Readability & Style (10 pts)

| Score | Criteria |
|-------|----------|
| 9–10 | Consistent naming. CTEs used for complex logic. Comments explain non-obvious decisions. No `SELECT *` in final models. |
| 7–8 | Generally clean with minor inconsistencies. |
| 5–6 | Readable but messy. Some `SELECT *`, inconsistent naming. |
| 0–4 | Hard to follow. No comments. Long unstructured queries. |

---

## Business Acumen — 20 pts

### Diagnosis Quality (10 pts)

| Score | Criteria |
|-------|----------|
| 9–10 | Identifies all major issues. Articulates business impact (not just "nulls exist" but "null card_last4 blocks card-level fraud analysis"). Asks 3+ smart follow-up questions. |
| 7–8 | Identifies most issues. Business impact partially articulated. |
| 5–6 | Issues listed at surface level only. No business framing. |
| 0–4 | Missing or identifies only 1–2 obvious issues. |

### Metric Definitions (10 pts)

| Score | Criteria |
|-------|----------|
| 9–10 | All 6 metrics implemented correctly. Definitions match industry standard. Metrics are queryable from mart tables. |
| 7–8 | 5 of 6 correct. Minor definition error on one. |
| 5–6 | 4 of 6 correct, or significant definition errors. |
| 0–4 | Fewer than 4 metrics. |

---

## Testing & Quality — 15 pts

### Test Coverage (10 pts)

| Score | Criteria |
|-------|----------|
| 9–10 | All 6 required tests present and passing. Additional business logic tests beyond minimum. Tests are runnable. |
| 7–8 | 5 of 6 required tests. All passing. |
| 5–6 | 4 of 6 tests, or tests exist but aren't runnable. |
| 0–4 | Fewer than 4 tests, or tests don't validate what they claim. |

### Test Quality (5 pts)

| Score | Criteria |
|-------|----------|
| 5 | Tests are well-named. Comments explain what each validates. Mix of structural and business logic. |
| 3–4 | Tests functional but minimal commenting. |
| 0–2 | Boilerplate only. No business logic tests. |

---

## Documentation — 10 pts

### README (5 pts)

| Score | Criteria |
|-------|----------|
| 5 | Professional README. Setup instructions work cold. Model DAG described. Metrics defined. Example queries present. |
| 3–4 | README present. Setup instructions incomplete. |
| 1–2 | Minimal README. |
| 0 | No README. |

### Column Documentation (5 pts)

| Score | Criteria |
|-------|----------|
| 5 | All mart columns have meaningful descriptions (not just the column name repeated). |
| 3–4 | Most columns documented. Some missing. |
| 1–2 | A few columns described. |
| 0 | No column documentation. |

---

## Bonus — up to +10 pts

| Item | Points |
|------|--------|
| Full dbt project with `schema.yml` and `dbt test` passing | +4 |
| GitHub Actions CI running tests on push | +2 |
| Visualization (Streamlit, Evidence, or similar) | +2 |
| Advanced analysis (cohort, anomaly detection, segmentation) | +2 |

---

## Score Summary

| Range | Grade |
|-------|-------|
| 90–100 | Portfolio-grade. Ship it. |
| 80–89 | Strong. Minor gaps. |
| 70–79 | Meets requirements. Several areas to improve. |
| 60–69 | Partial. Key deliverables missing or wrong. |
| Below 60 | Needs significant rework. |
