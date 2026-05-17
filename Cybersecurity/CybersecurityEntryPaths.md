# Cybersecurity 3 Entry Paths

---

## Why Cybersecurity in Canada Right Now

Canada has one of the largest cybersecurity talent gaps in the G7. Over 25,000 cybersecurity positions remain unfilled annually. Entry-level roles start at $75,000 to $95,000 CAD. Mid-level roles average $110,000 to $140,000 CAD. Most roles do not require a CS degree — certifications and hands-on skills carry equal or more weight.

---

## Path 1 — SOC Analyst (Security Operations Center)

### What It Is

A SOC Analyst monitors an organization's networks and systems for security threats, investigates alerts, and responds to incidents. This is the most available entry-level cybersecurity role in Canada and the best starting point for most people.

### What the Job Actually Looks Like Day to Day

You sit in front of a SIEM dashboard (Splunk, Microsoft Sentinel, or CrowdStrike) monitoring alerts in real time. When something suspicious triggers — an unusual login, a large file transfer, a flagged IP — you investigate. You determine if it is a real threat or a false positive. If real, you escalate or contain it. You write incident reports. You tune alert rules to reduce noise.

### Why It Is the Best Entry Path

It is the most hiring-volume path in Canada. Canadian banks, telecom companies, government agencies, and enterprises all have SOC teams. It does not require deep coding skills. It teaches you how attacks work from the defense side, which builds your foundation for every other cybersecurity path.

### Certifications in Order

