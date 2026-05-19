# Data Modeling and AI Infrastructure (Resource Doc)

---

## Why Data Modeling Matters More Than Ever in 2026

Everyone is talking about AI. Companies are building RAG pipelines, deploying LLMs, and automating workflows. But the most common reason AI projects fail inside companies is not the model — it is the data underneath it.

Garbage in, garbage out. If your data is poorly structured, inconsistently named, or missing key relationships, the AI does not stand a chance of giving useful answers.

Data modeling is the discipline of deciding how data should be structured, organized, and related — so that both humans and machines can use it effectively. It is the foundation that everything else sits on.

In 2026, understanding data modeling is an underrated differentiator for data analysts, data engineers, and anyone working close to AI pipelines.

---

## What Is Data Modeling

Data modeling is the process of creating a visual or structural representation of a system's data and the relationships between different data entities.

In practical terms: before anyone writes a single SQL query or builds a dashboard, someone has to decide what tables exist, what columns they contain, how they relate to each other, and what rules govern the data. That process is data modeling.

A well-designed data model makes queries faster, dashboards more accurate, AI outputs more reliable, and onboarding new team members much easier. A poorly designed one creates technical debt that compounds for years.

---

## The Three Types of Data Models

### Conceptual Data Model

The highest level of abstraction. Describes what data exists in the system and how entities relate to each other — without any technical detail.

Who it is for: Business stakeholders, product managers, and anyone who needs to understand the data without caring about the technical implementation.

What it contains: Entity names (Customer, Order, Product), relationships between them (a Customer places many Orders, an Order contains many Products), and high-level rules (every Order must have a Customer).

