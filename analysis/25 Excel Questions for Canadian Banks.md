# 25 Excel Questions for Canadian Banks — Resource Doc

# Excel for Canadian Bank Interviews: A Complete Practice Guide

> Companion resource for the Aug 19 reel. This guide takes you from "I can do basic Excel" to "I can pass a live Excel test at RBC, TD, BMO, or Scotia". 40 questions across 6 categories, all built against a realistic 4-table banking dataset. Work through it end to end.
> 

## How to use this guide

1. Build the practice workbook first (next section). Do not skip this.
2. Format each table as an Excel Table (Ctrl+T) so you can use structured references like `Customers[Balance]`.
3. Work through the questions category by category. Do not jump around.
4. For every question, write your formula from scratch before looking at the answer.
5. Time yourself. Live bank Excel tests average 30 to 45 minutes for 8 to 15 tasks, so speed matters as much as correctness.
6. After each answer, run the formula in your file and verify the expected result matches.

If you can complete every question with the target keyboard shortcuts, you are ready.

---

## Setup: The practice workbook

Create a new Excel file with 4 sheets named exactly: `Customers`, `Loans`, `Transactions`, `Employees`. Paste each table below with headers in row 1. After pasting, select each table and press **Ctrl+T** to convert it into an Excel Table with the same name.

### Sheet 1: Customers (30 rows)

| CustomerID | FirstName | LastName | Province | Age | AccountOpenDate | AccountType | Balance | CreditScore |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| C001 | Priya | Sharma | ON | 34 | 2020-03-15 | Chequing | 5420 | 745 |
| C002 | Jason | Chen | BC | 42 | 2019-06-22 | Savings | 28500 | 780 |
| C003 | Aarav | Patel | ON | 28 | 2021-07-10 | Chequing | 3200 | 690 |
| C004 | Emma | Wilson | QC | 51 | 2018-01-05 | Savings | 65000 | 810 |
| C005 | Rahul | Mehta | AB | 45 | 2019-02-18 | Business | 125000 | 795 |
| C006 | Sarah | Kim | ON | 31 | 2020-04-12 | Chequing | 8900 | 720 |
| C007 | David | Lee | ON | 39 | 2019-06-30 | Chequing | 12400 | 755 |
| C008 | Ananya | Iyer | AB | 26 | 2021-08-14 | Chequing | 1800 | 645 |
| C009 | Michael | Brown | NS | 58 | 2017-11-20 | Savings | 42300 | 800 |
| C010 | Neha | Kapoor | MB | 33 | 2020-01-08 | Chequing | 6750 | 710 |
| C011 | James | Thompson | ON | 47 | 2018-05-15 | Savings | 89200 | 825 |
| C012 | Fatima | Khan | ON | 36 | 2019-11-03 | Chequing | 15600 | 735 |
| C013 | Wei | Zhang | BC | 29 | 2021-02-28 | Chequing | 4200 | 680 |
| C014 | Isabella | Rossi | QC | 44 | 2018-09-12 | Savings | 51800 | 790 |
| C015 | Arjun | Reddy | ON | 38 | 2019-07-22 | Business | 78500 | 770 |
| C016 | Chloe | Martin | QC | 25 | 2022-03-08 | Chequing | 2400 | 620 |
| C017 | Rohan | Gupta | ON | 41 | 2018-12-14 | Savings | 33900 | 765 |
| C018 | Sofia | Garcia | BC | 32 | 2020-08-20 | Chequing | 9800 | 715 |
| C019 | Karan | Malhotra | AB | 49 | 2017-06-05 | Business | 156000 | 815 |
| C020 | Olivia | Anderson | ON | 27 | 2021-11-18 | Chequing | 3600 | 660 |
| C021 | Divya | Nair | ON | 35 | 2019-04-25 | Chequing | 11200 | 730 |
| C022 | Hiroshi | Tanaka | BC | 53 | 2018-02-16 | Savings | 73500 | 805 |
| C023 | Simran | Kaur | ON | 30 | 2020-10-11 | Chequing | 7300 | 705 |
| C024 | Nathan | Wright | AB | 46 | 2019-01-19 | Savings | 45700 | 775 |
| C025 | Alicia | Nguyen | ON | 24 | 2022-06-30 | Chequing | 1500 | 590 |
| C026 | Vikram | Rao | ON | 43 | 2018-08-08 | Business | 92000 | 785 |
| C027 | Meera | Joshi | MB | 37 | 2019-12-01 | Chequing | 14200 | 750 |
| C028 | Ethan | Miller | ON | 22 | 2023-02-14 | Chequing | 850 | 620 |
| C029 | Aisha | Ahmed | QC | 40 | 2019-05-27 | Savings | 38200 | 760 |
| C030 | Ryan | O'Connor | NS | 68 | 2015-09-10 | Savings | 128000 | 830 |

### Sheet 2: Loans (40 rows)

