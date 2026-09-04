# Claude Skills Pack for Job Seekers

**Everything on this page is free and open source.** These are public GitHub repos. We found them, tested them, and put them in the right order. Links are direct so you can read the source before you install anything.

---

## Start here: two commands, about a minute

Everything on this page comes from four public repos. Star counts checked 28 Aug 2026.

**Command 1 — career-ops.** The big one. [github.com/santifer/career-ops](https://github.com/santifer/career-ops), **69,085 stars**, 13,051 forks, updated daily.

```bash
npx @santifer/career-ops init
```

Then `cd career-ops` and open Claude Code in that folder. It also runs on Codex, OpenCode, Qwen, Grok and Antigravity.

**Command 2 — ResumeSkills.** 22 specialist skills. [github.com/Paramchoudhary/ResumeSkills](https://github.com/Paramchoudhary/ResumeSkills), **1,965 stars**.

```bash
npx skills add Paramchoudhary/ResumeSkills -g -y
```

The `-g` installs globally so they work in every project, `-y` skips the prompts. Works with Claude Code, Cursor, Windsurf, Gemini CLI and 30+ other agents.

**Then restart Claude Code** so it picks up the new skills. To check it worked, ask Claude: *"which skills do you have available?"*

Both are free and open source. You pay only for the AI tokens you were already paying for.

---

## What a skill actually is

A **connector** gives Claude access to a tool. Gmail, Drive, Notion.

A **skill** gives Claude a method. It is a folder with a `SKILL.md` file inside it, containing instructions Claude loads when the task matches. Install once, get the same quality every time, instead of writing a long prompt from memory on every application.

You can read any of these files yourself before installing. They are plain markdown. [Here is the resume-ats-optimizer one](https://github.com/Paramchoudhary/ResumeSkills/blob/main/skills/resume-ats-optimizer/SKILL.md).

---

## The five, in the order you run them

### 1. career-ops — decide whether to apply at all

[github.com/santifer/career-ops](https://github.com/santifer/career-ops) · 69,085 stars

**Run first, always.** Paste the job URL or description. It evaluates the posting into a structured report with a 1 to 5 score, tells you where your gaps are, and logs it in a tracker.

**Why this matters more than the resume stuff:** applying to 50 jobs is not a strategy, it is just exhaustion. This tells you which 10 deserve real effort. Everything else on this page is wasted if you aim it at the wrong postings.

Useful commands once it is installed:

| Command | What it does |
| --- | --- |
| `/career-ops {paste JD}` | Full pipeline: evaluate, PDF, tracker entry |
| `/career-ops scan` | Finds new roles across 100+ pre-configured companies |
| `/career-ops pdf` | ATS-optimized CV tailored to that job |
| `/career-ops cover` | Cover letter, keyword-mirrored |
| `/career-ops tracker` | Your pipeline status |
| `/career-ops contacto` | Finds the hiring manager, drafts the outreach |

**If you only do one thing from this page, do this one.**

If you prefer a single standalone skill instead of the whole framework, `job-description-analyzer` in the ResumeSkills pack does the gap analysis on its own.

---

### 2. resume-ats-optimizer

[Read the source](https://github.com/Paramchoudhary/ResumeSkills/tree/main/skills/resume-ats-optimizer)

Optimizes your resume for Applicant Tracking Systems. Checks ATS compatibility and analyzes keyword match against the posting.

**What good output looks like:**

> Before: Built dashboards using Power BI
> 

> After: Built a Power BI dashboard that cut monthly reporting time from 8 hours to 40 minutes for a 12 person team
> 

**The rule:** read every changed line. If a claim is not true, delete it. The skill does not know what you actually did.

---

### 3. cover-letter-generator

[Read the source](https://github.com/Paramchoudhary/ResumeSkills/tree/main/skills/cover-letter-generator)

A tailored letter per application, written from your background and the target role. Not a template with the company name swapped.

**Ask it for under 250 words.** Long cover letters do not get read.

---

### 4. interview-prep-generator

[Read the source](https://github.com/Paramchoudhary/ResumeSkills/tree/main/skills/interview-prep-generator)

The most under-used of the five. Builds STAR narratives from your own experience, predicts likely questions, and produces talking points.

**When to run it:** the night before. Not the morning of.

**What to ask for on top:** three questions to ask them. Having good questions is the cheapest way to be memorable.

---

### 5. docx (Anthropic official)

[github.com/anthropics/skills](https://github.com/anthropics/skills)

**This one is not in the repo above.** It is Anthropic's own, and installs separately.

Without it, Claude gives you text in a chat window and you reformat by hand. With it, Claude produces an actual Word file you can submit.

Small, unglamorous, saves ten minutes every single time. Also worth grabbing from the same official pack: **pdf**, **xlsx** if you are in an analyst track, **pptx** if your interviews include case presentations.

---

## The whole loop on one application

| Step | Skill | Time |
| --- | --- | --- |
| 1 | job-description-analyzer | 1 min |
| 2 | resume-ats-optimizer | 2 min |
| 3 | cover-letter-generator | 1 min |
| 4 | docx to export both | 30 sec |
| 5 | Review everything yourself | 2 min |
|  | **Total** | **About 6 minutes** |

Run interview-prep-generator separately, only when you get the interview.

---

## The other 17 in the same repo

You already installed these with the same command. Worth knowing they are there.

| Skill | What it is for |
| --- | --- |
| resume-tailor | Adapt your resume per opportunity while keeping it truthful |
| salary-negotiation-prep | Compensation benchmarks, negotiation strategy, counter-offer language |
| linkedin-profile-optimizer | Align your profile with your resume, improve recruiter search visibility |
| tech-resume-optimizer | Engineering and data specific resume pass |
| resume-quantifier | Turn vague bullets into numbers |
| resume-bullet-writer | Write individual bullets that carry a result |
| career-changer-translator | Reframe experience from another industry into tech language |
| cold-email-writer | Outreach to recruiters and second degree connections |
| application-form-filler | The repetitive fields on every portal |
| offer-comparison-analyzer | Compare two offers properly, not just base salary |
| reference-list-builder | Build and format your reference list |
| portfolio-case-study-writer | Turn a project into a case study recruiters read |
| resume-formatter | Clean formatting that survives parsing |
| resume-section-builder | Build a missing section from scratch |
| resume-version-manager | Keep track of which version went where |
| executive-resume-writer | Senior and leadership roles |
| academic-cv-builder | Academic CV format, different rules entirely |

---

## Other real repos worth a look

All public, all free. Star counts as of Aug 2026.

| Repo | Stars | What it adds |
| --- | --- | --- |
| [MadsLorentzen/ai-job-search](https://github.com/MadsLorentzen/ai-job-search) | **37,680** | Runs entirely on your own machine. Fork it and own it. Best pick if you do not want your CV data leaving your laptop |
| [sergebulaev/linkedin-skills](https://github.com/sergebulaev/linkedin-skills) | 609 | 11 LinkedIn skills: post writer, profile optimizer, comment drafter, content planner |
| [varunr89/resume-tailoring-skill](https://github.com/varunr89/resume-tailoring-skill) | 708 | Deeper tailoring workflow, handles applying to several jobs at once |
| [Ssupercoder/Salary-Negotiation-Skill](https://github.com/Ssupercoder/Salary-Negotiation-Skill) | 566 | Dedicated salary negotiation coaching |
| [yanliudesign/offer-toolkit-skill](https://github.com/yanliudesign/offer-toolkit-skill) | 339 | Job search, JD analysis, resume, offer compare, salary negotiation |
| [spontaneousai/job-hunt-copilot](https://github.com/spontaneousai/job-hunt-copilot) | 220 | Single skill covering the whole hunt end to end |
| [anthropics/skills](https://github.com/anthropics/skills) | 172k | Official. docx, pdf, xlsx, pptx, plus skill-creator to write your own |

---

## Three honest limits

**These do not apply for you.** They remove the boring part so you can spend the time on research, referrals, and networking, which is where jobs actually come from in Canada.

**Every claim is still yours.** If the optimizer writes something you did not do, and you send it, that is on you and it will come apart in the interview.

**Do not send the same optimised resume everywhere.** That defeats the entire point. The value is per-posting tailoring.

**One more, on trust:** apart from docx, these are community repos, not Anthropic products. Read the `SKILL.md` before you install it. They are short and in plain English. That habit is worth more than any single skill on this page.

**On star counts:** they tell you a repo is popular, not that it is safe or correct. They are a starting filter, not a guarantee. Same rule applies: read the file.

---

If you want your resume and interview prep reviewed by people already working at Canadian companies, check out ORU at [joinoru.com](http://joinoru.com).