Format: Entity-Relationship (ER) diagram drawn in Lucidchart, [draw.io](http://draw.io), or even on a whiteboard.

Example: In a bank system, the conceptual model might show: Customer, Account, Transaction, Branch — and the relationships between them. No column names, no data types, no technical detail.

### Logical Data Model

Adds more detail to the conceptual model — defining the specific entities, attributes (columns), relationships, and keys — but still without committing to a specific database technology.

Who it is for: Data architects, senior analysts, and anyone designing the data structure before choosing the specific database or tool.

What it contains: Table names, column names, data types (generic — not SQL-specific), primary keys, foreign keys, and the cardinality of relationships (one-to-many, many-to-many).

Format: Detailed ER diagram with all tables and columns shown.

Example: The Customer table has: customer_id (primary key), first_name, last_name, email, date_of_birth, created_at. The Account table has: account_id (primary key), customer_id (foreign key), account_type, balance, opened_date.

### Physical Data Model

The most detailed level — the actual implementation in a specific database system. Takes the logical model and translates it into the exact syntax and constraints of the chosen database.

Who it is for: Data engineers, database administrators, and anyone building the actual database.

What it contains: Exact SQL data types (VARCHAR(255), BIGINT, TIMESTAMP), specific constraints (NOT NULL, UNIQUE, DEFAULT values), indexes, partitioning strategy, storage considerations.

Format: SQL DDL (CREATE TABLE statements) or a tool-specific schema diagram.

---

## The Two Most Important Patterns for Analytics

### Star Schema

The star schema is the most widely used data modeling pattern in Canadian data warehouses and BI environments. It organizes data into two types of tables:

Fact tables: contain measurable, quantitative data about events. Examples: sales_fact (one row per transaction), page_views_fact (one row per website visit).

Dimension tables: contain descriptive, contextual information about the entities in the fact table. Examples: customer_dim, product_dim, date_dim, store_dim.

The fact table sits in the center and connects to the dimension tables via foreign keys — forming a star shape.

Why it is used: It is optimized for analytical queries. Joining a fact table to a few dimension tables is very fast, even on billions of rows. It is easy for business users to understand. It maps naturally to how BI tools like Tableau and Power BI expect data to be structured.

Example star schema for a retail company:

Fact table: sales_fact (sale_id, customer_key, product_key, date_key, store_key, quantity, revenue, discount)

Dimension tables: customer_dim (customer_key, name, email, segment, region), product_dim (product_key, name, category, brand, price), date_dim (date_key, date, month, quarter, year, is_holiday), store_dim (store_key, name, city, province, store_type)

### Snowflake Schema

A normalized version of the star schema. Dimension tables are further broken down into sub-dimension tables to eliminate redundancy.

Example: Instead of having product_dim with category and brand columns, you would have a separate category_dim and brand_dim table, each referenced by the product_dim.

Advantages: Less data redundancy, easier to update dimension data without affecting the fact table.

Disadvantages: More complex queries (more joins required), slower performance for analytical workloads compared to star schema.

When to use it: When storage is a concern, when dimension data changes frequently, or when the data team strongly values normalization.

In practice in Canada: Most modern cloud data warehouses (Snowflake, BigQuery, Redshift) are fast enough that the performance difference between star and snowflake schema is small. Star schema is still more common because it is simpler and BI tools handle it better.

---

## How Data Modeling Connects Directly to AI

This is the connection most people miss.

### RAG Pipelines

When a company builds a RAG (Retrieval Augmented Generation) pipeline — where an LLM answers questions about company data — the quality of the retrieved data is everything. If the underlying tables are poorly named, lack clear relationships, or contain inconsistent data, the retrieval step returns garbage and the LLM produces garbage answers.

A well-modeled data warehouse means that when someone asks the AI "what were our top products last quarter," the system can reliably join the correct tables and return accurate data. A poorly modeled one means the AI either cannot find the data or retrieves the wrong thing.

### AI Feature Engineering

When data science teams build ML models, they need clean, well-structured data to create features. Poor data modeling means features are either unavailable, require enormous cleaning effort, or are inconsistently defined across the organization.

A data model where customer_lifetime_value is defined consistently across the entire schema means every model that needs that feature gets the same calculation. Without that modeling, different teams define CLV differently and model results are incomparable.

### Semantic Layers

Tools like dbt's semantic layer, LookML, and AtScale sit between the data model and the AI or BI layer. They translate business logic — "revenue means this specific calculation" — into reusable definitions. This is only possible if the underlying data is well-modeled. Without it, every analyst and every AI query defines metrics differently.

---

## Key Data Modeling Concepts to Know

Grain: The level of detail captured in a fact table. A sales fact table at daily grain has one row per product per day. At transaction grain it has one row per individual transaction. Getting the grain wrong is one of the most common data modeling mistakes.

Surrogate keys: Artificial primary keys (usually integers) assigned by the data warehouse, independent of the source system keys. Important for handling slowly changing dimensions and avoiding key conflicts across source systems.

Slowly changing dimensions (SCD): How to handle changes to dimension data over time. If a customer moves from Toronto to Vancouver, do you overwrite the old city or keep the history? SCD Type 1 overwrites. SCD Type 2 keeps history with effective dates.

Conformed dimensions: Dimension tables shared across multiple fact tables — ensuring that customer_dim means the same thing in the sales model and the support model. Critical for cross-functional analysis.

Data vault: An alternative modeling methodology for enterprise data warehouses that emphasizes flexibility and auditability. Growing in adoption at Canadian banks and large enterprises.

---

## Canadian Roles That Specifically Value Data Modeling

| Role | How Data Modeling Is Used |
| --- | --- |
| Analytics Engineer | Primary responsibility — builds and maintains dbt models, designs star schemas |
| Data Engineer | Designs the physical data model in the warehouse, implements the transformation layer |
| Senior Data Analyst | Contributes to logical data models, works with modeled data to build analyses |
| BI Developer | Builds semantic layers on top of modeled data in Power BI or Tableau |
| Data Architect | Designs enterprise-wide data modeling standards and patterns |

---

## How to Learn Data Modeling

### Free Resources

dbt Learn Fundamentals — [courses.getdbt.com](http://courses.getdbt.com) (free). Teaches data modeling through the lens of building dbt models. Probably the fastest way to understand practical data modeling in a modern stack.

Kimball Group — [kimballgroup.com](http://kimballgroup.com). Ralph Kimball is the author of the star schema methodology. His free articles and the Data Warehouse Toolkit book (available at libraries) are the definitive reference on dimensional modeling.

Mode Analytics SQL Tutorial — [mode.com/sql-tutorial](http://mode.com/sql-tutorial). Covers SQL with a strong emphasis on analytical query patterns that assume a well-modeled data warehouse.

Lucidchart (free tier) — [lucidchart.com](http://lucidchart.com). The best free tool for drawing ER diagrams and documenting data models.

### Practical Exercise to Start Today

Pick any Kaggle dataset with multiple related tables (the Olist Brazilian E-commerce dataset is ideal — it has 9 related tables). Draw the conceptual model first — just the entity names and relationships. Then draw the logical model — add column names and keys. Then identify how you would restructure it as a star schema for analytics. Document your thinking in a GitHub README. This one exercise will teach you more than any tutorial.

---

## Want to Go Deeper? ORU Hands-On Data Analytics Course

Most analytics courses teach you tools. This one teaches you how to think like a practitioner, then gives you the tools to execute. Every project is built around a realistic business problem — insurance, banking, fintech, and ecommerce. The tools span Python, SQL, BigQuery, dbt Core, Tableau, Power BI, Streamlit, and Vanna AI. Nothing is introduced for its own sake. By the final project, you are operating across a stack that reflects what senior practitioners use in production.

For analysts who are tired of concept-heavy courses with little real execution: [joinoru.com/course/hands-on-data-analytics](http://joinoru.com/course/hands-on-data-analytics)

---

*For mentorship, live sessions, and community support: [joinoru.com](http://joinoru.com)*