| LoanID | CustomerID | LoanType | Amount | InterestRate | TermMonths | StartDate | MonthlyPayment | Status |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| L001 | C001 | Auto | 25000 | 6.5 | 60 | 2023-03-15 | 489 | Active |
| L002 | C002 | Mortgage | 485000 | 5.25 | 300 | 2020-06-22 | 2895 | Active |
| L003 | C004 | Mortgage | 725000 | 4.75 | 300 | 2019-01-05 | 4128 | Active |
| L004 | C005 | Business | 200000 | 7.2 | 84 | 2021-02-18 | 3054 | Active |
| L005 | C007 | Personal | 15000 | 8.5 | 36 | 2023-07-10 | 474 | Active |
| L006 | C009 | Mortgage | 320000 | 3.85 | 300 | 2018-11-20 | 1651 | Active |
| L007 | C011 | Mortgage | 550000 | 4.95 | 300 | 2019-05-15 | 3192 | Active |
| L008 | C012 | Auto | 32000 | 6.8 | 72 | 2023-01-08 | 537 | Active |
| L009 | C014 | Mortgage | 410000 | 4.15 | 300 | 2019-09-12 | 2200 | Active |
| L010 | C015 | Business | 350000 | 7.5 | 84 | 2020-07-22 | 5411 | Active |
| L011 | C017 | Personal | 25000 | 9.0 | 48 | 2022-12-14 | 622 | Active |
| L012 | C019 | Business | 500000 | 6.9 | 120 | 2020-06-05 | 5786 | Active |
| L013 | C019 | Mortgage | 850000 | 4.5 | 300 | 2018-06-05 | 4720 | Active |
| L014 | C022 | Mortgage | 620000 | 4.35 | 300 | 2018-04-16 | 3406 | Active |
| L015 | C024 | Auto | 42000 | 6.2 | 72 | 2023-05-19 | 700 | Active |
| L016 | C024 | Mortgage | 380000 | 4.05 | 300 | 2019-01-19 | 2013 | Active |
| L017 | C026 | Business | 275000 | 7.8 | 84 | 2020-11-08 | 4278 | Active |
| L018 | C027 | Personal | 12000 | 8.9 | 36 | 2024-01-01 | 380 | Active |
| L019 | C029 | Mortgage | 295000 | 4.25 | 300 | 2019-08-27 | 1600 | Active |
| L020 | C030 | Mortgage | 275000 | 3.75 | 240 | 2015-09-10 | 1631 | Closed |
| L021 | C003 | Personal | 10000 | 10.5 | 24 | 2022-01-15 | 464 | Closed |
| L022 | C008 | Auto | 18000 | 7.5 | 60 | 2022-09-14 | 361 | Default |
| L023 | C016 | Personal | 8000 | 11.5 | 24 | 2023-04-08 | 375 | Default |
| L024 | C020 | Personal | 5000 | 12.0 | 24 | 2022-05-18 | 236 | Closed |
| L025 | C025 | Personal | 3000 | 13.5 | 12 | 2023-08-30 | 267 | Default |
| L026 | C028 | Personal | 2000 | 14.0 | 12 | 2024-02-14 | 179 | Active |
| L027 | C006 | Auto | 22000 | 6.9 | 60 | 2023-11-12 | 435 | Active |
| L028 | C010 | Auto | 28000 | 7.1 | 60 | 2023-02-08 | 555 | Active |
| L029 | C013 | Personal | 8500 | 10.2 | 24 | 2023-06-28 | 395 | Active |
| L030 | C018 | Auto | 19500 | 7.3 | 48 | 2023-10-20 | 469 | Active |
| L031 | C021 | Personal | 7000 | 9.5 | 24 | 2024-01-25 | 321 | Active |
| L032 | C023 | Auto | 24000 | 6.6 | 60 | 2024-03-11 | 471 | Active |
| L033 | C011 | Personal | 20000 | 8.2 | 36 | 2024-05-15 | 629 | Active |
| L034 | C001 | Personal | 5500 | 10.0 | 24 | 2023-01-15 | 254 | Closed |
| L035 | C007 | Auto | 30000 | 6.4 | 60 | 2021-06-30 | 584 | Active |
| L036 | C012 | Personal | 15000 | 9.2 | 36 | 2023-03-03 | 479 | Active |
| L037 | C015 | Auto | 55000 | 5.8 | 60 | 2022-07-22 | 1057 | Active |
| L038 | C002 | Personal | 25000 | 8.0 | 36 | 2024-06-22 | 784 | Active |
| L039 | C004 | Business | 100000 | 6.5 | 60 | 2024-01-05 | 1955 | Active |
| L040 | C017 | Auto | 35000 | 6.7 | 60 | 2023-08-14 | 686 | Active |

### Sheet 3: Transactions (40 rows)

