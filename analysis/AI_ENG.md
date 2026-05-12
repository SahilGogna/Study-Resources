# AI Engineering

## The Two Types of AI Engineers — Understand This First

Before you start preparing, you need to know which type of AI engineer you are actually trying to become. Most people preparing for AI roles in Canada are studying for the wrong one.

### Type 1 — Application-Level AI Engineer

This is the role that 90% of Canadian companies are hiring for. You are not building models. You are building products and pipelines on top of existing LLMs using APIs.

**Where they work:** Ecommerce companies, banks, telecom, SaaS startups, consulting firms, retail, healthcare — any company integrating AI into their products or internal workflows.

**What they actually do day to day:**

- Integrate OpenAI, Anthropic, Cohere, or Mistral APIs into applications
- Build RAG (Retrieval Augmented Generation) pipelines
- Design and optimize prompts at scale
- Build agentic workflows using LangChain, LlamaIndex, AutoGen, or CrewAI
- Work with vector databases (Pinecone, Weaviate, pgvector)
- Deploy AI features on AWS, Azure, or GCP
- Monitor and evaluate LLM outputs in production

**What you need:** Python, API integration skills, LLM frameworks, cloud basics, system design thinking. You do NOT need to understand backpropagation or train models from scratch.

### Type 2 — Model-Level AI Engineer

This is the role that most online content talks about but represents a small fraction of actual Canadian job openings.

**Where they work:** Anthropic, OpenAI, Cohere (Canadian), Hugging Face, Vector Institute, university research labs, very large tech companies with dedicated AI research teams.

**What they actually do:**

- Train and fine-tune large language models
- Work with CUDA and distributed training frameworks
- Implement and improve model architectures
- Publish research papers
- Work with massive datasets and compute clusters

**What you need:** Deep ML theory, linear algebra, calculus, statistics at a graduate level, PyTorch from scratch, CUDA, research experience. Usually requires a Masters or PhD.

**The mistake most people make:** Spending months on deep learning theory, PyTorch from scratch, and research papers — when the job they are applying to needs someone who can build a RAG pipeline and deploy an AI chatbot on Azure.

---

## Salary Data — Canada 2026

| Level | Salary Range (CAD) |
| --- | --- |
| Entry level (1–3 years) | $80,000 – $103,000 |
| Mid level (3–6 years) | $103,000 – $138,000 |
| Senior level (6+ years) | $138,000 – $187,000 |
| Toronto average | $114,000 – $149,000 |
| Top earners (90th percentile) | $187,000 – $197,000 |

Source: Glassdoor Canada, ZipRecruiter, ERI SalaryExpert — March 2026

---

## The 6-Month Roadmap (Application-Level AI Engineer)

This roadmap assumes you already know basic Python. If not, add 4 weeks of Python fundamentals before starting.

---

### Month 1 — Python for AI Applications

Not Python from scratch. Specifically the subset that matters for AI engineering work.

**What to learn:**

- Python data structures review (lists, dicts, classes)
- Working with JSON and APIs (requests library)
- Environment setup (venv, pip, .env files)
- Basic async Python (async/await) — needed for API calls
- Error handling and logging

**Free resources:**

