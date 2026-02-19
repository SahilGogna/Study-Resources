# SQL Model Structure & Conventions

Use this as your guide for writing consistent, readable SQL across all models.

---

## File Header (Copy This Into Every Model)

```sql
-- =============================================================================
-- Model: [model_name]
-- Layer: [Staging | Marts]
-- Grain: [1 row per ___]
-- Description: [What this model does in 1–2 sentences]
--
-- Dependencies: [list upstream models]
-- =============================================================================
```

---

## Staging Model Template

```sql
-- =============================================================================
-- Model: stg_transactions
-- Layer: Staging
-- Grain: 1 row per raw transaction
-- Description: Cleans and types the raw transactions table. No business logic.
-- =============================================================================

CREATE OR REPLACE VIEW stg_transactions AS

SELECT
    -- Primary key
    transaction_id,

    -- Foreign keys
    merchant_id,

    -- Timestamps
    CAST(created_at AS TIMESTAMP)     AS created_at,
    CAST(created_at AS DATE)          AS transaction_date,

    -- Amounts
    CAST(amount AS DECIMAL(12,2))     AS amount,
    currency,
    CAST(amount_cad AS DECIMAL(12,2)) AS amount_cad,

    -- Status with derived flags
    LOWER(status)                     AS status,
    status = 'completed'              AS is_completed,
    status = 'failed'                 AS is_failed,

    -- Nullable fields handled explicitly
    NULLIF(card_last4, '')            AS card_last4,

    -- Booleans cast explicitly for portability
    CAST(is_retry AS BOOLEAN)         AS is_retry

FROM raw_transactions
WHERE transaction_id IS NOT NULL;
```

---

## Mart / Fact Model Template

```sql
-- =============================================================================
-- Model: fct_payments
-- Layer: Marts
-- Grain: 1 row per completed transaction
-- Description: Central fact table. Net of refunds. All amounts in CAD.
-- =============================================================================

CREATE OR REPLACE TABLE fct_payments AS

WITH completed AS (
    -- Step 1: scope to completed transactions only
    SELECT * FROM stg_transactions
    WHERE is_completed = TRUE
),

refund_totals AS (
    -- Step 2: aggregate refunds to transaction level
    -- Using SUM to handle potential future multi-refund scenarios
    SELECT
        transaction_id,
        SUM(refund_amount_cad)  AS total_refund_cad,
        COUNT(*)                AS refund_count
    FROM stg_refunds
    WHERE is_refund_completed = TRUE
    GROUP BY transaction_id
),

final AS (
    SELECT
        c.transaction_id,
        c.merchant_id,
        c.transaction_date,
        c.amount_cad                                    AS gross_amount_cad,
        COALESCE(r.total_refund_cad, 0)                 AS total_refund_cad,
        c.amount_cad - COALESCE(r.total_refund_cad, 0) AS net_amount_cad,
        r.transaction_id IS NOT NULL                    AS has_refund
    FROM completed c
    LEFT JOIN refund_totals r ON c.transaction_id = r.transaction_id
)

SELECT * FROM final;
```

---

## Naming Conventions

| Type | Convention | Example |
|------|-----------|---------|
| Staging views | `stg_[source]` | `stg_transactions` |
| Fact tables | `fct_[entity]` | `fct_payments` |
| Dimension tables | `dim_[entity]` | `dim_merchants` |
| Aggregated marts | `mart_[topic]` | `mart_merchant_performance` |
| Boolean columns | `is_` or `has_` prefix | `is_completed`, `has_refund` |
| Date columns | `_date` suffix | `transaction_date`, `refund_date` |
| Timestamp columns | `_at` suffix | `created_at` |
| Amount columns | `_cad` suffix for normalized amounts | `amount_cad`, `net_amount_cad` |

---

## Anti-Patterns to Avoid

```sql
-- ❌ No SELECT * in final models
SELECT * FROM stg_transactions   -- bad in a mart

-- ✅ Name every column explicitly
SELECT transaction_id, merchant_id, amount_cad FROM stg_transactions

-- ❌ No business logic in staging
WHERE status = 'completed'   -- this belongs in a mart, not staging

-- ✅ Staging just cleans and types
LOWER(status) AS status, status = 'completed' AS is_completed

-- ❌ Avoid hardcoded magic numbers without comments
WHERE amount_cad > 9999.99

-- ✅ Comment what it means
WHERE amount_cad > 9999.99  -- cap applied per transaction limit policy

-- ❌ Don't assume 1:1 joins where there could be many
LEFT JOIN refunds ON t.transaction_id = r.transaction_id   -- could fan out!

-- ✅ Aggregate first, then join
LEFT JOIN (SELECT transaction_id, SUM(...) FROM refunds GROUP BY 1) r
    ON t.transaction_id = r.transaction_id
```

---

## Test File Template

```sql
-- =============================================================================
-- Test: [test name]
-- Expectation: Returns 0 rows if passing
-- =============================================================================

-- Test: refund_amount never exceeds original transaction amount
SELECT
    r.refund_id,
    r.transaction_id,
    t.amount_cad    AS original_amount,
    r.refund_amount_cad
FROM stg_refunds r
JOIN stg_transactions t ON r.transaction_id = t.transaction_id
WHERE r.refund_amount_cad > t.amount_cad + 0.01;
-- 0 rows = PASS
```
