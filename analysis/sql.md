# 🧠 SQL Guide

This repository provides a comprehensive guide to learning SQL — from fundamental concepts to advanced techniques, along with practical applications and interview preparation tips.

---

## 📚 Table of Contents

1. [Top Free SQL Learning Websites](#top-free-sql-learning-websites)
2. [GitHub Repository](#github-repository)
3. [5 Free Websites That Teach SQL as a Game](#5-free-websites-that-teach-sql-as-a-game)
4. [Comprehensive Guide to Learning SQL](#comprehensive-guide-to-learning-sql)
   - [Database Fundamentals](#1-database-fundamentals)
   - [SQL Fundamentals](#2-sql-fundamentals)
   - [Intermediate Concepts](#3-intermediate-concepts)
   - [Practical Applications](#4-practical-applications)
   - [How Much SQL is Enough?](#5-how-much-sql-is-enough)
5. [Top SQL YouTube Channels](#top-sql-youtube-channels)

---

## 🌐 Top Free SQL Learning Websites

- [SQLBolt](https://sqlbolt.com/)
- [SQLZoo](https://sqlzoo.net/wiki/SELECT_basics)
- [Mode SQL Tutorial](https://mode.com/sql-tutorial)
- [SQL-Island](https://sql-island.informatik.uni-kl.de/#)

---

## 📂 GitHub Repository

> Access sample questions and a practice dataset here:  
👉 [github.com/SahilGogna/SQL-ORU](https://github.com/SahilGogna/SQL-ORU)

---

## 🎮 5 Free Websites That Teach SQL as a Game

Most people quit SQL because dry exercises on fake datasets feel pointless. These five give you a reason to write the query. All of them are free. They are ordered easiest to hardest.

### 1. SQL Island

**Link:** [sql-island.informatik.uni-kl.de](https://sql-island.informatik.uni-kl.de/)

**The premise:** you have survived a plane crash and are stranded on an island. You need SQL to survive. Join a village, find a job, plan your escape.

**Difficulty:** absolute beginner. Genuinely start here even if you think you are past it.

**Covers:** SELECT, WHERE, ORDER BY, basic JOIN, UPDATE, INSERT, DELETE.

**Time:** 45 to 90 minutes for the whole story.

**Why it works:** the first 20 minutes teach you SELECT, WHERE and JOIN without you noticing you are learning. It is the friendliest on-ramp that exists.

### 2. SQL Murder Mystery, guided mode

**Link:** [mystery.knightlab.com](https://mystery.knightlab.com/)

**The premise:** a murder has been committed in SQL City. You have the police database. Find the killer.

**Built by:** Knight Lab at Northwestern University, which is why it is well constructed rather than a weekend project.

**Difficulty:** beginner to intermediate in guided mode.

**Covers:** JOIN across multiple tables, WHERE with several conditions, LIKE, subqueries, and reading a schema you did not design.

**Time:** one to two hours.

**Why it works:** it teaches the skill nobody teaches, which is exploring an unfamiliar database. That is what your first week at any job looks like.

### 3. SQL Police Department

**Link:** [sqlpd.com](https://sqlpd.com/)

**The premise:** solve crimes with queries. Cases are structured and get progressively harder.

**Difficulty:** intermediate.

**Covers:** aggregation, GROUP BY, HAVING, nested subqueries, and multi-step reasoning.

**Time:** a few hours across several sessions.

**Why it works:** the progression is better designed than Murder Mystery. You can feel yourself levelling up rather than being dropped in.

### 4. SQLNoir

**Link:** [sqlnoir.com](https://sqlnoir.com/)

**The premise:** detective cases in a noir setting.

**Difficulty:** intermediate.

**Covers:** realistic query patterns, closer to what you actually write at work than the puzzle-style sites.

**Time:** a few hours.

**Why it works:** the queries feel like production queries. Less puzzle, more job.

### 5. SQL Murder Mystery, hard mode

Same link, no hints. The site tells you the schema and nothing else.

**Difficulty:** genuinely hard. Do not start here.

**Why it is separate:** if you can solve it with no hints, you can explore an unfamiliar database and find an answer under pressure. That is the actual skill an interview is testing.

### Bonus: CodinGame

**Link:** [codingame.com](https://www.codingame.com/)

Not SQL-specific, and covers 25+ languages, but the SQL challenge volume is high and the leaderboard makes practice consistent. Use it for repetition once the story-based sites are finished.

### How to actually use these

**These replace practice, not learning.** Learn the concept somewhere structured, then come here and write queries until it sticks. Games are terrible at explaining window functions and excellent at making you use them.

**Suggested run:**

| Week | What to do |
| --- | --- |
| 1 | SQL Island, start to finish |
| 2 | Murder Mystery guided mode |
| 3 | SQL Police Department |
| 4 | SQLNoir, plus Murder Mystery hard mode |

Four weeks, a few hours a week, and you will be past the level most people quit at.

### What these will not cover

Be honest about the gap. For Canadian data interviews you still need:

- **Window functions.** ROW_NUMBER, RANK, LAG, LEAD, running totals. Barely touched by any of these sites and asked constantly
- **CTEs.** WITH clauses for readable multi-step queries
- **Query performance.** Indexes, execution plans, why your query is slow
- **Database design.** Normalisation, keys, star schemas

Do the games to stop hating SQL. Then do the interview prep separately.

---

## 📘 Comprehensive Guide to Learning SQL

### 1. Database Fundamentals

Before diving into SQL queries, it is essential to understand the foundational concepts of databases:

- **What is a Database (DB)?**  
  An organized collection of data stored and accessed electronically.

- **What is SQL?**  
  Structured Query Language used to interact with databases.

- **What is a Query?**  
  A set of instructions to retrieve or manipulate data.

- **What is a DBMS?**  
  Software that allows users to manage and interact with databases.

- **What is an RDBMS?**  
  A type of DBMS that stores data in relational (tabular) form.

- **What is a SQL Client?**  
  A tool used to write and execute SQL queries.

- **What is Normalization?**  
  Organizing data to reduce redundancy and improve integrity.

- **Database Connection Info:**
  - Hostname
  - Username
  - Database Name
  - Password
  - Port

---

### 2. SQL Fundamentals

Core building blocks every SQL learner should master:

- **Basic Commands:**
  - `SELECT`
  - `WHERE`

- **CRUD Operations:**
  - `INSERT` (Create)
  - `SELECT` (Read)
  - `UPDATE`
  - `DELETE`

- **Sorting and Filtering:**
  - `ORDER BY`
  - `GROUP BY`

- **Joins:**
  - INNER JOIN
  - LEFT JOIN
  - RIGHT JOIN
  - OUTER JOIN
  - SELF JOIN

- **Aggregation Functions:**
  - `SUM`, `COUNT`, `AVG`, `MIN`, `MAX`

- **Subqueries:**  
  Queries nested inside other queries.

---

### 3. Intermediate Concepts

Level up your SQL skills by exploring:

- **Window Functions:**  
  Row-wise calculations like `RANK()`, `ROW_NUMBER()`, `SUM() OVER`

- **Common Table Expressions (CTEs):**  
  Temporary named result sets using `WITH`

- **Indexes & Optimization:**  
  Enhance performance using indexing and query tuning techniques

---

### 4. Practical Applications

Apply your skills to real-world scenarios:

- Analyze personal finance data
- Explore company sales or customer retention
- Build dashboards powered by SQL queries
- Perform data cleaning and transformation tasks

---

### 5. How Much SQL is Enough?

- **Less Technical Roles:**  
  Master basics like SELECT, WHERE, JOIN, and simple aggregates

- **Data Analysts / Engineers / Scientists:**  
  Learn subqueries, window functions, CTEs, performance tuning

- **For Interviews:**  
  Focus on solving real SQL problems regularly using platforms like LeetCode, StrataScratch, or this [Practice Repo](https://github.com/SahilGogna/SQL-ORU)

---

## 🎥 Top SQL YouTube Channels

Explore these curated playlists for every learning level:

- **QAFox**  
  [SQL Practice Series](https://www.youtube.com/playlist?list=PLsjUcU8CQXGFFAhJI6qTA8owv3z9jBbpd)

- **Kudvenkat**  
  [SQL Server Tutorial](https://www.youtube.com/playlist?list=PL08903FB7ACA1C2FB)

- **Techtfq**
  - [Basic SQL Concepts](https://www.youtube.com/playlist?list=PLavw5C92dz9HQQ_COgGb7kf_1H8UWUBxO)
  - [Intermediate SQL Concepts](https://www.youtube.com/playlist?list=PLavw5C92dz9FD9XspliRM_HZM_jK7tkii)
  - [Advanced SQL Concepts](https://www.youtube.com/playlist?list=PLavw5C92dz9GbmgiW4TWVnxhjMFOIf0Q7)

- **ELearning Bridge (Shashank Mishra)**  
  [Playlist Collection](https://www.youtube.com/@shashank_mishra/playlists)

- **Ankit Bansal**  
  [Playlist Collection](https://www.youtube.com/@ankitbansal6/playlists)

---

### 🙌 Bonus: Start Practicing Now

Head to the [Practice Repo](https://github.com/SahilGogna/SQL-ORU) and explore:

- A complete retail sales dataset
- Step-by-step setup instructions
- Join examples and interview questions
- Solutions to 15+ real-world SQL problems

---

### Want to Build Real Analytics Projects?

ORU's **Hands-On Data Analytics** course teaches you to think like a practitioner and execute like one — through realistic business problems across insurance, banking, fintech, and ecommerce. Tools covered include Python, SQL, BigQuery, dbt Core, Tableau, Power BI, Streamlit, and Vanna AI.

Use code **ORU10** for 10% off → [Enroll Now](https://joinoru.com/course/hands-on-data-analytics:-learn-by-building-industry-projects)

*For mentorship, live sessions, and community support: [joinoru.com](https://joinoru.com)*
