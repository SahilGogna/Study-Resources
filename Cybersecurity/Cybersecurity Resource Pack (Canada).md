# Cybersecurity Resource Pack (Canada)

Everything promised in the reel, in one place. The certifications that actually get checked by Canadian employers, career roadmaps for the three highest demand paths, a real ransomware artifact, a real case study, and an Active Directory home lab you can build this month.

The masterclass materials in this pack were prepared by [Nidhip Chikhalia](https://www.linkedin.com/in/nidhip-chikhalia/), a Security Engineer at one of Canada's top cybersecurity firms, for the ORU Cybersecurity Masterclass. Full credit for that content belongs to them.

## How to use this pack

1. Read the certification section first. It tells you what to buy and in what order.
2. Pick one of the three paths. Do not try all three at once.
3. Start the home lab in week one, not after you are certified. Hands on evidence is what gets you interviews.
4. Open the job search section when you are 60% ready, not 100%.

---

## The 5 certifications Canadian employers actually check

The order you take these in matters more than how many you collect.

| # | Certification | Best for | Level | Cost (CAD) | Study time | When to take it |
| --- | --- | --- | --- | --- | --- | --- |
| 1 | CompTIA Security+ | Every path | Entry | ~$400 | 2 to 3 months | First, always. Non negotiable |
| 2 | CompTIA CySA+ | SOC Analyst | Intermediate | ~$450 | 2 to 3 months | Right after Security+ if you want defence |
| 3 | AWS Security Specialty or Microsoft AZ-500 / SC-200 | Cloud Security | Intermediate | ~$250 to $400 | 2 to 4 months | After Security+ if you want cloud |
| 4 | OSCP | Penetration Tester | Advanced | ~$1,700 | 6 to 12 months | Only if you are going offensive |
| 5 | CISSP | Security Manager, Security Architect | Advanced | ~$800 | 3 to 6 months | Not now. This is your 5 year target |

**What you need to know about each one:**

**Security+** is required or preferred in over 60% of Canadian entry level security postings. If you are starting from zero, this is step one and there is no shortcut around it. Free prep at [professormesser.com](https://www.professormesser.com).

**CySA+** is the natural next step after Security+. It focuses on threat detection, analysis and incident response, which is exactly what a SOC Analyst does all day.

**Cloud security certs** are the single biggest differentiator at entry level in Canada, because very few candidates hold one. Pick based on your target employer's cloud. Canadian banks and government lean Azure, so SC-200 or AZ-500. Tech companies and startups lean AWS. Microsoft SC-900 is a free fundamentals exam and a good warm up.

**OSCP** is the gold standard for penetration testing. The exam is practical: you compromise several machines inside 24 hours. This cert alone can get you hired at most Canadian security firms.

**CISSP** requires five years of paid experience, so you cannot take it now. Know it exists and know it is close to mandatory for Security Manager and Security Architect roles in Canada. Aim at it, do not start with it.

**Two things worth saying plainly:**

- CEH (~$600) sits between Security+ and OSCP for the pen testing path. Canadian employers recognise it. It is optional if you go straight to OSCP with a strong HackTheBox portfolio.
- Do not collect certifications. Two certs plus one documented home lab beats five certs and nothing to show.

---

## Why cybersecurity in Canada right now

- Canada has one of the largest cybersecurity talent gaps in the G7.
- Over 25,000 cybersecurity positions go unfilled every year.
- Entry level roles pay $70,000 to $105,000 CAD depending on the path.
- Mid level roles at 3 to 5 years average $95,000 to $140,000 CAD.
- The biggest hirers are the banks, the federal government, telecom, healthcare and the big consulting firms.
- Most roles do not require a CS degree. Certifications and hands on skills carry equal or more weight.

---

## Step 0: the foundation you cannot skip

Four to six weeks. Do this before you book any exam.

**Networking.** TCP/IP, DNS, HTTP and HTTPS, firewalls, VPNs, ports and protocols. Learn subnetting and basic network architecture. You need to understand how data actually moves across a network.

**Operating systems.** Get comfortable in Linux (Ubuntu or Kali). Learn Windows Server basics too, because most Canadian enterprise environments run Windows and Active Directory.

**Security fundamentals.** The CIA triad. The Cyber Kill Chain. The MITRE ATT&CK framework. Canadian companies build their incident response playbooks on these, so knowing them by name is worth real interview points.

**Free resources for this stage:**

- [Professor Messer](https://www.professormesser.com) for CompTIA study material
- [NetworkChuck on YouTube](https://www.youtube.com/@NetworkChuck) for networking fundamentals
- [TryHackMe](https://tryhackme.com) Pre-Security learning path, free tier
- [Google Cybersecurity Certificate](https://www.coursera.org/professional-certificates/google-cybersecurity), free with financial aid

---

## The three paths

Pick one. All three eventually converge, and plenty of senior people did SOC first and moved sideways later with experience behind them.

### Path 1: SOC Analyst

The most available entry level cybersecurity role in Canada and the best starting point for most people.

**What the job actually looks like.** You sit in front of a SIEM dashboard (Splunk, Microsoft Sentinel or CrowdStrike) watching alerts in real time. Something suspicious fires: an unusual login, a large file transfer, a flagged IP. You investigate. You decide whether it is a real threat or a false positive. If it is real you escalate or contain it. You write the incident report. You tune the alert rules so there is less noise next time.

**Why it is the best entry path.** Highest hiring volume in Canada. Every Canadian bank, telecom, government agency and large enterprise runs a SOC. It does not require deep coding skills. And it teaches you how attacks work from the defensive side, which is the foundation for every other path.

**Certifications in order.** Security+, then CySA+. For senior analyst roles later, GIAC GSEC or GCIA.

**Tools to learn.** Splunk ([free courses](https://www.splunk.com/en_us/training/free-courses)), Microsoft Sentinel, CrowdStrike Falcon basics, Wireshark for packet analysis, basic Linux command line.

**Realistic timeline.** Months 1 to 2: Security+ study. Months 2 to 3: TryHackMe SOC Level 1 path, free. Months 3 to 4: pass Security+ and start applying. Months 4 to 6: first offer is realistic.

| Level | Salary (CAD) |
| --- | --- |
| Entry | $70,000 to $90,000 |
| Mid, 3 to 5 years | $95,000 to $125,000 |
| Senior | $125,000 to $155,000 |

**Who is hiring in Canada.** RBC, TD, Scotiabank and BMO all run large internal SOC teams. Telus, Bell and Rogers. Government of Canada, CSE and CRA. CGI Group, Accenture and Deloitte for managed security practices. eSentire, Arctic Wolf and Herjavec Group, all Canadian founded firms that hire SOC analysts in volume.

### Path 2: Cloud Security

The fastest growing cybersecurity specialisation in Canada.

**What the job actually looks like.** You review cloud configurations looking for gaps: open S3 buckets, over privileged IAM roles, exposed APIs. You put guardrails in place using AWS Security Hub, Microsoft Defender for Cloud or Prisma Cloud. You work alongside DevOps and engineering to build security into the pipeline. You respond to cloud specific incidents. You maintain least privilege access policies.

**Why the demand curve is steepest here.** Every Canadian company is migrating to cloud, and they all need people who can secure what they just moved. Supply is far below demand. RBC, Scotiabank, Telus and most large Canadian enterprises are on Azure or AWS, which creates very specific demand for people who can secure those two platforms.

**Certifications in order.** Security+ first, same foundation. Then pick by target cloud: SC-900 (free exam) into SC-200 or AZ-500 for Azure heavy employers like the banks and government, or AWS Security Specialty for tech companies and startups. AWS Cloud Practitioner and Solutions Architect Associate are worth doing before the Security Specialty. For senior roles later, CCSP.

**Tools to learn.** Azure Defender for Cloud (free with an Azure account), AWS Security Hub and GuardDuty (free tier), Terraform basics for infrastructure as code, basic Python for automation, Kubernetes security concepts.

**Realistic timeline.** Months 1 to 2: Security+ or a cloud fundamentals cert. Months 2 to 4: SC-200, AZ-500 or AWS Security Specialty prep. Months 3 to 5: build a home lab, deploy a deliberately vulnerable cloud environment and practice securing it. Months 4 to 6: first junior offer is realistic.

| Level | Salary (CAD) |
| --- | --- |
| Entry | $85,000 to $105,000 |
| Mid | $110,000 to $140,000 |
| Senior | $140,000 to $180,000 |

**Who is hiring in Canada.** RBC (Azure heavy, large cloud security team), Scotiabank Digital Factory (GCP and Azure), TD Bank, Bell (Azure), Telus (AWS and Azure). Shopify, Lightspeed and Cohere on AWS. Deloitte, KPMG and Accenture are all building cloud security practices for clients.

### Path 3: Penetration Testing

Highest paid, highest ceiling, most competitive to break into.

**What the job actually looks like.** You get a scope of work defining what you are allowed to touch. You do reconnaissance on the target. You find and exploit vulnerabilities. You escalate privileges and move laterally through the network. You document every step. Then you write a detailed report covering what you found, the real world impact, and how to fix it, and you present it to both technical and executive audiences.

**Why the bar is higher.** Senior pen testers at Canadian consulting firms earn $130,000 to $180,000 CAD. But you need demonstrable hands on skill, not just certifications. A portfolio of CTF writeups and HackTheBox or TryHackMe achievements counts for more here than on any other path.

**Certifications in order.** Security+, then CEH (~$600) for the methodology and tooling, then OSCP (~$1,700).

**Tools to learn.** Kali Linux, Metasploit, Burp Suite (free community edition), Nmap, Wireshark, Gobuster, and BloodHound for Active Directory enumeration. Practice on [TryHackMe](https://tryhackme.com) and [HackTheBox](https://www.hackthebox.com), both free tier.

**Realistic timeline.** Months 1 to 2: Security+ and Kali basics. Months 2 to 4: TryHackMe Pre-Security and Jr Penetration Tester paths. Months 4 to 6: CEH. Months 6 to 9: active HackTheBox practice with public writeups. Months 9 to 12: OSCP. A first pen testing job is realistic after OSCP, or after strong CEH plus a real HackTheBox portfolio.

| Level | Salary (CAD) |
| --- | --- |
| Junior, 0 to 2 years | $75,000 to $95,000 |
| Mid | $100,000 to $135,000 |
| Senior | $135,000 to $180,000 |
| Principal or lead | $180,000+ |

**Who is hiring in Canada.** Deloitte, KPMG, Accenture and PwC all run large offensive security practices for Canadian clients. CGI Group. Herjavec Group, heavy pen testing focus. Arctic Wolf and eSentire. Federal government (CSE, RCMP, DND), Canadian citizens only. Independent contracting is very viable once you hold OSCP.

### Which path should you choose

**Want a job as fast as possible?** SOC Analyst. Lowest barrier, most openings, fastest route to employed.

**Have some cloud background, or want the steepest growth?** Cloud Security. Demand is climbing hardest here and it pays well at every level.

**Want the hardest problems and willing to give it 12 months?** Penetration Testing. Highest ceiling, most competitive, most satisfying if you genuinely love breaking things.

---

## Hands on practice

Canadian hiring managers actually look at these profiles, so make them public.

| Platform | What it is for |
| --- | --- |
| [TryHackMe](https://tryhackme.com) | Guided rooms, beginner friendly, structured paths for all three tracks. Free tier |
| [HackTheBox](https://www.hackthebox.com) | Harder, respected in the community. Free tier |
| [LetsDefend](https://letsdefend.io) | SIEM investigations, blue team focused |
| [CyberDefenders](https://cyberdefenders.org) | Threat hunting and forensics |
| [PicoCTF](https://picoctf.org) | Beginner CTF challenges |
| DVWA | Damn Vulnerable Web App, local practice target |

---

## The home lab: Active Directory

Build this. It is the single highest leverage thing in this pack, because around 95% of Fortune 500 companies run Active Directory and interviewers know that.

**What you will build.** A Windows Server domain controller, two Windows 11 machines joined to the domain, local admin accounts on each Windows 11 machine, and domain users mapped to each machine.

**What you need.** VMware Workstation Pro (free for personal use), a Windows Server ISO, and two Windows 11 ISOs.

**Setup instructions.** In the Masterclass folder, `Lab Instructions.txt` gives you a tested prompt to generate detailed step by step instructions for your exact configuration. That is deliberate: staying logged in to the AI tool means you can ask follow up questions when a step breaks, which is more useful than a static guide that does not match your setup.

**Why this lab matters.** Active Directory is the backbone of enterprise identity management, and AD misconfiguration is one of the most exploited attack surfaces in real breaches. Defenders have to understand AD to secure it. Pen testers have to master it to exploit it. Either way you need to have touched one.

**What to do once it is running:**

1. Add and remove users, and set up group policies.
2. Simulate a domain user privilege escalation attack.
3. Run BloodHound and look at the AD attack paths it draws.
4. Practice lateral movement inside your own controlled environment.
5. Document all of it and put the writeup on GitHub. This is your portfolio piece.

---

## Masterclass materials

All of the following live in one folder: [**github.com/SahilGogna/Study-Resources/tree/main/Cybersecurity/Masterclass**](https://github.com/SahilGogna/Study-Resources/tree/main/Cybersecurity/Masterclass)

| File | What it is |
| --- | --- |
| `Introduction-to-Cybersecurity.pdf` | The full masterclass deck. Foundational concepts, threat landscape, CIA triad, common attack types, basic defences. Read this first |
| `Security Analyst Career path.png` | Visual roadmap for the SOC track, entry point through to CISO |
| `PenTest Career path.png` | Visual roadmap for the offensive track, entry point through to Offensive Security Director |
| `Lab Instructions.txt` | The Active Directory home lab setup |
| `INC-README.txt` | A real ransom note dropped by the INC ransomware group |
| `Florida Water Treatment Facility Hack.txt` | Link to the Oldsmar ICS/SCADA attack case study |

**On the ransomware note.** This is an actual artifact from a real threat actor, included so you can study how these groups operate: how they communicate with victims, the psychological pressure tactics (anti recovery and anti law enforcement messaging), the double extortion model of encrypting data and also threatening to publish it, and how they manufacture credibility with test decryptions. INC targets healthcare, education, government and critical infrastructure, gets in through spear phishing and exposed RDP or VPN, and runs a TOR leak site for victims who do not pay. Read it for analysis only, and do not interact with anything linked inside it.

**On the Florida case study.** In February 2021 an attacker remotely accessed the Oldsmar water treatment facility's SCADA system and tried to raise sodium hydroxide to 111 times the normal concentration. An operator spotted the change live and reversed it. The lessons: ICS and SCADA systems are high value and often badly secured, remote access tools were left enabled with no MFA, human monitoring was the last line of defence that actually worked, and OT security is a growing specialisation worth knowing about.

---

## Build your portfolio

Certifications get you past the filter. The portfolio gets you the interview.

**What to have public:** your TryHackMe profile with visible badge progress, your HackTheBox profile with your rank, and a GitHub with CTF solutions and home lab writeups documented properly.

**Project ideas beyond the AD lab:**

- Stand up a SIEM on the Splunk free tier and run log analysis against simulated events.
- Deploy a vulnerable web app, pentest it, and write up your findings like a real report.
- Write a threat analysis report on a publicly disclosed CVE.
- Produce a network diagram and security audit for a fictional company.

---

## Canadian job search strategy

**Where to apply.**

- LinkedIn, filtered to Canada and posted in the last 7 days
- [Government of Canada Job Bank](https://www.jobbank.gc.ca), underused and full of real postings
- Cyber Job Central, cybersecurity specific
- Indeed Canada, searching SOC Analyst, security analyst, information security

**Keywords your resume needs.** SOC Analyst, Information Security Analyst, Cybersecurity Analyst. Threat Detection, Incident Response, Vulnerability Assessment. SIEM, Firewall, IDS/IPS, Endpoint Security. And your certifications, only the ones you actually hold.

**Canadian resume rules.**

- One page if you are under five years experience.
- Certifications go near the top, not buried at the bottom.
- Quantify everything. "Reduced incident response time by 30%" beats "helped with incidents".
- No photo, no date of birth. That is the Canadian standard.

---

## Every free resource in one list

| Resource | Use it for |
| --- | --- |
| [TryHackMe](https://tryhackme.com) | Structured hands on paths, all three tracks |
| [HackTheBox](https://www.hackthebox.com) | Advanced practice and portfolio |
| [Professor Messer](https://www.professormesser.com) | Security+ prep, completely free |
| [NetworkChuck](https://www.youtube.com/@NetworkChuck) | Networking fundamentals |
| [Google Cybersecurity Certificate](https://www.coursera.org/professional-certificates/google-cybersecurity) | Beginner foundation, free with financial aid |
| [Microsoft Learn SC-200 path](https://learn.microsoft.com) | Azure security operations |
| [AWS Skill Builder](https://skillbuilder.aws) | AWS security fundamentals |
| [Splunk free training](https://www.splunk.com/en_us/training/free-courses) | The SIEM used most in Canadian SOCs |
| [Kali Linux docs](https://www.kali.org/docs) | Pen testing OS |
| [Cybrary](https://www.cybrary.it) | Free cybersecurity courses |
| [SANS Cyber Aces](https://www.cyberaces.org) | Free foundational course |

---

## Want mentorship while you do this

ORU is a community of professionals already working at Canadian companies, including cybersecurity engineers, data engineers and analysts. One on one mentorship, weekly live sessions, recorded resources, interview prep and discounted community events.

[**joinoru.com**](https://joinoru.com)

*Also from ORU: the [Hands-On Data Analytics course](https://joinoru.com/course/hands-on-data-analytics), if analytics is closer to what you want. Code ORU10 for 10% off.*

All the best,

Sahil