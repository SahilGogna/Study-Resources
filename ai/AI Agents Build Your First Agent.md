# AI Agents: Build Your First Agent

---

## What Are AI Agents and Why Should You Care

AI agents are not chatbots. A chatbot waits for your prompt and gives you a response. An agent takes a goal, breaks it into steps, decides which tools to use, executes those steps, evaluates the results, and course-corrects on its own.

Think of it this way: ChatGPT is like texting a smart friend. An AI agent is like hiring an intern who can actually go do things for you, open your spreadsheets, pull data from your CRM, draft emails, update your project board, and check their own work.

This is what companies are hiring for in 2026. According to Stanford's AI Index, agentic AI job postings grew 280% year over year. Gartner predicts that by the end of 2026, 40% of enterprise applications will have task-specific AI agents built in, up from less than 5% in 2025. LinkedIn ranked AI Engineer as the number one fastest growing job title in the US this year, and a big chunk of that growth is driven by companies building agent systems.

The opportunity is massive and the talent pool is still small. Most people are stuck at the prompting stage. If you learn to build agents now, you are ahead of 95% of the market.

---

## Step 1 — Understand Agent Anatomy

Every AI agent, no matter how complex, is made up of three core components.

### The Brain (Reasoning and Planning)

This is the LLM at the center of the agent. It receives the goal, thinks through how to accomplish it, and decides what to do next. The brain handles reasoning (should I search the web first or check the database?), planning (let me break this into 4 sub-tasks), and reflection (that output looks wrong, let me try a different approach).

The most commonly used brains right now are GPT-4o, Claude Sonnet/Opus, Gemini Pro, and open source options like Llama and Mistral. For most production use cases in Canadian companies, GPT-4o and Claude are the go-to choices.

### The Hands (Tool Use and Actions)

The brain alone can only think. The hands are what let the agent actually do things. Tools are functions that the agent can call: searching the web, reading a file, querying a database, sending an email, creating a calendar event, updating a Notion page.

When you hear "function calling" or "tool use" in the context of OpenAI or Anthropic APIs, this is exactly what it means. You define a set of tools with their descriptions and parameters, and the LLM decides when and how to call them.

Examples of tools an agent might use:

- Web search (Tavily, Serper, Google Search API)
- Database query (PostgreSQL, BigQuery)
- File reader (PDF, CSV, Google Docs)
- Email sender (Gmail API)
- CRM actions (Salesforce, HubSpot)
- Project management (Jira, Notion, Asana)

### The Memory (Context and Learning)

Without memory, every interaction starts from zero. The agent forgets what happened two steps ago. Memory is what lets agents maintain context across a conversation, remember past decisions, and avoid repeating mistakes.

There are two types:

**Short-term memory** is the conversation history and scratchpad the agent uses within a single task. This is usually handled by the context window of the LLM.

**Long-term memory** is stored externally, often in a vector database, so the agent can recall information across sessions. Think of it as the agent's notebook that persists even after the conversation ends.

---

## Step 2 — Learn the Design Patterns

Design patterns are the blueprints that decide how your agent thinks, acts, and improves. These are not theoretical. Google, Amazon, Salesforce, and most companies building production agents use variations of these patterns.

### Pattern 1 — ReAct (Reason + Act)

The most widely used agent pattern. The agent follows a loop: observe the current state, reason about what to do next, take an action, observe the result, and repeat until the task is done.

Example flow:

1. User asks: "What were our top 3 selling products last quarter?"
2. Agent reasons: "I need to query the sales database for Q1 2026 data"
3. Agent acts: Calls the SQL query tool
4. Agent observes: Gets the result set
5. Agent reasons: "I have the data, now I should format it clearly"
6. Agent acts: Returns a formatted answer

ReAct is great for straightforward tasks where the agent needs to gather information and take sequential actions. Most LangChain and LlamaIndex agents use ReAct by default.

### Pattern 2 — Plan and Execute

For complex tasks, the agent first creates a full plan before taking any action. Then it executes each step of the plan one by one, updating the plan if something unexpected happens.

Example flow:

1. User asks: "Research our 3 biggest competitors, compare their pricing, and draft a summary report"
2. Agent plans: Step 1 identify competitors, Step 2 search for pricing data on each, Step 3 compile into a comparison table, Step 4 write the summary
3. Agent executes each step in order
4. If Step 2 fails for one competitor (no public pricing), the agent re-plans: "I'll note that pricing is not publicly available and move on"

