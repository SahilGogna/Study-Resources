# The Job Search System

A single Claude workflow that handles job search, resume improvement, result organization, and application tracking end to end.

Instead of scrolling LinkedIn for hours, you upload your resume once, answer three questions, and get back a filtered list of live job postings with match scores, application links, and resume feedback. Add Gmail and it becomes a full application tracker.

---

## Before You Start

You will need:

* A Claude account (free plan works, though Pro gives you more usage headroom for longer sessions)
* An Apify account (free signup at apify.com)
* Your resume as a PDF
* A Google account if you want the Sheets tracker

Total setup time is about 10 minutes.

---

## Components

### 1. Apify Connector (LinkedIn scraping)

Apify is a scraping platform. Claude uses it to pull live LinkedIn listings instead of relying on stale training data.

* Install from Claude, Customize, Connectors, Browse Connectors
* Free account and API key available at apify.com
* Pulls live LinkedIn job listings based on your role, location, and industry
* Filters results down to jobs with a match score above 50 percent

**A note on cost:** Apify gives new accounts a small amount of free monthly credit. Most job scrapers charge per result, usually a fraction of a cent per listing. A typical search of 20 to 40 jobs costs pennies and fits inside the free tier. If you run large searches daily, you may need a paid plan. Check the pricing tab on any actor before running it.

**Which scraper to use:** Claude picks this automatically, but if you want to run it directly, the reliable LinkedIn ones are `curious_coder/linkedin-jobs-scraper` and `cheap_scraper/linkedin-job-scraper`.

---

### 2. The Master Prompt

Upload your resume, then paste this into a new Claude chat:

```
I am looking for a new job and need your help finding the best matching
opportunities. I have attached my resume above. Please ask me the following:
my target job title, preferred location (city or remote), and target industry
or company type. Once I answer, use the Apify connector to search LinkedIn for
matching jobs posted in the last 14 days. Only show me jobs where my resume
match score is above 50%. For each job, give me: job title, company name,
posting date, salary range if available, direct application link, and your match
score out of 100. Then organize all results into a structured table I can copy
into Google Sheets. Finally, review my resume and give me 3 specific things to
add, 3 things to remove or tighten, and 2 tailoring tips for the roles I am
targeting.
```

**How the match score works:** The score is Claude reading your resume against the job description and judging overlap in skills, tools, seniority, and domain. It is a judgment call, not a formula, so treat it as a sorting tool rather than a verdict. A 62 percent match on a role you genuinely want is still worth applying to.

---

### 3. Google Sheets Output

Copy the structured table Claude generates into a Google Sheet. Recommended columns:

| Column | What goes in it |
|---|---|
| Job Title | Exact title from the posting |
| Company | Company name |
| Posted Date | When the job went live |
| Match Score | Claude's score out of 100 |
| Salary | Range if listed, otherwise blank |
| Application Link | Direct URL to apply |
| Status | Not Applied, Applied, Follow Up Needed, Interview Scheduled, Rejected, Offer |
| Applied Date | The day you submitted |
| Follow Up Date | Applied date plus 7 to 10 days |
| Notes | Referrals, recruiter names, custom resume version used |

**Tips that make the sheet actually useful:**

* Add conditional formatting on the Status column so Interview Scheduled turns green and Follow Up Needed turns amber
* Sort by Match Score descending, then apply top to bottom
* Set the Follow Up Date automatically with a formula: `=IF(J2="", "", J2+7)` where column J holds the Applied Date
* Keep one row per application even if you apply to the same company twice

---

### 4. Gmail Tracker (Advanced Layer)

This is the layer that turns a job list into a real system.

* Connect Gmail inside Claude, same path as Apify: Customize, Connectors, Browse Connectors
* Ask Claude to scan your inbox for replies from companies you applied to
* Claude surfaces the emails that need attention: interview invites, requests for more information, rejections, assessments
* Pair it with the Google Sheet so your tracker stays current

**Sample prompt:**

```
Check my Gmail for any responses from companies I have applied to based on
this list. Flag anything that needs a reply, a follow up, or has an interview
coming up.
```

**Other prompts worth saving:**

```
Draft a follow up email to [Company] about my application for [Role].
I applied on [date] and have not heard back.
```

```
Based on my Gmail, which applications have gone quiet for more than
two weeks? Rank them by how worth following up they are.
```

```
Summarize every interview invite in my inbox from the last 30 days with
the date, time, format, and who I am meeting.
```

**Privacy note:** Claude only reads your Gmail when you ask it to during a session. Nothing is stored between chats. You can disconnect the connector at any time from the same Connectors menu.

---

## Setup Steps

1. Open Claude.ai and go to Customize, then Connectors
2. Click the plus icon and select Browse Connectors
3. Search for Apify and install it
4. Get your free API key from apify.com and paste it in when prompted
5. Open a new chat
6. Upload your resume as a PDF
7. Paste the master prompt above
8. Answer the three questions Claude asks you
9. Copy the output table into Google Sheets
10. Optionally connect Gmail for the tracker layer

---

## Running It Weekly

The system works best as a routine rather than a one time search.

* Run the master prompt every Monday to catch fresh postings from the past week
* Change the timeframe in the prompt from 14 days to 7 days once you are running it weekly, so you are not seeing the same jobs twice
* Run the Gmail scan every Thursday to catch anything that needs a reply before the weekend
* Update your sheet the same day you apply, not later

---

## Troubleshooting

**Claude says it cannot find the Apify connector**
The connector did not install correctly. Go back to Customize, Connectors, and confirm Apify shows as connected with a valid API key.

**Searches return zero results**
Your job title may be too specific. Try a broader title (Data Analyst instead of Senior Marketing Data Analyst) or widen the location. Some smaller cities have thin listings, so try the nearest major metro.

**No salary showing for most jobs**
Normal. Salary disclosure varies by employer and region. Many Canadian and US postings still omit it.

**Match scores all look similar**
Your resume may be too generic. Run the resume feedback portion of the prompt and act on it, then rerun the search.

**Application links are broken or expired**
Job postings get pulled fast. If a link is dead, search the company name and role directly on their careers page.

---

## What You Get

* A curated LinkedIn job list, filtered by match score
* Posting dates and direct application links
* Salary ranges where available
* Three specific things to add to your resume, three to cut, and two tailoring tips for your target roles
* A live tracker to manage applications, follow ups, and interviews

---

Built and shared by Sahil Gogna
ORU, joinoru.com
