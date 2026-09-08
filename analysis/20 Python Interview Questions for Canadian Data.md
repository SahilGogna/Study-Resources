# 20 Python Interview Questions for Canadian Data Roles

Python questions in data interviews come from five predictable categories. Here are all twenty, with model answers and a note on what the interviewer is actually testing.

---

## Category 1: Pandas data manipulation

This is where most questions land, and where most candidates under-prepare.

**1. Group a dataframe by two columns and apply different aggregations per column.**

```python
df.groupby(['region', 'product']).agg(
    total_sales=('sales', 'sum'),
    avg_price=('price', 'mean'),
    order_count=('order_id', 'nunique')
).reset_index()
```

*Testing:* whether you know named aggregation. Candidates who write `.agg({'sales':'sum'})` and then rename columns afterwards are showing older habits.

**2. Explain merge versus join versus concat.**

`merge` combines on column values and is the one you will use. `join` combines on index and is a convenience wrapper. `concat` stacks dataframes, vertically by default, with no key matching. Follow-up you should expect: what does `how='left'` do to row count when the right side has duplicate keys. Answer: rows multiply.

**3. Two dataframes, left join them, then handle the duplicates that appear.**

```python
merged = left.merge(right, on='customer_id', how='left')
print(merged.duplicated(subset=['customer_id']).sum())
merged = merged.drop_duplicates(subset=['customer_id'], keep='first')
```

*Testing:* whether you check for duplicates rather than assuming the join was clean. Say out loud that you would first investigate why the right side has duplicate keys.

**4. Reshape a wide dataframe to long and back.**

```python
long = df.melt(id_vars=['date'], var_name='metric', value_name='value')
wide = long.pivot(index='date', columns='metric', values='value').reset_index()
```

**5. Get the top 3 rows per group by sales.**

```python
df.sort_values('sales', ascending=False).groupby('region').head(3)
```

*Testing:* whether you reach for a loop. If you do, that is the wrong answer.

---

## Category 2: Data cleaning logic

The usual format is a messy CSV and the instruction "make this analysis ready."

**6. How do you find and handle missing values?**

Start with `df.isnull().sum()` and `df.isnull().mean()` for the percentage. Then say the real answer: it depends on why they are missing. Drop the column if most of it is empty. Drop rows if the count is small and the data is missing at random. Impute with median for skewed numerics, mode for categoricals, forward fill for time series. Never impute without saying so in your write-up.

**7. Detect outliers.**

```python
Q1, Q3 = df['amount'].quantile([0.25, 0.75])
IQR = Q3 - Q1
outliers = df[(df['amount'] < Q1 - 1.5*IQR) | (df['amount'] > Q3 + 1.5*IQR)]
```

*Testing:* whether you then say "an outlier is not automatically an error." A $2M transaction at a bank might be the most important row in the table.

**8. Parse messy dates.**

```python
df['date'] = pd.to_datetime(df['date'], errors='coerce')
print(df['date'].isnull().sum())
```

`errors='coerce'` turns failures into NaT instead of crashing. Then you count them and decide.

**9. Clean inconsistent string categories.**

```python
df['city'] = df['city'].str.strip().str.title()
df['city'] = df['city'].replace({'Toronto On': 'Toronto', 'Tornto': 'Toronto'})
```

Mention `df['city'].value_counts()` first. You cannot clean what you have not looked at.

---

## Category 3: Core Python fundamentals

Skipped by analysts, asked in screening rounds.

**10. List comprehension versus a for loop.**

```python
squares = [x**2 for x in range(10) if x % 2 == 0]
```

Faster and more readable for simple transforms. Use a loop when the body has multiple statements or side effects.

**11. Mutable versus immutable, and why it matters.**

Lists, dicts, and sets are mutable. Strings, tuples, and ints are not. It matters because a mutable default argument is a classic bug:

```python
def add(item, items=[]):   # wrong, the list persists between calls
def add(item, items=None):  # right
    if items is None:
        items = []
```

**12. Dictionary operations you should know cold.**

`.get(key, default)` to avoid KeyError, `.items()` to iterate pairs, dict comprehensions, and `collections.Counter` for frequency counts.

**13. What does a lambda do and when should you avoid it?**

An anonymous single expression function, usually inside `apply`, `map`, `sorted`, or `filter`. Avoid it when the logic needs a name, needs a docstring, or is reused. Bonus answer: `df.apply(lambda ...)` row-wise is slow, prefer vectorised operations.

---

## Category 4: Python with SQL

This is where interviewers find out whether you think about production.

**14. Read a SQL query into a dataframe.**

```python
from sqlalchemy import create_engine
engine = create_engine('postgresql://user:pass@host:5432/db')
df = pd.read_sql('SELECT * FROM orders WHERE order_date >= %(d)s',
                 engine, params={'d': '2026-01-01'})
```

*Testing:* parameterised queries. Never string-concatenate user input into SQL.

**15. Which work belongs in SQL and which in Python?**

Filtering, joining, and aggregating belong in SQL, at the database, where the data already is. Pull the smallest result set you can. Do statistical work, modelling, and visualisation in Python. Pulling a 50 million row table into Pandas to then filter it is the answer that fails you.

**16. How do you handle a table too large for memory?**

Aggregate in SQL first. If you genuinely need all rows, use `chunksize` in `read_sql` and process iteratively, or move to Polars or Dask. Say the first option first.

---

## Category 5: Statistics with Python

**17. Describe a distribution and decide whether to use mean or median.**

```python
df['salary'].describe()
df['salary'].skew()
```

If skew is meaningful, report the median. Salary and housing data in Canada are right skewed, so the mean overstates the typical value. Being able to say that sentence matters more than the code.

**18. Correlation, and the trap.**

```python
df[['ads_spend', 'revenue']].corr()
```

The trap is causation. Expect the follow-up. Answer with a confounder: ad spend and revenue both rise in Q4 because of seasonality.

**19. Run a two sample t-test and interpret it.**

```python
from scipy import stats
t, p = stats.ttest_ind(group_a, group_b, equal_var=False)
```

If p is below 0.05 you reject the null. Then say the part that gets you hired: statistical significance is not business significance. A 0.1% lift can be significant and still not worth shipping.

**20. Design an A/B test for a feature the product team believes is working.**

State the hypothesis and the single primary metric. Randomise at the user level, not the session level. Calculate the sample size before starting. Run for full weeks to absorb day of week effects. Do not peek and stop early. At the end, report the effect size and the confidence interval, not just the p-value.

This question comes up constantly in Canadian product and analytics interviews and it is the one most people answer badly.

---

## How to prepare

Most candidates over-prepare Category 3 and under-prepare Category 1. Reverse that. Spend most of your time in Pandas, then cleaning, then statistics.

Work through these with a real dataset from [open.canada.ca](http://open.canada.ca) rather than reading the answers. Being able to explain your choice out loud is what the interview is measuring.

---

If you want to practice these with data engineers and analysts already working at Canadian companies, check out ORU at [joinoru.com](http://joinoru.com).