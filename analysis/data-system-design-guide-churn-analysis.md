# Guide to Designing a Data System for Subscription Churn Analysis

Designing a complete data system means thinking beyond any single dashboard or pipeline. It means structuring how information flows from raw sources all the way to the people who need it. This guide walks through a six-step framework for doing exactly that, and then applies it to a real-world case study: building a system to analyze subscription churn.

Whether you're prepping for a system design interview or building something at work, this framework gives you a repeatable way to think through the problem end to end.

---

## The Six-Step Data System Framework

Every data system, regardless of the domain, benefits from the same foundational structure. Here are the six steps:

1. **Clarify Requirements** — Understand the end goal and business logic. Who will use the system? How fresh does the data need to be? And critically, how does the business define its metrics?

2. **Identify Data Sources** — Figure out where the raw data currently lives. Is it in internal systems? External tools? Third-party APIs?

3. **Determine Storage Layers** — Structure your data into distinct layers, typically Staging (Bronze), Conformed (Silver), and Consumption (Gold).

4. **Process the Data** — Decide whether processing should be real-time or batch, based on how fresh the metrics need to be.

5. **Design the Serving Layer** — Define how end users will actually consume the data. Will it be through a BI tool, an API, a pre-aggregated cache, or something else?

6. **Plan for Monitoring and Edge Cases** — Think about what happens when things break. How do you page the responsible team? How do you prevent leadership from seeing incorrect numbers?

These steps aren't always perfectly linear. You'll often bounce between them as you learn more about the problem. But they give you a solid mental model for covering all your bases.

---

## Case Study: Analyzing Subscription Churn

**The Problem:** Design a data system for a subscription company (think Netflix, Spotify, or any SaaS product) to help leadership and retention teams understand three things:

- Who is churning?
- Why are they churning?
- Which customers are at risk of churning next?

Let's walk through each step of the framework applied to this problem.

---

### Step 1: Clarifying Requirements and Business Logic

This is the step most people rush through, and it's where the most costly mistakes happen. Never assume definitions. Always clarify the exact mathematical and business logic behind every metric you're tracking.

#### Defining "Churn"

In this scenario, a customer is considered **churned 45 days after they cancel** their subscription. That 45-day window includes a 15-day grace period, meaning the customer technically has time to come back before the system formally marks them as churned.

There's a wrinkle, though. If a cancelled customer returns within 15 days *after* that 45-day mark (so between day 45 and day 60), they should be reclassified as "retained" rather than churned. However, they should still be flagged for analysis because their cancellation behavior is meaningful even if they came back.

This kind of nuance matters. If you don't nail the definition upfront, every number downstream will be wrong, and you won't know it until someone in leadership questions a report.

#### Defining "At-Risk of Churn"

Customers can be flagged as at-risk based on observable behavioral patterns, including:

- **Post-trial drop-off:** Signed up for a free trial, used the product a few times, and then stopped.
- **Usage decline:** Was an active user but their engagement metrics (watch time, login frequency, feature usage) have been trending downward.
- **Negative feedback signals:** Left a low NPS score, submitted a complaint, or expressed frustration through support channels.
- **Unfulfilled search intent:** Repeatedly searched for content or features that don't exist on the platform.

Each of these signals can be weighted differently depending on the business. The important thing is that they're defined explicitly and agreed upon with stakeholders before you start building anything.

#### Identifying the Users

Not everyone needs the same view of this data. Identify your consumers early:

- **Top Leadership** reviews monthly or quarterly churn metrics at a high level. They care about trends, not individual records.
- **The Retention Team** needs near-real-time or daily data on at-risk users so they can intervene (send targeted offers, trigger re-engagement campaigns, etc.).
- **The Product Team** wants to understand which features (or lack of features) correlate with churn so they can prioritize their roadmap.

Each user group implies different requirements around data freshness, granularity, and access patterns. Keep that in mind as you move through the remaining steps.

---

### Step 2: Identifying Data Sources

Once the problem is well-defined, brainstorm every internal and external source that captures relevant data. For churn analysis, you'll typically need:

#### Subscription and Billing Data
This covers the core subscription lifecycle: sign-ups, plan changes, cancellations, payment successes and failures. It might come from internal systems or third-party billing platforms like Stripe or Recurly. You'll use this to determine subscription status, plan tier, billing history, and grace period tracking.

#### Product Usage Data
Events logged directly from the application. This includes things like watch time, login frequency, feature usage, session duration, and critically, unfound search queries (which signal unmet user intent). This is often the highest-volume data source and typically lives in an event streaming system or a data warehouse.

#### Customer Support Tickets
Sourced from platforms like Zendesk or Freshdesk. Track the volume of tickets per user, the sentiment of those interactions, common issue categories, and whether technical problems went unresolved. A user who submitted three frustrated tickets in a week is a very different churn risk than one who's been silent.

#### Survey Data (NPS and CSAT)
Collected through tools like Qualtrics or SurveyMonkey at various touchpoints: during onboarding, mid-subscription, or post-cancellation. This is structured qualitative data, and it's one of the few sources where customers directly tell you how they feel.

