# 🛡️ Cybersecurity Masterclass Resources

A curated collection of materials from the Cybersecurity Masterclass — covering foundational concepts, real-world case studies, career path visuals, and hands-on lab guidance.

---

## 👤 Credits

These resources were created by **[Nidhi P. Chikhalia](https://www.linkedin.com/in/nidhip-chikhalia/)** as part of the **ORU Cybersecurity Masterclass**. All credit for the content, curriculum design, and materials belongs to him.

---

## 📁 Folder Contents

| File | Type | Description |
|------|------|-------------|
| [Introduction-to-Cybersecurity.pdf](./Introduction-to-Cybersecurity.pdf) | 📄 PDF | Core introductory guide covering foundational cybersecurity concepts |
| [PenTest Career path.png](./PenTest%20Career%20path.png) | 🖼️ Image | Visual roadmap for the Penetration Testing career track |
| [Security Analyst Career path.png](./Security%20Analyst%20Career%20path.png) | 🖼️ Image | Visual roadmap for the Security Analyst (SOC) career track |
| [Florida Water Treatment Facility Hack.txt](./Florida%20Water%20Treatment%20Facility%20Hack.txt) | 📝 Text | Reference link to a real-world ICS/SCADA cyberattack case study |
| [INC-README.txt](./INC-README.txt) | 📝 Text | Real ransomware note from the INC ransomware group — used as a teaching artifact |
| [Lab Instructions.txt](./Lab%20Instructions.txt) | 📝 Text | Instructions for setting up an Active Directory home lab using VMware |

---

## 📚 Resource Descriptions

### 📄 Introduction to Cybersecurity (PDF)
A foundational document covering the core concepts of cybersecurity. Ideal as a first read before diving into hands-on practice or certification study. Topics typically include threat landscapes, security principles (CIA triad), common attack types, and basic defense mechanisms.

---

### 🖼️ Career Path Visuals

Two visual roadmaps are included to help you understand the trajectory of two major cybersecurity roles:

**Security Analyst Career Path**
- Entry point: CompTIA Security+, Google Cybersecurity Certificate
- Core role: SOC Analyst — monitoring, triaging, and responding to alerts
- Tools: Splunk, Microsoft Sentinel, CrowdStrike, Wireshark
- Growth path: Senior SOC → Threat Intel → IR Manager → CISO

**PenTest Career Path**
- Entry point: CompTIA Security+, CEH
- Core role: Penetration Tester / Ethical Hacker
- Tools: Kali Linux, Metasploit, Burp Suite, Nmap, BloodHound
- Growth path: Junior Pentester → Senior Pentester → Red Team Lead → Offensive Security Director
- Gold standard cert: OSCP (Offensive Security Certified Professional)

---

### 🔴 Real-World Case Study: Florida Water Treatment Facility Hack

> **Link:** See `Florida Water Treatment Facility Hack.txt`

In February 2021, an attacker remotely accessed the Oldsmar, Florida water treatment facility's SCADA system and attempted to increase sodium hydroxide (lye) levels to a dangerous concentration — 111 times the normal level. An alert operator noticed the change in real time and reversed it.

**Key lessons:**
- ICS/SCADA systems are high-value, often poorly secured targets
- Remote access tools (TeamViewer) were left enabled with no MFA
- Human monitoring remains a critical last line of defense
- OT (Operational Technology) security is a growing specialization

---

### 🚨 Ransomware Artifact: INC Ransomware Note

> **File:** `INC-README.txt`

This is an **actual ransom note** dropped by the **INC ransomware group** — a sophisticated threat actor active since mid-2023. This file is included as a **teaching artifact** to study real attacker tactics, messaging, and pressure techniques.

**What this teaches you:**
- How ransomware groups communicate with victims
- Psychological pressure tactics used in ransomware operations (anti-recovery, anti-law enforcement messaging)
- The double extortion model: encrypt data AND threaten to publish it
- How threat actors establish credibility (test decryption offers, reputational arguments)

**INC Ransomware Group profile:**
- Targets: Healthcare, education, government, critical infrastructure
- Method: Spear phishing and exposed RDP/VPN vulnerabilities for initial access
- Exfiltration + encryption double-extortion model
- Active TOR-based leak site for non-paying victims

> ⚠️ **Note:** This file is for educational analysis only. Do not interact with any links contained within.

---

### 🖥️ Home Lab: Active Directory Setup

> **File:** `Lab Instructions.txt`

This lab simulates a real enterprise Windows environment — the kind you'll encounter in most Canadian corporate environments.

**What you'll build:**
- A **Windows Server Domain Controller** (Active Directory)
- **Two Windows 11 machines** joined to the domain
- **Local admin accounts** on each Windows 11 machine
- **Domain users** mapped to each machine

**Tools required:**
- VMware Workstation Pro (free personal use tier available)
- Windows Server ISO image
- Windows 11 ISO images

**Why this lab matters:**
- Active Directory is the backbone of enterprise identity management
- AD misconfigurations are one of the most exploited attack surfaces in real-world breaches
- Tools like BloodHound, Mimikatz, and Impacket are used to enumerate and attack AD
- Defenders must understand AD to secure it — and pentesters must master it to exploit it

**Recommended next steps after setup:**
1. Practice adding/removing users and group policies
2. Simulate a domain user privilege escalation attack
3. Run BloodHound to visualize AD attack paths
4. Practice lateral movement techniques in a controlled environment

> 💡 Use the ChatGPT prompt provided in `Lab Instructions.txt` to generate step-by-step setup guidance tailored to your specific configuration.

---

## 🗺️ How This Fits the Broader Cybersecurity Journey

This masterclass material connects directly to the career paths documented in the parent [`Cybersecurity/`](../) folder:

| Topic Covered | Relevant Career Path |
|---------------|----------------------|
| Intro to Cybersecurity PDF | All paths — foundational |
| Security Analyst Career Path visual | SOC Analyst path |
| PenTest Career Path visual | Penetration Testing path |
| Active Directory Lab | SOC Analyst + Penetration Testing |
| Florida Water Facility case study | ICS/OT Security specialization |
| INC Ransomware note analysis | Threat Intelligence + IR |

---

## 🔗 Companion Resources

| Resource | Link |
|----------|------|
| Cybersecurity Entry Paths (detailed) | [`../CybersecurityEntryPaths.md`](../CybersecurityEntryPaths.md) |
| Full Cybersecurity Roadmap | [`../roadmap.md`](../roadmap.md) |
| TryHackMe (hands-on practice) | https://tryhackme.com |
| HackTheBox (advanced labs) | https://hackthebox.com |
| Professor Messer (Security+ prep) | https://professormesser.com |
| Kali Linux documentation | https://kali.org/docs |

---

*Part of the [Study-Resources](https://github.com/SahilGogna/Study-Resources) repository.*