This pattern is more reliable for multi-step tasks because the agent has a roadmap instead of improvising at each step.

### Pattern 3 — Evaluator Optimizer

The agent does the work, then a second LLM call (or the same one in a different role) evaluates the output against quality criteria. If it does not pass, the agent revises and tries again.

Example flow:

1. Agent drafts an email based on user instructions
2. Evaluator checks: Is the tone professional? Are all the key points covered? Is it under 200 words?
3. Evaluator says: "Tone is good but the third key point is missing"
4. Agent revises the draft and resubmits
5. Evaluator approves

This is how companies like Google build self-improving AI systems. The evaluator acts as a quality gate so the output does not go out half-baked.

---

## Step 3 — Understand MCP (Model Context Protocol)

MCP is one of the most important developments in the agent ecosystem and most people have not heard of it yet.

### The Problem MCP Solves

Before MCP, if you wanted your agent to connect to Notion, you had to build a custom Notion integration. Want to add Google Drive? Build another custom integration. Salesforce? Another one. Every tool needed its own connector, and every connector needed maintenance.

MCP is an open standard (created by Anthropic) that acts like a universal adapter. Instead of building 50 custom integrations, you build one MCP client and it can connect to any tool that has an MCP server.

Think of it like USB-C for AI agents. Before USB-C, every phone had a different charger. MCP does the same thing for AI tool connections.

### How MCP Works

The architecture has three parts:

**MCP Host** is the application that wants AI capabilities (your agent, Claude Desktop, an IDE like Cursor).

**MCP Client** sits inside the host and manages the connection to servers. It handles the protocol, authentication, and message routing.

**MCP Server** is a lightweight program that exposes specific tools and data sources. There are MCP servers for Notion, Google Drive, Slack, GitHub, PostgreSQL, Salesforce, and hundreds more.

When your agent needs to read a Notion page, the flow is: Agent tells the MCP Client "I need to fetch this Notion page" then the Client routes the request to the Notion MCP Server then the Server authenticates, fetches the data, and returns it through the Client back to the Agent.

### Why MCP Matters for Your Career

Companies are adopting MCP fast because it dramatically reduces the engineering effort to connect AI systems to their existing tools. If you understand MCP, you can build agents that plug into an enterprise's entire tool stack without writing custom API integrations for each one. That makes you extremely valuable.

---

## Step 4 — Build Your First Agent (Hands-On with n8n)

n8n is a workflow automation tool that lets you build AI agents visually, without writing code. It is open source, self-hostable, and has become one of the most popular platforms for building production-grade agent workflows.

### Why n8n for Your First Agent

- Visual builder, so you can see your agent's logic as a flowchart
- 400+ pre-built integrations (Google Sheets, Slack, Gmail, Notion, databases)
- Built-in AI nodes for OpenAI, Anthropic, and other LLM providers
- You can self-host it for free on a VPS
- Used by real companies in production, not just a learning toy

### A Simple Agent You Can Build Today

Here is a practical agent you can build in n8n in about 2 hours:

**Job Application Tracker Agent**

Trigger: You forward a job posting email to a specific address

Agent flow:

1. Email arrives, n8n extracts the content
2. LLM node parses the job posting: company name, role, salary range, key requirements, application deadline
3. Agent checks your Google Sheet tracker for duplicates
4. If new, agent adds a row with all parsed details
5. Agent compares the job requirements against your skills profile (stored in another sheet)
6. Agent sends you a Slack message: "New role at Shopify. 4 out of 6 requirements match. Weak areas: Kubernetes, Terraform. Applied deadline: June 30."

This agent uses the Brain (LLM parsing and reasoning), Hands (email, Google Sheets, Slack integrations), and Memory (your skills profile sheet).

### Other Agent Ideas to Build

- **Meeting notes agent**: Listens to a calendar event, joins the call transcript, summarizes key points, creates action items in Notion
- **Content research agent**: Takes a topic, searches the web for recent articles and stats, compiles a research brief in Google Docs
- **Customer support triage agent**: Reads incoming support tickets, categorizes them by urgency and topic, routes to the right team channel in Slack
- **Resume tailoring agent**: Takes a job posting URL and your master resume, highlights gaps, suggests edits, and outputs a tailored version