#### Marketing and CRM Data
Pulled from tools like Google Ad Manager, HubSpot, or Salesforce. This includes campaign open rates, click-through rates, and engagement patterns. It helps answer whether marketing efforts are reaching at-risk users and whether re-engagement campaigns are working.

#### Customer Demographics
Profile-level data including location, language, device type, sign-up date, and referral source. These attributes are useful for segmenting churn patterns (e.g., churn rate by region, or by acquisition channel).

---

### Step 3: Structuring the Storage Layers

A production-grade data system needs at least three distinct storage layers. Each layer has a specific purpose and a specific level of transformation applied to the data.

#### Staging Layer (Bronze)

This is your raw landing zone. Data arrives here exactly as it came from the source systems: raw API extracts, event logs, database snapshots, CSV dumps, whatever the format.

At this layer, only the most basic cleaning happens. You might strip out completely null records or fix obviously broken timestamps, but nothing more. The goal is to preserve the original data as faithfully as possible so you always have a source of truth to go back to if something goes wrong downstream.

**Example:** Raw Stripe webhook payloads, raw Zendesk ticket exports, raw clickstream events.

#### Conformed Layer (Silver)

This is where business logic lives. Data from the staging layer gets joined, deduplicated, and transformed into standardized, well-typed tables.

For the churn system, this is where you'd:

- Join user profiles with their app usage data.
- Aggregate support tickets to a per-user level.
- Apply the 45-day churn definition to subscription records.
- Normalize NPS scores across different survey tools.
- Build intermediate tables that combine signals from multiple sources.

This layer should be well-tested and well-documented, because everything the business sees ultimately flows through it.

**Example:** A `user_subscription_history` table that combines raw subscription events with billing data and applies the grace period logic. A `user_engagement_summary` table that rolls up daily usage events into weekly or monthly engagement scores per user.

#### Consumption Layer (Gold)

This is the final layer that dashboards, APIs, and analysts query directly. It stores fully processed, aggregated data shaped around the dimensions and metrics that end users care about.

The tables here should be optimized for read performance and should map cleanly to the questions the business is asking. Think of them as the "answer tables."

**Example:** A `churn_dashboard_monthly` table with columns like `month`, `total_users`, `churned_users`, `churn_rate`, `top_churn_reasons`, segmented by plan tier and region. A `user_risk_scores` table with one row per active user, a calculated risk score, and the contributing factors.

---

### Step 4: Mastering Data Grain

This is one of the most important (and most commonly overlooked) concepts in data system design. The **data grain** refers to the level of detail each row in a table represents.

To calculate churn and retention, the final consumption layer must be built at the **user level**, meaning each row represents one unique user. But your raw source data doesn't arrive that way. Each source has its own grain:

- **Subscriptions** are at the subscription level. One subscription might cover multiple users (family plans, team plans).
- **Support tickets** are at the ticket level. One user might have zero tickets or twenty.
- **Billing records** are at the transaction level. One subscription generates many transactions over time.
- **Usage events** are at the event level. One user generates thousands of events.

The work of data engineering here is bridging that gap. You need to:

1. **Identify the grain of your final consumption layer.** In this case, it's user-level.
2. **Analyze the grain of each source table.** Understand what one row means in each source.
3. **Perform a gap analysis.** For each source, determine what aggregation or transformation is needed to go from the source grain to the target grain.

This logic gets built into your Conformed (Silver) layer. Support tickets get aggregated into a count and sentiment score per user. Billing records get summarized into payment history per user. Usage events get rolled up into engagement metrics per user. Subscriptions get mapped so that each user is associated with exactly one active subscription status.

If you get the grain wrong, you'll end up with duplicated rows, inflated metrics, or broken joins. It's one of those things that's straightforward in concept but requires careful attention in practice.

---

### Step 5: Designing the Serving Layer

Once the data is processed and sitting in the Gold layer, you need to decide how it actually reaches the people and systems that need it. The serving layer is the bridge between your data warehouse and the real world.

Different user groups from Step 1 need different access patterns:

#### BI Dashboards for Leadership

Monthly and quarterly churn dashboards built in a tool like Tableau, Looker, or Power BI. These connect directly to the Gold layer tables (or to a semantic/metrics layer sitting on top of them). Leadership wants trend lines, segmentation, and the ability to drill down from company-wide churn into churn by plan tier, region, or acquisition channel.

The key design decision here is pre-aggregation versus on-the-fly calculation. For a dataset of this nature (monthly cadence, relatively small number of dimension combinations), pre-aggregated Gold tables are usually the right call. They load faster and reduce the chance of someone accidentally writing a bad query that produces a wrong number.

#### Operational Feeds for the Retention Team

The retention team needs something closer to a live feed. They want a daily (or near-real-time) list of users who just crossed into the "at-risk" zone, along with the reasons why. This could be served through:

- A lightweight internal tool or CRM integration that pulls from a `user_risk_scores` table.
- An API endpoint that the retention team's existing workflow tools can query.
- A scheduled export (CSV or webhook) pushed into their campaign platform so they can trigger automated outreach.

