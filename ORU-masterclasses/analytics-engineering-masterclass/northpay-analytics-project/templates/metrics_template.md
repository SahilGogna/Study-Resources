[metrics_template.md](https://github.com/user-attachments/files/25429274/metrics_template.md)
# Metrics Template

Fill this out as you build your marts. This becomes part of your documentation.

---

## Metric Definitions

### Gross Merchandise Volume (GMV)

- **Definition:** [Your definition]
- **Formula:** [e.g., SUM of amount_cad for all completed transactions]
- **Filters:** [e.g., status = 'completed', excludes retried failures]
- **Model:** [Which mart table this lives in]
- **Example Query:**
```sql
-- Your query here
```

---

### Net Revenue

- **Definition:**
- **Formula:**
- **Filters:**
- **Model:**
- **Example Query:**
```sql

```

---

### Refund Rate

- **Definition:**
- **Formula:**
- **Filters:**
- **Model:**
- **Example Query:**
```sql

```

---

### Average Transaction Value (ATV)

- **Definition:**
- **Formula:**
- **Filters:**
- **Model:**
- **Example Query:**
```sql

```

---

### Authorization Rate

- **Definition:**
- **Formula:**
- **Filters:**
- **Model:**
- **Example Query:**
```sql

```

---

### Take Rate

- **Definition:**
- **Formula:**
- **Filters:**
- **Model:**
- **Example Query:**
```sql

```

---

## Notes & Decisions

[Document any decisions you made about metric definitions — e.g., "We include completed retries in GMV because they represent real revenue." This is what business acumen looks like in practice.]