| TransactionID | CustomerID | Date | Type | Amount | Channel |
| --- | --- | --- | --- | --- | --- |
| T001 | C001 | 2026-01-05 | Deposit | 2500 | Online |
| T002 | C001 | 2026-01-12 | Withdrawal | 400 | ATM |
| T003 | C002 | 2026-01-08 | Deposit | 4200 | Branch |
| T004 | C003 | 2026-01-10 | Withdrawal | 150 | Mobile |
| T005 | C004 | 2026-01-15 | Deposit | 8500 | Online |
| T006 | C005 | 2026-01-18 | Transfer | 15000 | Online |
| T007 | C006 | 2026-01-20 | Withdrawal | 300 | ATM |
| T008 | C007 | 2026-01-22 | Deposit | 3200 | Branch |
| T009 | C001 | 2026-02-05 | Deposit | 2500 | Online |
| T010 | C009 | 2026-02-08 | Withdrawal | 1200 | Branch |
| T011 | C010 | 2026-02-11 | Deposit | 1800 | Mobile |
| T012 | C011 | 2026-02-14 | Transfer | 25000 | Online |
| T013 | C012 | 2026-02-16 | Fee | -15 | Online |
| T014 | C013 | 2026-02-19 | Deposit | 950 | Mobile |
| T015 | C014 | 2026-02-22 | Withdrawal | 800 | ATM |
| T016 | C015 | 2026-02-25 | Deposit | 12000 | Branch |
| T017 | C002 | 2026-03-02 | Deposit | 4200 | Branch |
| T018 | C017 | 2026-03-05 | Transfer | 3500 | Online |
| T019 | C018 | 2026-03-08 | Withdrawal | 200 | Mobile |
| T020 | C019 | 2026-03-11 | Deposit | 22000 | Branch |
| T021 | C020 | 2026-03-14 | Fee | -30 | Mobile |
| T022 | C021 | 2026-03-17 | Deposit | 1650 | Online |
| T023 | C022 | 2026-03-20 | Withdrawal | 950 | Branch |
| T024 | C023 | 2026-03-23 | Deposit | 2100 | Mobile |
| T025 | C001 | 2026-03-05 | Deposit | 2500 | Online |
| T026 | C025 | 2026-04-03 | Withdrawal | 80 | ATM |
| T027 | C026 | 2026-04-06 | Deposit | 11500 | Branch |
| T028 | C027 | 2026-04-09 | Transfer | 4200 | Online |
| T029 | C028 | 2026-04-12 | Fee | -5 | Online |
| T030 | C029 | 2026-04-15 | Deposit | 3400 | Mobile |
| T031 | C030 | 2026-04-18 | Deposit | 5800 | Branch |
| T032 | C005 | 2026-04-21 | Transfer | 8000 | Online |
| T033 | C011 | 2026-04-24 | Deposit | 6200 | Online |
| T034 | C014 | 2026-04-27 | Withdrawal | 1200 | ATM |
| T035 | C019 | 2026-05-02 | Deposit | 18500 | Branch |
| T036 | C022 | 2026-05-05 | Withdrawal | 500 | Mobile |
| T037 | C001 | 2026-05-08 | Deposit | 2500 | Online |
| T038 | C009 | 2026-05-12 | Deposit | 2800 | Online |
| T039 | C015 | 2026-05-15 | Transfer | 9500 | Online |
| T040 | C024 | 2026-05-18 | Deposit | 4100 | Branch |

### Sheet 4: Employees (15 rows)

| EmployeeID | Name | Department | Branch | Position | Salary | HireDate | ManagerID |
| --- | --- | --- | --- | --- | --- | --- | --- |
| E001 | Nisha Patel | Personal Banking | Toronto Downtown | Branch Manager | 118000 | 2015-03-10 |  |
| E002 | Rahul Kumar | Business Banking | Toronto Downtown | Regional Director | 165000 | 2013-06-01 |  |
| E003 | Emily Zhao | Wealth Management | Vancouver | VP Wealth | 195000 | 2012-09-15 |  |
| E004 | Mark Johnson | Operations | Mississauga | Ops Director | 145000 | 2014-01-20 |  |
| E005 | Amit Singh | Personal Banking | Toronto Downtown | Senior Advisor | 82000 | 2018-04-12 | E001 |
| E006 | Chloe Martin | Personal Banking | Montreal | Advisor | 68000 | 2020-06-18 | E001 |
| E007 | David Chen | Business Banking | Toronto Downtown | Business Advisor | 95000 | 2018-11-05 | E002 |
| E008 | Sofia Ramos | Business Banking | Calgary | Business Advisor | 92000 | 2019-02-25 | E002 |
| E009 | Karan Verma | Wealth Management | Vancouver | Portfolio Manager | 132000 | 2017-08-22 | E003 |
| E010 | Priya Kapoor | Wealth Management | Toronto Downtown | Portfolio Manager | 128000 | 2018-03-15 | E003 |
| E011 | James Wilson | Operations | Mississauga | Ops Manager | 88000 | 2019-01-08 | E004 |
| E012 | Meera Iyer | Operations | Toronto Downtown | Ops Analyst | 72000 | 2021-05-20 | E004 |
| E013 | Sarah Kim | Personal Banking | Toronto Downtown | Advisor | 65000 | 2022-01-10 | E005 |
| E014 | Arjun Sharma | Business Banking | Toronto Downtown | Junior Advisor | 62000 | 2022-09-18 | E007 |
| E015 | Isabella Lopez | Personal Banking | Montreal | Junior Advisor | 58000 | 2023-03-25 | E006 |

---

## Keyboard shortcuts they watch for in live tests

Bank Excel testers grade partly on speed and mouse-vs-keyboard ratio. Learn these before your interview.

**Navigation**

- Ctrl+Arrow: jump to the edge of a data region
- Ctrl+Shift+Arrow: select from current cell to the edge
- Ctrl+Home: go to A1
- Ctrl+End: go to the last used cell
- F5 then type a cell reference: go to any cell
- Ctrl+PageDown / Ctrl+PageUp: cycle through sheets