Step 1: CompTIA Security+ — the most recognized entry-level security cert in Canada. Required or preferred in 60%+ of Canadian entry-level postings. Cost around $400 CAD. Study time 2 to 3 months. Free prep at [professormesser.com](http://professormesser.com).

Step 2: CompTIA CySA+ — the natural next step after Security+. Focuses specifically on threat detection, analysis, and response. Cost around $450 CAD.

Step 3 (optional, for senior SOC roles): GIAC Security Essentials (GSEC) or GCIA for deeper analyst skills.

### Tools to Learn

Splunk (free training at [splunk.com/en_us/training/free-courses](http://splunk.com/en_us/training/free-courses)), Microsoft Sentinel, CrowdStrike Falcon basics, Wireshark for packet analysis, basic Linux command line.

### Realistic Timeline to First Job

Month 1 to 2: Security+ exam prep and study. Month 2 to 3: TryHackMe SOC Level 1 path (free). Month 3 to 4: Pass Security+ and start applying. Month 4 to 6: First job offer realistic.

### Salary Range in Canada

Entry level: $70,000 to $90,000 CAD. Mid level (3 to 5 years): $95,000 to $125,000 CAD. Senior: $125,000 to $155,000 CAD.

### Canadian Companies Actively Hiring SOC Analysts

RBC, TD, Scotiabank, BMO — all have large internal SOC teams. Telus, Bell, Rogers — telecom companies with significant security operations. Government of Canada, CSE (Communications Security Establishment), CRA. CGI Group, Accenture, Deloitte — consulting firms with managed security practices. eSentire, Arctic Wolf, Herjavec Group — Canadian-founded cybersecurity firms that primarily hire SOC analysts.

---

## Path 2 — Cloud Security

### What It Is

Cloud Security engineers protect an organization's cloud infrastructure — their AWS, Azure, or GCP environment. They configure security controls, monitor for misconfigurations, manage identity and access, and ensure compliance with regulatory requirements. This is the fastest growing cybersecurity specialization in Canada.

### What the Job Actually Looks Like Day to Day

You review cloud configurations to find security gaps — open S3 buckets, over-privileged IAM roles, exposed APIs. You implement guardrails using cloud-native tools like AWS Security Hub, Microsoft Defender for Cloud, or Prisma Cloud. You work closely with DevOps and engineering teams to build security into the development process (DevSecOps). You respond to cloud-specific incidents. You build and maintain least-privilege access policies.

### Why It Is the Fastest Growing Path

Every Canadian company is migrating to cloud. As they move, they need people who can secure that infrastructure. The supply of cloud security professionals is far below demand. RBC, Scotiabank, Telus, and most large Canadian enterprises are either on Azure or AWS — creating massive demand for people who can secure those environments specifically.

### Certifications in Order

Step 1: CompTIA Security+ — same foundation as SOC path. If you already have this, skip ahead.

Step 2 (pick based on your target company's cloud):

For Azure-heavy companies (Canadian banks, government): Microsoft SC-900 (Security Fundamentals, free exam) then SC-200 (Security Operations Analyst). Cost around $165 to $250 CAD each.

For AWS-heavy companies (tech companies, startups): AWS Security Specialty. Requires some AWS experience first. Consider AWS Cloud Practitioner then Solutions Architect Associate before this. Cost around $400 CAD.

Step 3 (for senior roles): CCSP (Certified Cloud Security Professional) — widely respected, vendor-neutral cloud security cert.

### Tools to Learn

Azure Security Center and Defender for Cloud (free with Azure account), AWS Security Hub and GuardDuty (free tier available), Terraform basics for infrastructure as code, basic Python scripting for automation, Kubernetes security concepts.

### Realistic Timeline to First Job

Month 1 to 2: Security+ or cloud fundamentals cert. Month 2 to 4: SC-200 or AWS Security Specialty prep. Month 3 to 5: Build a home lab — deploy a vulnerable cloud environment and practice securing it. Month 4 to 6: First job offer realistic for junior cloud security roles.

### Salary Range in Canada

Entry level: $85,000 to $105,000 CAD. Mid level: $110,000 to $140,000 CAD. Senior: $140,000 to $180,000 CAD.

### Canadian Companies Actively Hiring Cloud Security Engineers

RBC (Azure-heavy, large cloud security team), Scotiabank Digital Factory (GCP and Azure), TD Bank, Bell (Azure), Telus (AWS and Azure). Shopify, Lightspeed, Cohere — tech companies on AWS. Deloitte, KPMG, Accenture — consulting firms building cloud security practices for clients.

---

## Path 3 — Penetration Testing (Ethical Hacking)

### What It Is

A penetration tester (pen tester) is hired by companies to attack their own systems — finding vulnerabilities before malicious actors do. You simulate real attacks against networks, web applications, cloud environments, and physical security controls. This is the highest paid and most competitive cybersecurity path.

### What the Job Actually Looks Like Day to Day

You receive a scope of work defining what you are allowed to test. You perform reconnaissance — gathering information about the target. You identify and exploit vulnerabilities. You escalate privileges and move laterally through the network. You document everything. You write a detailed report explaining what you found, the potential impact, and how to fix it. You present findings to technical and executive audiences.

### Why It Is High Ceiling but Competitive

Pen testers are among the highest paid people in cybersecurity. Senior pen testers at Canadian consulting firms earn $130,000 to $180,000 CAD. But the bar to entry is higher — you need demonstrable hands-on skills, not just certifications. A strong portfolio of CTF (Capture the Flag) writeups and HackTheBox or TryHackMe achievements matters more here than in other paths.

### Certifications in Order

Step 1: CompTIA Security+ — foundation.

Step 2: CEH (Certified Ethical Hacker) — intermediate. Covers the methodology and tools of ethical hacking. Widely recognized by Canadian employers. Cost around $600 CAD.

Step 3: OSCP (Offensive Security Certified Professional) — the gold standard for pen testing. Practical exam where you must compromise several machines in 24 hours. Extremely respected in the industry. Cost around $1,700 CAD. This certification alone can get you hired at most Canadian security firms.

### Tools to Learn

Kali Linux (free, purpose-built for pen testing), Metasploit, Burp Suite (free community edition), Nmap, Wireshark, Gobuster, BloodHound for Active Directory enumeration. Practice on TryHackMe (free tier) and HackTheBox (free tier).

### Realistic Timeline to First Job

Month 1 to 2: Security+ and Kali Linux basics. Month 2 to 4: TryHackMe Pre-Security and Jr Penetration Tester paths. Month 4 to 6: CEH exam prep and pass. Month 6 to 9: HackTheBox active practice and writeups. Month 9 to 12: OSCP prep and attempt. First pen testing job realistic after OSCP or strong CEH plus HackTheBox portfolio.

### Salary Range in Canada

Junior (0 to 2 years): $75,000 to $95,000 CAD. Mid level: $100,000 to $135,000 CAD. Senior: $135,000 to $180,000 CAD. Principal or lead: $180,000+ CAD at large consulting firms.

### Canadian Companies Actively Hiring Pen Testers

Deloitte Canada, KPMG Canada, Accenture, PwC — all have large offensive security practices serving Canadian clients. CGI Group. Herjavec Group — Canadian cybersecurity firm, heavy pen testing focus. Arctic Wolf, eSentire. Federal Government (CSE, RCMP, DND) — for Canadian citizens only. Independent consulting as a contractor is also very viable once you have OSCP.

---

## Which Path Should You Choose

If you want to get your first job as fast as possible: SOC Analyst. Lowest barrier, most openings, fastest path to employment.

If you have some cloud background or want the highest growth trajectory: Cloud Security. The demand curve is steepest here and it pays well at every level.

If you want the most intellectually challenging work and are willing to invest 12+ months: Penetration Testing. Highest ceiling, most competitive, most satisfying for people who genuinely love hacking things.

All three paths eventually converge. Many senior cybersecurity professionals have worked in SOC first, then moved into cloud security or pen testing with more experience.

---

## Free Resources Summary

TryHackMe — [tryhackme.com](http://tryhackme.com) (structured learning paths for all three tracks, free tier)

HackTheBox — [hackthebox.com](http://hackthebox.com) (advanced practice, free tier)

Professor Messer Security+ — [professormesser.com](http://professormesser.com) (free)

Microsoft Learn SC-200 path — [learn.microsoft.com](http://learn.microsoft.com) (free)

AWS Skill Builder — [skillbuilder.aws](http://skillbuilder.aws) (free)

Splunk Free Training — [splunk.com/en_us/training/free-courses](http://splunk.com/en_us/training/free-courses)

Kali Linux documentation — [kali.org/docs](http://kali.org/docs)

---

## ORU Hands-On Data Analytics Course

Most analytics courses teach you tools. This one teaches you how to think like a practitioner, then gives you the tools to execute. Every project is built around a realistic business problem — insurance, banking, fintech, and ecommerce. The tools span Python, SQL, BigQuery, dbt Core, Tableau, Power BI, Streamlit, and Vanna AI. Nothing is introduced for its own sake. By the final project, you are operating across a stack that reflects what senior practitioners use in production.

For analysts who are tired of concept-heavy courses with little real execution: [joinoru.com/course/hands-on-data-analytics](http://joinoru.com/course/hands-on-data-analytics)

---

*For mentorship, live sessions, and community support: [joinoru.com](http://joinoru.com)*