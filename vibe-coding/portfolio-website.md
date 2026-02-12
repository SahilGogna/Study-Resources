# Vibe Code Your Portfolio Website & Deploy It Live — In Under 30 Minutes

**Part 3 of the Vibe Coding Series**

No coding experience needed. By the end of this guide, you'll have a **live, professional portfolio website** — built entirely through vibe coding using Google Antigravity IDE and deployed on Netlify.

---

## What You'll Need (Before You Start)

- A **LinkedIn account** (with an updated profile)
- A **GitHub account** → [Sign up here](https://github.com)
- A **Netlify account** → [Sign up here](https://netlify.com) (free tier works)
- **Claude** or **ChatGPT** (free tier works) → [claude.ai](https://claude.ai)
- **Google Antigravity IDE** (free) → [Download here](https://antigravity.google)
- 30 minutes of your time 

---

## Step-by-Step Guide

### Step 1 — Download Your LinkedIn Profile as a PDF

Your LinkedIn profile is essentially your digital resume. We'll use it as the content source for your portfolio — so you don't have to write anything from scratch.

1. Go to [linkedin.com](https://linkedin.com) and open your profile
2. Click on the **"More"** button (below your banner)
3. Select **"Save to PDF"**
4. Save the downloaded PDF somewhere easy to find

> **Tip:** Before downloading, make sure your LinkedIn profile is up to date — headline, summary, experience, skills, and projects. The better your LinkedIn, the better your portfolio content will be.

---

### Step 2 — Find Design Inspiration on Dribbble

We're not designing from scratch — we're going to show the AI what kind of look and feel we want.

1. Go to [dribbble.com](https://dribbble.com)
2. Search for **"portfolio website"** or **"developer portfolio"** or **"personal website"**
3. Find **1-3 designs** that match the vibe you want
4. Take a **screenshot** of each design you like
5. Save the screenshots alongside your LinkedIn PDF

> **Tip:** Don't overthink this. Pick designs that catch your eye within 5 minutes. Focus on layout, colour scheme, and overall feel — not the exact content.

---

### Step 3 — Generate a Product Requirements Document (PRD)

Before we start vibe coding, we need to give the AI a clear blueprint of what to build. Open [claude.ai](https://claude.ai) or [chatgpt.com](https://chatgpt.com) and use the following prompt:

#### PRD Prompt

```
I want to create a personal portfolio website. I'm going to give you:

1. My LinkedIn profile (as a PDF) — use this to extract my name, headline, summary, work experience, education, skills, projects, and any other relevant information.
2. Design inspiration screenshots — use these to understand the visual style, layout, and overall aesthetic I'm going for.

Based on these inputs, create a detailed Product Requirements Document (PRD) for my portfolio website that includes:

## Site Overview
- Purpose and goals of the portfolio
- Target audience (recruiters, hiring managers, potential clients/collaborators)

## Pages & Sections
For each page/section, describe:
- What content goes there (pull directly from my LinkedIn)
- Layout and structure
- Any interactive elements or animations

Recommended sections:
- Hero / Landing section (name, headline, short intro, CTA)
- About Me (detailed summary, what I bring to the table)
- Experience / Work History (timeline or card-based layout)
- Projects / Work (showcase key projects with descriptions)
- Skills / Tech Stack (visual representation)
- Education & Certifications
- Testimonials / Recommendations (if available on LinkedIn)
- Contact section (with a contact form or links)
- Footer (social links, copyright)

## Design & Style Guidelines
Based on the design inspiration screenshots, define:
- Colour palette (primary, secondary, accent colours — provide hex codes)
- Typography recommendations (font pairings)
- Overall visual style (minimal, bold, playful, corporate, etc.)
- Light/Dark mode preference
- Spacing and layout principles
- Animation and micro-interaction suggestions

## Technical Requirements
- Must be a single-page application (SPA) OR multi-page — recommend the best approach
- Fully responsive (mobile, tablet, desktop)
- Fast loading and performance optimized
- SEO-friendly (meta tags, Open Graph tags, semantic HTML)
- Accessible (WCAG 2.1 compliant)
- Smooth scroll navigation
- Contact form (functional or linked to email)

## Content Strategy
- Tone of voice for all copy (based on my LinkedIn writing style)
- CTA strategy (what action should visitors take?)
- Content hierarchy and information flow

Please make the PRD detailed enough that a developer (or AI coding tool) can build the entire website from it without needing any additional clarification.
```

**After pasting the prompt:**
1. Attach your **LinkedIn PDF**
2. Attach your **design inspiration screenshots**
3. Hit send and let the AI generate your PRD
4. **Copy the entire PRD** or **download it** — you'll need this in the next steps

---

### Step 4 — Download & Install Google Antigravity

Antigravity is Google's free, agent-first IDE — perfect for vibe coding. It's built on VS Code so it'll feel familiar, but it's supercharged with AI agents that can build your entire project.

1. Go to [antigravity.google](https://antigravity.google)
2. Download the version for your operating system (Mac / Windows / Linux)
3. Install and launch it
4. Sign in with your **Google account**
5. During setup, choose **"Agent-First"** mode (recommended)
6. Pick your theme (dark mode recommended )

---

### Step 5 — Connect Your GitHub to Antigravity

We need GitHub connected so we can push your portfolio code to a repository later (which Netlify will use to deploy your site).

1. Open Antigravity
2. Open the **Command Palette** → `Cmd + Shift + P` (Mac) or `Ctrl + Shift + P` (Windows)
3. Type **"Git: Clone"** or go to **Source Control** in the sidebar
4. Sign in to your **GitHub account** when prompted
5. Create a **new repository** named something like `my-portfolio` or `portfolio-website`
6. Clone it into a local folder

> **Tip:** If you've never used Git before, don't worry — Antigravity handles most of the heavy lifting. Just make sure you're signed into GitHub.

---

### Step 6 — Vibe Code Your Portfolio

This is where the magic happens. We're going to feed the AI everything it needs and let it build your portfolio.

**Important:** In Antigravity, select **Claude Opus 4.6** as your model for the best results.

To change the model:
1. Look at the model selector in the agent/chat panel
2. Switch from the default (Gemini) to **Claude Opus 4.6**
3. Confirm the selection

Now, create a **new agent task** and use this prompt:

#### Vibe Coding Prompt

```
You are building a personal portfolio website for me. I have placed all the reference materials in the `context/` folder of this project. Please read them before starting:

1. **Product Requirements Document (PRD)** — located in `context/prd/`. This contains everything about the site — pages, sections, content, design guidelines, and technical specs. Follow it precisely.
2. **My LinkedIn Profile (PDF)** — located in `context/prd/`. Use this as the single source of truth for all personal content — name, bio, work experience, projects, skills, education, etc.
3. **Design Inspiration Screenshots** — located in `context/inspo/`. Match the visual style, layout patterns, and aesthetic feel from these references as closely as possible.

## Your Task

Build a complete, production-ready portfolio website following these rules:

### Tech Stack
- **HTML5, CSS3, JavaScript** (vanilla — no frameworks needed, keep it simple and deployable anywhere)
- OR if the PRD suggests React/Next.js, follow the PRD's recommendation
- Use **modern CSS** (CSS Grid, Flexbox, CSS variables for theming)
- Keep it lightweight — no unnecessary dependencies

### Design Execution
- Implement the exact colour palette, typography, and spacing from the PRD
- Add smooth scroll navigation between sections
- Include subtle animations and micro-interactions (fade-ins, hover effects, scroll reveals)
- Ensure dark/light mode toggle if specified in the PRD
- Make it fully responsive — mobile-first approach

### Content
- Pull ALL text content directly from my LinkedIn PDF
- Write the content in a natural, engaging tone — don't just copy-paste bullet points
- Rewrite experience descriptions into compelling narratives
- Create a strong hero section headline and subtext

### Sections to Build (as per PRD)
- Hero section with name, role, and CTA
- About Me
- Work Experience (timeline or cards)
- Projects showcase
- Skills / Tech Stack (visual tags or progress indicators)
- Education
- Contact section with a working form (use Formspree or mailto: fallback)
- Footer with social media links

### Technical Requirements
- SEO meta tags and Open Graph tags
- Semantic HTML throughout
- Optimized for performance (lazy loading images, minified assets)
- WCAG 2.1 accessibility compliance
- Clean, well-organized file structure
- Add meaningful comments in the code

### File Structure
Create a clean, organized project:
```
/portfolio-website
├── index.html
├── css/
│   └── style.css
├── js/
│   └── main.js
├── assets/
│   └── images/
├── README.md
└── .gitignore
```

Build the entire site now. Start with the HTML structure, then CSS styling, then JavaScript interactions. Make it look professional and polished — this is going on my live portfolio.
```

**Before pasting the prompt, set up your context folder:**

Inside your cloned project folder, create the following structure:

```
/my-portfolio
├── context/
│   ├── inspo/          ← Put all your Dribbble design inspiration screenshots here
│   │   ├── inspo1.png
│   │   ├── inspo2.png
│   │   └── inspo3.png
│   └── prd/            ← Put your PRD and LinkedIn PDF here
│       ├── prd.md (or prd.txt / prd.pdf)
│       └── linkedin-profile.pdf
```

1. In your project root, create a **`context`** folder
2. Inside `context`, create two subfolders: **`inspo`** and **`prd`**
3. Move all your **Dribbble design inspiration screenshots** into the `context/inspo/` folder
4. Move your **PRD** (from Step 3) and **LinkedIn PDF** (from Step 1) into the `context/prd/` folder
5. Now paste the prompt above into the Antigravity agent chat — it will automatically pick up the files from the `context/` folder as project context
6. Hit send and watch the AI build your portfolio 

> **Tip:** By keeping your reference files inside the project, Antigravity can read them directly as context — no need to manually attach anything. Once the initial build is done, you can iterate! Ask the agent to tweak colours, adjust spacing, change animations, or add new sections. This is vibe coding — have a conversation with the AI until it looks exactly how you want.

---

### Step 7 — Push Your Code to GitHub

Once you're happy with your portfolio, it's time to push everything to GitHub. The easiest way? Just ask Antigravity to do it for you.

**The Vibe Way (Recommended) — Let Antigravity Handle It:**

Simply type this into the Antigravity agent chat:

```
Create a new GitHub repository called "portfolio-website", commit all my code, and push it to the remote repo.
```

That's it. Antigravity can create the remote repository on GitHub, initialize git, commit all your files, and push everything — all without you touching the terminal or Source Control panel.

**The Manual Way (Optional):**

If you prefer to do it yourself:

1. Go to **Source Control** in the left sidebar (or press `Cmd/Ctrl + Shift + G`)
2. You'll see all your new files listed as changes
3. Click the **"+"** button to stage all changes
4. Type a commit message: `Initial portfolio website build`
5. Click the **checkmark (✓)** to commit
6. Click **"Sync Changes"** or **"Push"** to push to GitHub

> **Tip:** Go to your GitHub repository in the browser and verify all your files are there before moving to the next step.

---

### Step 8 — Deploy on Netlify (Go Live! )

The final step — making your portfolio live on the internet.

1. Go to [app.netlify.com](https://app.netlify.com)
2. Click **"Add new site"** → **"Import an existing project"**
3. Select **"Deploy with GitHub"**
4. Authorize Netlify to access your GitHub account (if not already)
5. Select your **portfolio repository** (`my-portfolio` or whatever you named it)
6. Configure the build settings:
   - **Branch to deploy:** `main`
   - **Build command:** Leave blank (for vanilla HTML/CSS/JS) or `npm run build` (if using a framework)
   - **Publish directory:** `.` or `/` (for vanilla) or `dist` / `build` (if using a framework)
7. Click **"Deploy"**
8. Wait 1-2 minutes... and your site is LIVE! 🚀

Netlify will give you a URL like `https://random-name-12345.netlify.app`

**To set up a custom domain (optional):**
1. Go to **Site settings** → **Domain management**
2. Click **"Add custom domain"**
3. Follow the DNS configuration instructions

> **Tip:** Every time you push new changes to GitHub, Netlify will automatically redeploy your site. So you can keep iterating on your portfolio and it'll update automatically.

---

## What You Just Built

In under 30 minutes, you:

- Turned your LinkedIn profile into a structured PRD
- Vibe coded a complete portfolio website using AI
- Deployed it live on the internet
- Set up automatic deployments via GitHub

**No coding experience required. No excuses left.** 

---

## Troubleshooting

| Issue | Fix |
|---|---|
| Antigravity not connecting to GitHub | Go to Settings → Accounts and re-authenticate |
| Netlify build failing | Check if your publish directory is correct (`.` for vanilla projects) |
| Site looks broken on mobile | Ask the AI agent to fix responsive design — paste a screenshot of the issue |
| Contact form not working | Make sure Formspree is set up or switch to a `mailto:` link |
| Want to change something later | Just edit in Antigravity, commit, push — Netlify auto-deploys |

---

*Built with vibes, not stress. *