**Selection**

- Ctrl+A once (inside a table): select the table's data. Twice: select the entire table including headers
- Ctrl+Space: select entire column
- Shift+Space: select entire row
- Ctrl+Shift+End: select from current cell to last used cell

**Formulas**

- Alt+=: AutoSum
- F2: edit the current cell
- F4: cycle through absolute references (A1 to $A$1 to A$1 to $A1)
- Ctrl+Shift+Enter: enter as an array formula (legacy)
- F9: recalculate all formulas
- Ctrl+`: toggle between showing formulas and values

**Tables and formatting**

- Ctrl+T: convert range to a Table
- Alt+H+O+I: auto-fit column width
- Ctrl+Shift+L: toggle filter
- Ctrl+1: format cells dialog
- Ctrl+Shift+~: general format
- Ctrl+Shift+$: currency format
- Ctrl+Shift+%: percent format

**Pivot Tables**

- Alt+N+V: insert PivotTable
- Alt+JT+M: refresh a pivot

Practice until these are muscle memory. In an interview you should never touch the mouse for navigation.

---

## Category 1: Lookups (7 questions)

### Q1. Look up the balance for CustomerID C015.

**XLOOKUP (preferred, Excel 2019+):**

```
=XLOOKUP("C015", Customers[CustomerID], Customers[Balance])
```

**Expected result:** 78500

**VLOOKUP (legacy):**

```
=VLOOKUP("C015", Customers, 8, FALSE)
```

Balance is the 8th column of the Customers table.

**Why XLOOKUP wins:** no column index (formula survives inserted columns), left-side lookups work natively, and there is a built-in if_not_found argument.

**Common mistake:** forgetting the 4th argument in VLOOKUP. Without FALSE, Excel defaults to approximate match, which requires the lookup column to be sorted. Miss this and you silently return the wrong row.

### Q2. XLOOKUP with a fallback for a missing customer.

```
=XLOOKUP("C099", Customers[CustomerID], Customers[Balance], "Customer not found")
```

**Expected result:** "Customer not found"

**Concept:** The 4th argument in XLOOKUP is the value to return when nothing matches. This is the single most useful feature for production spreadsheets, where a missing lookup should not error out silently.

### Q3. Left-side lookup: given a customer's LastName Kapoor, return the CustomerID.

**XLOOKUP (works both directions):**

```
=XLOOKUP("Kapoor", Customers[LastName], Customers[CustomerID])
```

**Expected result:** C010

**INDEX + MATCH (legacy pattern for left-side lookups):**

```
=INDEX(Customers[CustomerID], MATCH("Kapoor", Customers[LastName], 0))
```

**Why this matters:** VLOOKUP cannot look left. Before XLOOKUP existed, every Excel analyst had to know INDEX + MATCH by heart. Interviewers still test this because many bank teams run older Excel versions.

### Q4. Approximate match for tiered interest rate.

Add this small tier table anywhere (say M2:N5):

| Min Balance | Rate |
| --- | --- |
| 0 | 0.5% |
| 5000 | 1.0% |
| 25000 | 1.75% |
| 50000 | 2.5% |

Then for each customer:

```
=VLOOKUP([@Balance], $M$2:$N$5, 2, TRUE)
```

**Expected result for C015 (Balance 78500):** 2.5%

**Concept:** TRUE (or omitting the 4th arg) means approximate match. The tier table must be sorted ascending. VLOOKUP finds the largest value that is less than or equal to the lookup value.

**Common mistake:** using approximate match on an unsorted table. Excel will not error but will return wrong values.

**XLOOKUP alternative** with match_mode -1 (exact match or next smaller):

```
=XLOOKUP([@Balance], $M$2:$M$5, $N$2:$N$5, , -1)
```

### Q5. Two-way lookup: find the Salary for the employee named Amit Singh.

**Simple lookup version:**

```
=XLOOKUP("Amit Singh", Employees[Name], Employees[Salary])
```

**Expected result:** 82000

**INDEX + MATCH + MATCH for a proper two-way lookup** (useful when you need to find both a row and a column dynamically). Example: for a given EmployeeID and a given column name:

```
=INDEX(Employees, MATCH("E005", Employees[EmployeeID], 0), MATCH("Salary", Employees[#Headers], 0))
```

**Concept:** MATCH returns a position (row number or column number). Wrapping two MATCH calls inside INDEX lets you find any cell by (row_criteria, column_criteria).

### Q6. Join lookup: for each loan, return the customer's Province.

Add a column to the Loans table:

```
=XLOOKUP([@CustomerID], Customers[CustomerID], Customers[Province])
```

**Expected result for L003 (CustomerID C004):** QC

**Why interviewers ask this:** it tests whether you can think in terms of joining tables using Excel formulas, which is a fundamental data prep skill.

**Common mistake:** hardcoding a range instead of using structured references. `A2:A31` breaks the moment you add a 31st customer. `Customers[CustomerID]` self-extends.

### Q7. Handle case where a customer might not have a loan.

For customers who might not appear in the Loans table, count their loans:

```
=COUNTIF(Loans[CustomerID], [@CustomerID])
```

Or check with XLOOKUP:

```
=IF(XLOOKUP([@CustomerID], Loans[CustomerID], Loans[LoanID], "None")="None", "No loan", "Has loan")
```

**Concept:** XLOOKUP with a fallback returns the fallback value if not found, which you can then test with IF.

---

## Category 2: Conditional Aggregation (7 questions)

### Q8. Total Balance of all Chequing account customers in Ontario.

```
=SUMIFS(Customers[Balance], Customers[AccountType], "Chequing", Customers[Province], "ON")
```

**Expected result:** 68520

**Structured reference tip:** SUMIFS with Table references is cleaner and safer than absolute ranges. The formula reads like plain English.

**Common mistake:** getting argument order wrong. SUMIFS is `(sum_range, criteria_range1, criteria1, criteria_range2, criteria2, ...)`. SUMIF is the opposite: `(criteria_range, criteria, sum_range)`. Interviewers test this specifically.

### Q9. Count of Active Mortgages.

```
=COUNTIFS(Loans[LoanType], "Mortgage", Loans[Status], "Active")
```

**Expected result:** 11

**Concept:** COUNTIFS counts rows matching all criteria. Every criteria pair is combined with AND logic.

### Q10. Average LoanAmount for Personal loans that are still Active, excluding any under $5000.

```
=AVERAGEIFS(Loans[Amount], Loans[LoanType], "Personal", Loans[Status], "Active", Loans[Amount], ">=5000")
```

**Expected result:** approximately 14357

**Concept:** the ">=5000" criteria demonstrates comparison operators inside criteria arguments. You can use ">", "<", ">=", "<=", "<>".

### Q11. Total Deposit amount in March 2026.

```
=SUMIFS(Transactions[Amount], Transactions[Type], "Deposit", Transactions[Date], ">="&DATE(2026,3,1), Transactions[Date], "<="&DATE(2026,3,31))
```

**Expected result:** 43050

**Concept:** for date range criteria, you must concatenate the operator string with the DATE function using &. Passing a raw date won't work.

**Common mistake:** writing ">2026-03-01" as a string. Excel will not parse it correctly. Always use DATE().

### Q12. Dynamic SUMIFS: total Balance for a Province stored in cell M1.

If M1 contains "ON":

```
=SUMIFS(Customers[Balance], Customers[Province], M1)
```

**Expected result if M1 is "ON":** 210270

**Concept:** SUMIFS accepts cell references as criteria. This is how you build interactive dashboards without pivots.

### Q13. SUMIFS with wildcards: total Loan Amount for LoanTypes starting with "B".

```
=SUMIFS(Loans[Amount], Loans[LoanType], "B*")
```

**Expected result:** 1425000 (all Business loans)

**Concept:** `*` matches any number of characters, `?` matches a single character. These work in SUMIFS, COUNTIFS, and AVERAGEIFS but NOT in SUMPRODUCT.

### Q14. SUMPRODUCT as a SUMIFS alternative: total revenue from Deposits in Q1 2026.

```
=SUMPRODUCT((Transactions[Type]="Deposit") * (Transactions[Date]>=DATE(2026,1,1)) * (Transactions[Date]<=DATE(2026,3,31)) * Transactions[Amount])
```

**Expected result:** matches Q11 approach

**Why SUMPRODUCT matters:** works in older Excel versions without SUMIFS, and handles array logic that SUMIFS cannot (e.g. checking if a value is in a list).

**Interview tip:** if the interviewer says "no SUMIFS", they are testing whether you know SUMPRODUCT. Do not panic.

---

## Category 3: Pivot Tables and Power Pivot (7 questions)

### Q15. Build a pivot showing total Transaction Amount by Type and Channel.

**Steps:**

1. Click any cell inside the Transactions table
2. Insert > PivotTable > New Worksheet > OK
3. Drag `Type` to Rows
4. Drag `Channel` to Columns
5. Drag `Amount` to Values (should auto-set to Sum)

**Expected result:** a matrix of Type by Channel with totals. Deposits via Branch should be the largest cell.

**Interviewer speed check:** they will watch how you navigate this. Use Alt+N+V for Insert PivotTable, then drag with mouse or use the checkbox order in the PivotTable Fields pane.

### Q16. Calculated Field: add a "TransactionAmountUSD" field converting from CAD at 0.74.

**Steps:**

1. In the pivot, PivotTable Analyze tab > Fields, Items, & Sets > Calculated Field
2. Name: TransactionAmountUSD
3. Formula: `= Amount * 0.74`
4. OK

**Concept:** calculated fields work on aggregated values inside the pivot without modifying the source data. Great for currency conversions or ratios.

**Common mistake:** using a calculated column in the source table instead of a calculated field. That works but bloats the file and makes the pivot less portable.

### Q17. Group transaction dates by Month.

**Steps:**

1. Right-click any Date in the pivot > Group
2. Choose Months (and Years if the data spans multiple years)
3. OK

**Concept:** Excel automatically bins dates. You can group by Days, Months, Quarters, Years, or all of them at once.

**Interview scenario:** the interviewer says "show me a monthly trend." Do this in 5 seconds.

### Q18. Show Values As: percentage of grand total.

**Steps:**

1. In the pivot's Values area, right-click any value
2. Show Values As > % of Grand Total

**Concept:** Show Values As lets you transform the display without changing the underlying calculation. Common options: % of Column Total, % of Row Total, Running Total In, Rank Largest to Smallest.

### Q19. Insert a Slicer for Type and a Timeline for Date.

**Steps for Slicer:**

1. Select the pivot
2. PivotTable Analyze > Insert Slicer > check `Type` > OK

**Steps for Timeline:**

1. PivotTable Analyze > Insert Timeline > check `Date` > OK

**Concept:** Slicers give click-to-filter buttons for text fields. Timelines are date-specific slicers that let you drag across periods. If you have multiple pivots, right-click the Slicer > Report Connections to link them all.

### Q20. Load multiple tables into a Power Pivot data model.

**Steps:**

1. Data tab > Manage Data Model (if the tab is not visible, enable Power Pivot add-in via File > Options > Add-ins)
2. Add each of the 4 tables to the data model
3. Diagram View: drag CustomerID from Loans to CustomerID in Customers to create a relationship
4. Create similar relationships for Transactions and Employees (Employees to Employees via ManagerID gives you the hierarchy)

**Why this matters:** Power Pivot uses the VertiPaq engine, handles millions of rows, and lets you write DAX measures across multiple tables. Bank BI teams live in Power Pivot for anything beyond a single-table pivot.

### Q21. GETPIVOTDATA: pull one value from a pivot into another cell.

Suppose your pivot has "Sum of Amount" for Deposit type. To extract that specific number:

```
=GETPIVOTDATA("Sum of Amount", $A$3, "Type", "Deposit")
```

**Concept:** GETPIVOTDATA lets you reference pivot cells safely. If the pivot layout changes, the reference still returns the correct value.

**Interviewer trick:** they often ask "what happens when the pivot moves?" GETPIVOTDATA is the correct answer.

---

## Category 4: Conditional Logic (7 questions)

### Q22. Nested IF: classify customers as Low, Mid, or High spenders.

```
=IF([@Balance]<5000, "Low", IF([@Balance]<25000, "Mid", "High"))
```

**Expected result for C001 (Balance 5420):** Mid

**Concept:** each IF has 3 parts: condition, value_if_true, value_if_false. Nested IFs put another IF in the value_if_false position. Order matters. Test from lowest to highest (or highest to lowest) but never mix.

### Q23. IFS: same classification, cleaner syntax.

```
=IFS([@Balance]<5000, "Low", [@Balance]<25000, "Mid", TRUE, "High")
```

**Expected result:** identical to Q22

**Concept:** IFS lets you chain conditions without nesting. The final `TRUE` is the catch-all (equivalent to ELSE). Requires Excel 2019 or later.

### Q24. Combined AND: flag customers who are Active loan holders under 30 with balance below 3000.

Add a helper column to Customers:

```
=IF(AND([@Age]<30, [@Balance]<3000, XLOOKUP([@CustomerID], Loans[CustomerID], Loans[Status], "None")="Active"), "Watch List", "OK")
```

**Concept:** AND returns TRUE only when all arguments are TRUE. OR returns TRUE if any argument is TRUE. Combine with IF for real business logic.

**Common mistake:** trying `[@Age]<30 AND [@Balance]<3000` like in SQL. Excel does not use AND as an operator. You must call AND() as a function.

### Q25. IFERROR: safely divide LoanAmount by Balance.

```
=IFERROR([@Amount]/XLOOKUP([@CustomerID], Customers[CustomerID], Customers[Balance]), 0)
```

**Concept:** IFERROR wraps a formula and returns a fallback value if the formula errors. Divide-by-zero, missing lookup, and type mismatch all get caught.

**Interview signal:** production-quality analysts wrap every division and every lookup in IFERROR by default. Interviewers notice.

### Q26. SWITCH: convert Province codes to full names.

```
=SWITCH([@Province], "ON", "Ontario", "BC", "British Columbia", "QC", "Quebec", "AB", "Alberta", "MB", "Manitoba", "NS", "Nova Scotia", "Unknown")
```

**Concept:** SWITCH is IFS's cleaner cousin for exact-match logic. Much more readable than nested IFs or IFS with equality checks.

### Q27. LET: readability for a complex calculation.

Calculate the loan-to-balance ratio and classify it:

```
=LET(
    balance, XLOOKUP([@CustomerID], Customers[CustomerID], Customers[Balance]),
    ratio, [@Amount] / balance,
    IF(ratio > 5, "High Risk", IF(ratio > 2, "Medium Risk", "Low Risk"))
)
```

**Concept:** LET assigns names to intermediate results, then uses them in the final expression. Massive readability boost when the same calculation is used multiple times or when logic is complex. Available in Excel 365 / 2021.

### Q28. Array formula: count customers whose balance exceeds their loan payment × 100.

```
=SUMPRODUCT((Customers[Balance] > (XLOOKUP(Customers[CustomerID], Loans[CustomerID], Loans[MonthlyPayment], 0) * 100)) * 1)
```

**Concept:** SUMPRODUCT with boolean arithmetic evaluates each row and sums TRUE (=1) results. The multiplication by 1 forces boolean to number.

---

## Category 5: Data Cleaning (7 questions)

### Q29. TRIM and CLEAN: remove extra whitespace and non-printing characters.

Suppose a Name column has entries like `"  Priya   Sharma  "` with tabs and extra spaces:

```
=TRIM(CLEAN([@Name]))
```

**Concept:** TRIM removes leading, trailing, and duplicate internal spaces. CLEAN removes non-printing ASCII characters (like tabs or line breaks). Always chain them when cleaning imported data.

### Q30. Split FirstName and LastName from a single "FullName" column.

Using TEXTSPLIT (Excel 365):

```
=TEXTSPLIT("Priya Sharma", " ")
```

Returns an array with "Priya" and "Sharma".

Legacy approach:

```
=LEFT([@FullName], FIND(" ", [@FullName]) - 1)          // First name
=MID([@FullName], FIND(" ", [@FullName]) + 1, 100)      // Last name
```

**Concept:** FIND returns the position of a substring. LEFT and MID slice the string. This pattern shows up in every bank data cleaning test.

**Flash Fill shortcut:** in Excel 365 or 2019, just type the desired output in one cell, then press Ctrl+E. Excel infers the pattern.

### Q31. Extract initials from a Name column.

```
=LEFT([@FirstName], 1) & LEFT([@LastName], 1)
```

For Priya Sharma: `"PS"`

**Concept:** LEFT with 1 pulls the first character. `&` concatenates strings. CONCAT (or CONCATENATE) does the same but takes multiple arguments.

**Or with Flash Fill:** type "PS" in the first row and Ctrl+E.

### Q32. Remove duplicate customer rows, keeping the row with the highest Balance.

**Steps:**

1. Sort Customers by Balance descending (Data > Sort)
2. Select the CustomerID column plus one more
3. Data > Remove Duplicates > check only CustomerID
4. Excel keeps the first occurrence, which is the highest Balance

**Concept:** Remove Duplicates keeps the first occurrence of each key. Sort before removing to control which row is kept.

**Alternative with Power Query** for a repeatable process: Load table > Group By CustomerID > Aggregate Balance with Max > Merge back.

### Q33. Text-to-Columns: split "Toronto, ON" into two columns.

**Steps:**

1. Select the column with "Toronto, ON" values
2. Data > Text to Columns > Delimited > Next
3. Check "Comma" and "Space" > Next
4. Destination cell > Finish

**Concept:** Text-to-Columns is a one-shot wizard. Faster than writing formulas when the split is one-time.

**When to use formulas instead:** when the source data updates and the split needs to auto-apply.

### Q34. Power Query merge: bring Customer's Province into the Loans table.

**Steps:**

1. Data > Get Data > From Table/Range (with Loans selected). Repeat for Customers.
2. In Power Query Editor, select the Loans query
3. Home > Merge Queries > Merge Queries as New
4. Choose Customers table, match on CustomerID
5. Select Left Outer Join
6. OK, then expand the Customers column and choose Province
7. Home > Close & Load To

**Concept:** Power Query is Excel's ETL tool. It creates repeatable transformations that run every time you refresh, which is how bank BI analysts avoid redoing manual cleanup every month.

### Q35. Handle date parsing errors from an imported CSV.

If dates come in as text like "15/03/2020":

```
=IFERROR(DATE(VALUE(MID([@RawDate], 7, 4)), VALUE(MID([@RawDate], 4, 2)), VALUE(LEFT([@RawDate], 2))), "Invalid")
```

**Concept:** parse each part with MID and LEFT, convert to numbers with VALUE, then reassemble with DATE.

**Cleaner with DATEVALUE if the format is unambiguous:**

```
=IFERROR(DATEVALUE([@RawDate]), "Invalid")
```

DATEVALUE respects your regional format. If DD/MM does not match your locale, MID parsing is safer.

---

## Category 6: Financial and Date Functions (5 questions)

Bank interviews specifically test these because they map to actual bank use cases: loan payments, amortization, mortgage renewals, and Canadian banking day rules.

### Q36. Calculate the monthly payment for a $500,000 mortgage at 5% APR over 25 years.

```
=PMT(5%/12, 25*12, -500000)
```

**Expected result:** 2922.95

**Concept:** PMT(rate, nper, pv). Rate must match the period (monthly rate = annual/12). Nper is the total number of periods. PV is the present value; the negative sign convention returns a positive payment.

**Common mistake:** forgetting to divide the annual rate by 12 or forgetting to multiply years by 12. Both errors give absurd results and immediately signal to interviewers that you have not used PMT in real work.

### Q37. Build a 5-year amortization schedule for L002 (mortgage of $485000, 5.25%, 300 months).

Create columns: Month, PaymentNumber, Payment, Interest, Principal, Balance.

For Month 1 (assume Balance start in a helper cell = 485000):

```
Payment:   =PMT(5.25%/12, 300, -485000)         // 2905.32 (rounded)
Interest:  =IPMT(5.25%/12, 1, 300, -485000)     // 2121.88
Principal: =PPMT(5.25%/12, 1, 300, -485000)     // 783.44
Balance:   =485000 - PPMT(5.25%/12, 1, 300, -485000)
```

For subsequent months, IPMT and PPMT take the period number (1, 2, 3, ...) and Excel computes the correct split.

**Concept:** IPMT returns interest portion of a specific payment. PPMT returns principal portion. PMT = IPMT + PPMT for the same period.

**Bank interview scenario:** interviewer says "show me how much of the first payment goes to interest vs principal." That is a 30-second answer with IPMT and PPMT.

### Q38. Calculate NPV for a business loan cash flow.

Suppose the loan generates these annual cash flows: -200000 (loan out), 45000, 55000, 65000, 75000, 60000. Discount rate 8%.

```
=NPV(8%, 45000, 55000, 65000, 75000, 60000) + (-200000)
```

Or if the cash flows are in cells B1:B5 and initial in A1:

```
=NPV(8%, B1:B5) + A1
```

**Expected result:** approximately 30140 (positive NPV means the loan is profitable at the discount rate).

**Concept:** NPV assumes the first cash flow is at end of period 1. If your initial outflow is at period 0, add it separately outside the NPV.

**Related:** IRR gives you the discount rate at which NPV = 0. `=IRR(A1:B5)` including the initial outflow.

### Q39. EOMONTH and EDATE: calculate mortgage renewal dates.

The last day of the month the mortgage started (L002 started 2020-06-22):

```
=EOMONTH(DATE(2020,6,22), 0)
```

**Expected result:** 2020-06-30

The date exactly 5 years after the start (typical Canadian mortgage renewal):

```
=EDATE(DATE(2020,6,22), 60)
```

**Expected result:** 2025-06-22

**Concept:** EOMONTH(start, months) returns the last day of the month N months after start. EDATE(start, months) returns the same day of the month N months later. Both handle month-length edge cases automatically.

### Q40. NETWORKDAYS.INTL: business days between two dates, excluding Canadian holidays.

For a loan approval process that took from 2026-01-05 to 2026-03-15, excluding weekends and Canadian statutory holidays:

Assume Canadian 2026 holidays are in H1:H10:

```
=NETWORKDAYS.INTL("2026-01-05", "2026-03-15", 1, H1:H10)
```

**Concept:** NETWORKDAYS.INTL takes (start, end, weekend_code, [holidays]). Weekend code 1 is standard Sat-Sun. You can customize with a 7-character string like "0000110" to define custom weekends.

**Why banks care:** SLA tracking, loan processing timelines, and settlement calculations all depend on business day math with statutory holidays. This is a real interview question at RBC and TD ops teams.

---

## Bank-specific scenarios (extra practice)

### Scenario A: Loan-to-Income analysis

Add a helper column to Customers estimating monthly income (assume 3x monthly loan payment for anyone with a loan, else 0). Then compute the loan-to-income ratio for each customer with an active loan.

Steps:

1. XLOOKUP to bring in MonthlyPayment from Loans
2. Calculate estimated monthly income = MonthlyPayment × 3
3. IFS to bucket the ratio: Safe (<25%), Watch (25 to 40%), High Risk (>40%)

### Scenario B: Deposit vs Withdrawal reconciliation

Build a summary table showing per customer:

- Total Deposits
- Total Withdrawals
- Net Movement
- Number of Fee transactions

Use SUMIFS four ways, one per column. Then add conditional formatting to highlight net movement < 0 in red.

### Scenario C: Employee compensation vs department average

For each employee, show their salary and their department's average salary side by side. Then flag anyone below 80% of their department average.

Steps:

1. AVERAGEIFS for department average per row
2. Ratio = Salary / Department Average
3. IF(Ratio < 0.8, "Below Market", "OK")

Practice all three. These are the exact shapes of questions RBC and TD test in the ops and business analyst tracks.

---

## Interview format tips

**What Canadian banks test in a live Excel test:**

- **Round 1** (30 minutes, 8 to 12 tasks): fundamentals. Lookups, SUMIFS, basic pivots, IF logic.
- **Round 2** (45 minutes, 4 to 6 complex tasks): Power Query cleanup, Power Pivot data model, calculated columns and measures, dashboard-style output.
- **Round 3** (if applied for senior roles, 60 minutes, 2 to 3 open-ended tasks): given messy data, produce a stakeholder-ready analysis.

**What they grade beyond the answer:**

- Keyboard-vs-mouse ratio
- Formula readability (structured references, LET, named ranges)
- Whether you wrap risky operations in IFERROR
- Whether you say your logic aloud as you work
- Whether you sanity-check totals (grand totals matching, no orphan rows)

**What to say aloud:**

- "I'm using XLOOKUP here because I want the formula to survive column inserts."
- "Wrapping this in IFERROR so a missing customer returns zero instead of breaking downstream."
- "Let me sanity check: the pivot total should match the SUMIFS total. Yes, matches."

That kind of narration converts a merely correct test into a strong hire signal.

---

## 4-week practice plan

**Week 1:** Categories 1 and 2. Practice each question until you can write the formula from memory in under 60 seconds.

**Week 2:** Categories 3 and 4. Build 3 pivots per day from the practice dataset with different Row / Column / Filter combos.

**Week 3:** Categories 5 and 6. Do all three bank-specific scenarios. Build the loan amortization schedule from scratch twice.

**Week 4:** Timed mock tests. Give yourself 40 minutes to complete a random subset of 12 questions. Aim for full completion with keyboard-only navigation.

If you can do the full 4 weeks, you are ready for any Canadian bank Excel test.

If you want mentorship from data analysts and BI Analysts already working at Canadian banks, check out ORU at [joinoru.com](http://joinoru.com).