The freshness requirement here is tighter. Batch processing on a daily schedule might be sufficient, but if the business wants to intervene within hours of a risk signal firing, you'll need to consider streaming or micro-batch processing.

#### Self-Serve Analytics for the Product Team

Product teams tend to ask ad hoc questions that aren't anticipated by any dashboard. They want access to the Silver layer (or a curated subset of it) so they can explore correlations, run cohort analyses, and test hypotheses.

This usually means giving them access to a query tool like Mode, Hex, or a SQL IDE connected to the warehouse, along with clear documentation on table schemas and definitions.

---

### Step 6: Planning for Monitoring and Edge Cases

A data system that works perfectly on day one but has no guardrails will eventually break silently and erode trust in the data. This step is about making the system resilient.

#### Pipeline Monitoring and Alerting

Every stage of the pipeline (ingestion, transformation, Gold layer refresh) should have automated checks. At minimum:

- **Freshness checks:** Is the data arriving on schedule? If the Bronze layer hasn't received new Stripe events in 12 hours, something is wrong.
- **Volume checks:** Did today's load have roughly the expected number of records? A sudden 90% drop in event volume probably means an upstream system broke.
- **Schema checks:** Did the source schema change? A new column is fine. A renamed or removed column will silently break downstream logic.

When checks fail, alerts should route to the responsible team via PagerDuty, Slack, or whatever incident management system is in place. Define severity levels so that a minor freshness delay doesn't wake someone up at 3 AM, but a complete pipeline failure does.

#### Data Quality and Validation

Beyond pipeline health, validate the data itself:

- Are churn rates within a plausible range? If monthly churn suddenly jumps from 3% to 40%, that's almost certainly a data bug, not a real business event.
- Are there duplicate user records in the Gold layer? Run deduplication checks as part of the transformation pipeline.
- Are null values appearing in fields that should never be null (like subscription status or user ID)?

Tools like dbt tests, Great Expectations, or even simple SQL assertions can automate these checks.

#### Handling the Grace Period Edge Case

The 45-day churn definition with a 15-day return window creates a specific edge case: a user who is mid-grace-period will have an indeterminate status. Your system needs to handle this gracefully.

One approach is to introduce a `pending_churn` status in addition to `active`, `churned`, and `retained`. Users in the grace window get marked as `pending_churn`, and a scheduled job reclassifies them once the window closes. This prevents premature counting of users as churned who may still come back.

#### Backfill and Reprocessing

When you fix a bug in your transformation logic or update a business definition (say, the grace period changes from 15 days to 30 days), you need the ability to reprocess historical data. Design your pipeline so that reprocessing is straightforward, whether that means using an idempotent transformation framework, maintaining partition-level reprocessing, or keeping a full history of raw data in the Bronze layer.

#### Access Control

Not everyone should see everything. Leadership dashboards might show aggregated numbers, but the retention team's user-level data contains PII. Make sure your Gold layer tables have appropriate access controls, and that any user-level data served through APIs or exports is handled in compliance with privacy policies (GDPR, PIPEDA, etc.).

---

## Putting It All Together

Here's a simplified view of how the full system connects:

```
Source Systems (Stripe, App Events, Zendesk, Qualtrics, Salesforce, CRM)
        │
        ▼
┌─────────────────────────┐
│   Bronze (Staging)      │  ← Raw data, minimal cleaning
│   Raw API extracts      │
│   Event logs            │
└────────────┬────────────┘
             │
             ▼
┌─────────────────────────┐
│   Silver (Conformed)    │  ← Business logic, joins, aggregation
│   user_subscription_hx  │
│   user_engagement_sum   │
│   user_support_summary  │
└────────────┬────────────┘
             │
             ▼
┌─────────────────────────┐
│   Gold (Consumption)    │  ← Final tables for dashboards and APIs
│   churn_dashboard_mth   │
│   user_risk_scores      │
│   retention_cohorts     │
└────────────┬────────────┘
             │
     ┌───────┼───────────┐
     ▼       ▼           ▼
  Tableau  Retention    SQL IDE
  / Looker  API/CRM    (Product
  (Execs)  (Ret. Team)  Team)
```

Each layer has a clear responsibility. Each consumer gets data shaped for their needs. And monitoring sits across the entire pipeline catching issues before they reach a dashboard.

---

## Key Takeaways

**Start with definitions, not tools.** The most important work in data system design happens before you write a single line of code. Nail the metric definitions, identify your users, and agree on business logic.

**Respect the grain.** Getting the data grain right is the difference between accurate metrics and silently inflated numbers. Always know what one row means in every table you touch.

**Layer your storage intentionally.** Bronze, Silver, and Gold aren't just industry jargon. They represent a genuine separation of concerns that makes your system maintainable, debuggable, and trustworthy.

**Design for your consumers.** Leadership, retention teams, and product analysts all need different things. The serving layer should reflect that, not force everyone through the same interface.

**Plan for failure from day one.** Pipelines will break. Schemas will change. Definitions will evolve. Build monitoring, validation, and reprocessing into the system from the start, not as an afterthought.

---

*This guide was developed as part of an ORU community session on data system design. For more resources on building a career in data, visit [joinoru.com](https://joinoru.com).*