- [Python for Everybody — Coursera](https://www.coursera.org/specializations/python) — free to audit
- [Real Python](https://realpython.com) — practical tutorials
- [FastAPI tutorial](https://fastapi.tiangolo.com/tutorial/) — building APIs in Python

**Project:** Build a simple CLI tool that calls a public API (weather, news, etc.) and formats the output.

---

### Month 2 — LLMs and Prompt Engineering

This is where the work actually starts for application-level AI engineers.

**What to learn:**

- How LLMs work at a conceptual level (tokens, context windows, temperature)
- OpenAI API basics — completions, chat completions, embeddings
- Anthropic Claude API — messages, system prompts, tool use
- Prompt engineering fundamentals — system prompts, few-shot examples, chain of thought
- Structured outputs — getting JSON from LLMs reliably
- Basic evaluation — how to test if your LLM outputs are good

**Free resources:**

- [OpenAI API documentation](https://platform.openai.com/docs)
- [Anthropic prompt engineering guide](https://docs.anthropic.com/en/docs/build-with-claude/prompt-engineering/overview)
- [Prompt Engineering Guide](https://www.promptingguide.ai) — free, comprehensive
- [DeepLearning.AI](http://DeepLearning.AI) [short courses](https://www.deeplearning.ai/short-courses/) — ChatGPT Prompt Engineering, Building Systems with the ChatGPT API (free)

**Project:** Build a CLI chatbot that maintains conversation history and responds in a specific persona using the OpenAI or Anthropic API.

---

### Month 3 — RAG Pipelines

RAG (Retrieval Augmented Generation) is the most common AI architecture used by Canadian companies right now. If you understand RAG, you are already more prepared than most candidates.

**What to learn:**

- What RAG is and why it exists (LLMs have limited context windows and no access to your private data)
- Embeddings — how text gets converted to vectors
- Vector databases — Pinecone, Weaviate, Chroma, pgvector
- Document loaders and chunking strategies
- LlamaIndex basics — building a RAG pipeline
- LangChain basics — chains, retrievers, document loaders
- Evaluation of RAG systems — relevance, faithfulness, answer quality

**Free resources:**

- [LlamaIndex documentation](https://docs.llamaindex.ai)
- [LangChain documentation](https://python.langchain.com/docs)
- [DeepLearning.AI](http://DeepLearning.AI) [— Building and Evaluating Advanced RAG](https://www.deeplearning.ai/short-courses/building-evaluating-advanced-rag/) — free
- [Pinecone learning center](https://www.pinecone.io/learn/) — free

**Project:** Build a document Q&A system. Upload a PDF, chunk it, embed it, store in a vector DB, and answer questions about it using an LLM.

---

### Month 4 — Agentic AI

This is what Canadian companies mean in 2026 when they say they want an AI engineer. Agentic AI is the ability to build systems where the LLM decides what actions to take, calls tools, and completes multi-step tasks.

**What to learn:**

- What agents are — LLMs that use tools and make decisions
- Function calling / tool use in OpenAI and Anthropic APIs
- ReAct pattern — Reason + Act loop
- LangChain agents and tools
- LlamaIndex agents
- Multi-agent frameworks — CrewAI, AutoGen basics
- Memory in agents — short term vs long term
- When NOT to use agents (they are overkill for many tasks)

**Free resources:**

- [DeepLearning.AI](http://DeepLearning.AI) [— AI Agents in LangGraph](https://www.deeplearning.ai/short-courses/ai-agents-in-langgraph/) — free
- [DeepLearning.AI](http://DeepLearning.AI) [— Multi AI Agent Systems with CrewAI](https://www.deeplearning.ai/short-courses/multi-ai-agent-systems-with-crewai/) — free
- [Anthropic tool use documentation](https://docs.anthropic.com/en/docs/build-with-claude/tool-use)

**Project:** Build an agent that can search the web, read a URL, summarize content, and answer a user question — all autonomously.

---

### Month 5 — Cloud Deployment

Building locally is one thing. Canadian employers want you to deploy and maintain AI applications in production.

**What to learn:**

- Docker basics — containerizing your Python AI app
- AWS basics for AI — Lambda, EC2, S3, Bedrock
- Azure basics for AI — Azure OpenAI Service, Azure Functions, Blob Storage
- Environment variables and secrets management
- Basic CI/CD — GitHub Actions to deploy your app
- Monitoring LLM applications in production — logging, cost tracking, latency
- LangSmith or LangFuse for LLM observability

**Free resources:**

- [AWS Free Tier](https://aws.amazon.com/free/) — practice deploying
- [Azure for Students](https://azure.microsoft.com/en-us/free/students/) — free credits
- [Docker getting started](https://docs.docker.com/get-started/)
- [GitHub Actions documentation](https://docs.github.com/en/actions)

**Project:** Deploy your RAG application or agent from Month 3–4 to AWS or Azure with a simple API endpoint. Document the architecture.

---

### Month 6 — Portfolio and Job Search

**Portfolio — what to build:**

You need 2 solid end-to-end projects on GitHub. Each should have:

- A clear README explaining what it does, why you built it, and the architecture
- A live demo if possible (Streamlit, Gradio, or a simple web UI)
- Clean code with proper documentation
- A short writeup on LinkedIn about what you learned

**Suggested portfolio projects:**

1. RAG-powered document assistant (upload any PDF, ask questions)
2. An agentic workflow that automates a real task (job scraper + summarizer, meeting notes to action items, etc.)

**Interview prep — what actually gets asked:**

- Explain RAG and when you would use it vs fine-tuning
- What is a vector database and how does similarity search work?
- How do you evaluate LLM outputs?
- How do you reduce hallucinations in a RAG system?
- Explain the difference between LangChain and LlamaIndex
- How would you design an AI system for [specific business problem]?
- What is function calling / tool use?
- How do you handle context window limits?
- Walk me through a project you built

---

## Canadian Companies Hiring Application-Level AI Engineers

### Banks and Financial Services

- RBC (AI division — Toronto)
- TD Bank (AI and Analytics — Toronto)
- Scotiabank (Digital Factory — Toronto)
- BMO (AI Centre of Excellence)
- Manulife, Sun Life — insurance AI roles

### Tech and Scale-ups

- Shopify — AI features across their platform
- Cohere — Canadian AI company (model AND application roles)
- Ada — AI customer service platform (Toronto)
- Coveo — AI search and recommendations (Quebec)
- D2L — AI in education (Waterloo)
- Verafin — AI fraud detection (acquired by Nasdaq)

### Telecom

- Telus — large AI investment, multiple roles
- Bell — AI and automation
- Rogers — digital transformation

### Consulting

- Deloitte Canada, KPMG Canada, Accenture — all have AI practices with strong hiring

---

## Where to Find AI Engineer Jobs in Canada

- LinkedIn — search "AI Engineer Canada", "LLM Engineer Canada", "Generative AI Canada"
- Wellfound — Canadian AI startups
- Government of Canada Job Bank — [jobbank.gc.ca](http://jobbank.gc.ca)
- Company career pages directly (higher response rate than LinkedIn Easy Apply)

---

### Want to Build Real Analytics Projects?

ORU's **Hands-On Data Analytics** course teaches you to think like a practitioner and execute like one — through realistic business problems across insurance, banking, fintech, and ecommerce. Tools covered include Python, SQL, BigQuery, dbt Core, Tableau, Power BI, Streamlit, and Vanna AI.

Use code **ORU10** for 10% off → [Enroll Now](https://joinoru.com/course/hands-on-data-analytics:-learn-by-building-industry-projects)

*For mentorship, live sessions, and community support: [joinoru.com](https://joinoru.com)*