---

## Free Resources to Go Deeper

### Courses (All Free)

- [DeepLearning.AI](http://DeepLearning.AI) [— AI Agents in LangGraph](https://www.deeplearning.ai/short-courses/ai-agents-in-langgraph/) — best starting point for code-based agents
- [DeepLearning.AI](http://DeepLearning.AI) [— Multi AI Agent Systems with CrewAI](https://www.deeplearning.ai/short-courses/multi-ai-agent-systems-with-crewai/) — multi-agent orchestration
- [DeepLearning.AI](http://DeepLearning.AI) [— Functions, Tools and Agents with LangChain](https://www.deeplearning.ai/short-courses/functions-tools-agents-langchain/) — function calling deep dive
- [n8n AI Agent tutorials on YouTube](https://www.youtube.com/@n8n-io) — visual agent building

### Documentation

- [Anthropic MCP Documentation](https://modelcontextprotocol.io) — the official MCP spec and guides
- [OpenAI Function Calling docs](https://platform.openai.com/docs/guides/function-calling) — tool use with GPT models
- [Anthropic Tool Use docs](https://docs.anthropic.com/en/docs/build-with-claude/tool-use) — tool use with Claude
- [LangChain Agents docs](https://python.langchain.com/docs/concepts/agents/) — building agents in Python
- [n8n documentation](https://docs.n8n.io) — workflow and AI agent setup

### Tools to Experiment With

- **n8n** (free, self-hosted) — visual agent builder
- **LangChain / LangGraph** (free, Python) — code-based agent framework
- **CrewAI** (free, Python) — multi-agent orchestration
- **Claude Desktop with MCP** (free) — test MCP servers locally

---

## Canadian Companies Hiring for Agentic AI Roles

### Banks and Financial Services

- RBC — AI agent systems for internal operations and customer experience (Toronto)
- TD Bank — Intelligent automation and AI workflows (Toronto)
- Scotiabank — Digital Factory AI team (Toronto)
- Manulife — AI powered claims processing and customer service agents

### Tech and Scale-ups

- Shopify — AI agents for merchant tools and support automation
- Cohere — Canadian AI company building enterprise agent infrastructure
- Ada — AI customer service agents (Toronto, one of the biggest in this space)
- Coveo — AI search and recommendation agents (Quebec)
- D2L — AI agents in education technology (Waterloo)

### Consulting and Enterprise

- Deloitte Canada — Building agent systems for enterprise clients
- KPMG Canada — AI automation and advisory
- Accenture Canada — Applied AI and intelligent automation practice
- Telus — AI agent projects across telecom operations

### What to Search on Job Boards

Search terms that surface agentic AI roles in Canada: "AI Engineer", "LLM Engineer", "Generative AI Developer", "AI Agent Developer", "Applied AI Engineer", "Automation Engineer AI", "AI Solutions Architect"

---

## Salary Data — Canada 2026

| Role / Level | Salary Range (CAD) |
| --- | --- |
| AI Engineer (Entry, 1 to 3 years) | $85,000 – $110,000 |
| AI Engineer (Mid, 3 to 6 years) | $110,000 – $150,000 |
| AI Engineer (Senior, 6+ years) | $150,000 – $200,000 |
| AI Agent Architect | $160,000 – $220,000 |
| Toronto average (AI Engineer) | $114,000 – $149,000 |

Source: Glassdoor Canada, LinkedIn Salary Insights, ZipRecruiter — 2026 estimates

---

### Want to Build Real Analytics Projects?

ORU's **Hands-On Data Analytics** course teaches you to think like a practitioner and execute like one — through realistic business problems across insurance, banking, fintech, and ecommerce. Tools covered include Python, SQL, BigQuery, dbt Core, Tableau, Power BI, Streamlit, and Vanna AI.

Use code **ORU10** for 10% off → [Enroll Now](https://joinoru.com/course/hands-on-data-analytics:-learn-by-building-industry-projects)

*Resource compiled by Sahil Gogna — Co-founder, ORU ([joinoru.com](http://joinoru.com))*

*For mentorship, live sessions, and community support: [joinoru.com](http://joinoru.com)*