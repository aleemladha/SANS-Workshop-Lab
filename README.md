# SANS Workshop: Active Directory Privilege Escalation with Empire!

<div align="right">
  <img src="./sans-2024.jpg" alt="SANS Workshop">
</div>

Welcome to this workshop, where we dive into a core Active Directory component—**Kerberos**!

This self-guided **Active Directory security lab** helps participants understand **Kerberos-based privilege escalation attacks**. Originally part of a **SANS workshop**, this lab is now freely available for local deployment on **VMware, VirtualBox, and Ludus**.

Participants will **build their own AD lab, configure attack tools, and execute real-world attack techniques** to escalate privileges in an Active Directory environment.

This workshop is ideal for:
- **Blue teamers** who want to understand how adversaries attack AD.
- **Pentesters** who are less familiar with AD environments.

## Attacks Covered

✅ **Kerberoasting** – Extracting service tickets to crack passwords  
✅ **DCSync Attack** – Extracting credentials by simulating a domain controller  
✅ **SID History Abuse** – Hopping across parent/child domain trusts  
✅ **Unconstrained Delegation Abuse** – Capturing privileged credentials  

---

## ⚠️ Note  
This workshop focuses exclusively on **Empire & Starkiller** and does **not** cover other tools.

🎉 Have fun!

---

## 📖 Access the Workbook  
🔗 [AD Privilege Escalation with Empire](https://logout.gitbook.io/ad-privesc-with-empire)

Want to contribute? **Submit a PR** to add your write-up!

---

## 🛠 Install Dependencies  

⚠️ No automatic install is provided, as it depends on your **package manager and distribution**. Below are example commands for **Ubuntu**.

### 🏗 Installation Guide  
Installation varies based on the **provider** you use. Follow the appropriate guide:

- [Install with VMware](./docs/install_with_vmware.md)  
- [Install with VirtualBox](./docs/install_with_virtualbox.md)  
- [Install with Ludus](./docs/install_with_ludus.md)  

### 🚀 Installation Steps  

1️⃣ **Templating** – Creates the base template (**Required only for Proxmox**)  
2️⃣ **Providing** – Instantiates virtual machines based on your provider  
3️⃣ **Provisioning** – Uses **Ansible** to install and configure the lab  

---

## 🎖 Special Thanks  

- **Jean-François Maes** – [SANS Profile](https://www.sans.org/profiles/jeanfrancois-maes/) for creating this workshop  
- **M4yFly** [@M4yFly](https://x.com/M4yFly) – For the **GOAD project** and **Ansible playbooks**  
  *(This repo is based on the work of [Mayfly277](https://github.com/Orange-Cyberdefense/GOAD/))*  
- **BC-SECURITY**'s development team – For **Empire** and **Starkiller**  

---

🚀 **Happy hacking & learning!**
