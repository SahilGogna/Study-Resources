[faq.md](https://github.com/user-attachments/files/25429245/faq.md)
# FAQ

---

## General

**Do I need to use dbt?**
No. Plain SQL files with clear naming conventions are fully acceptable. dbt is a bonus.

**Can I use Python/pandas instead of SQL?**
Your models must be SQL — that's the core skill being assessed. Python is fine for exploration or generating your ERD, but not for building the analytics layer.

**What if I find data issues beyond the ones listed in the brief?**
Document them in your diagnosis. Finding undocumented issues is a positive signal.

---

## Data Questions

**What does `is_retry = True` mean? Should I exclude those rows?**
A retry is when a customer attempted the same payment again after a failure. Completed retries represent real revenue — do not exclude them. Use your judgment and document your decision.

**What does `same_day_refund` mean and do I need to handle it differently?**
It flags refunds processed the same calendar day as the original transaction. Make sure your `mart_daily_volume` model correctly nets these out on that day's revenue — don't let same-day refunds reduce the wrong day.

**What currency conversion should I apply?**
Use the pre-computed `amount_cad` column in `transactions.csv` and `refund_amount_cad` in `refunds.csv`. These are already converted. You don't need to re-apply FX rates. Document this assumption in your diagnosis.

**Merchant M007 is suspended — should I include it?**
Include it in your dimension table. Whether it appears in performance metrics is your call — document the decision.

**Some `card_last4` values are empty. Is that an error?**
No. Digital wallet and bank transfer transactions have no card number. Treat it as nullable.

**Can one transaction have multiple refunds?**
In this dataset, each transaction has at most one refund. But design your model to handle multiple (use `SUM`, not a 1:1 join assumption).

---

## Modeling Questions

**What grain should `fct_payments` be?**
One row per completed transaction. Join refund totals in and subtract to get `net_amount_cad`. Keep the grain at the transaction level — don't fan out.

**Should I include failed transactions in `fct_payments`?**
No — `fct_payments` is completed transactions only. Handle authorization rate (which needs failed counts) in your mart or staging layer.

**How do I calculate fees?**
```
base_fee     = (amount_cad × base_rate_pct / 100) + fixed_fee_cad
fx_fee       = amount_cad × fx_markup_pct / 100   -- only when currency ≠ 'CAD'
total_fee    = base_fee + fx_fee
```
The Enterprise `monthly_cap_cad` is an advanced edge case — handle it if you can, otherwise document that you simplified it.

**Do I need a date dimension table?**
Not required. Use your database's date functions to extract year/month/week directly in your mart queries.

---

## Testing Questions

**How do I write tests without dbt?**
Write SQL assertions that return 0 rows when passing:

```sql
-- Test: no refund exceeds original transaction amount
SELECT r.refund_id, r.refund_amount_cad, t.amount_cad
FROM stg_refunds r
JOIN stg_transactions t ON r.transaction_id = t.transaction_id
WHERE r.refund_amount_cad > t.amount_cad;
-- Expected: 0 rows
```

**How many tests is enough?**
The minimum is 6 (listed in the brief). Strong submissions have 10–15, mixing structural and business logic tests.

---

## Submission Questions

**Does my repo need to be public?**
Yes. Reviewers need to access it without credentials. Don't commit API keys or local `.db` files (add `*.db` to `.gitignore`).

**Should I include the CSV files in my repo?**
Yes — include them in `data/` so anyone can clone and run immediately.

**Can I add extra features?**
Absolutely. Bonus ideas: dbt project, GitHub Actions CI, a Streamlit dashboard, cohort analysis. These aren't required but demonstrate extra initiative.
