# SANS Workshop: Active Directory Privilege Escalation with Empire!

<div>
<img src="./sans-2024.jpeg"/>
</div>

Welcome to this workshop where we are going to dive into a core active directory component - Kerberos!

This lab is a self-guided Active Directory security exercise designed to help participants understand Kerberos-based privilege escalation attacks. Originally part of a SANS workshop, this lab is now freely available for local deployment on VMware, VirtualBox, and Ludus.

Participants will build their own AD lab, configure attack tools, and execute real-world attack techniques to escalate privileges in an Active Directory environment.

This workshop is ideally suited for blue teamers that want to peek behind the curtain and understand how adversaries attack AD and pentesters that may not be as familiar with AD environments yet.

Attacks Covered
🔹 Kerberoasting – Extracting service tickets to crack passwords
🔹 DCSyncing – Extracting credentials by simulating a domain controller
🔹 SID History Abuse – Hopping across parent/child domain trusts
🔹 Unconstrained Delegation Abuse – Capturing privileged credentials

### Note

Note: The following labs are related only to the usage of Empire & Starkiller and no other tools

Have fun !

### Access the workbook here:

- https://logout.gitbook.io/ad-privesc-with-empire 

Submit a PR to add your writeup to this list :)

## Install dependencies

> No automatic install is provided as it depend of your package manager and distribution. Here are some install command lines are given for ubuntu.

## Installation

- Installation depend of the provider you use, please follow the appropriate guide :
  - [Install with VmWare](./docs/install_with_vmware.md)
  - [Install with VirtualBox](./docs/install_with_virtualbox.md)
  - [Install with Ludus](./docs/install_with_ludus.md)

- Installation is in three parts :
  1. Templating : this will create the template to use (needed only for proxmox) 
  2. Providing : this will instantiate the virtual machines depending on your provider
  3. Provisioning : it is always made with ansible, it will install all the stuff to create the lab

## Special Thanks to

- Jean-François Maes (https://www.sans.org/profiles/jeanfrancois-maes/) for creating this SANS workshop
- M4yFly [@M4yFly](https://x.com/M4yFly) for the amazing GOAD porject and ansible playbooks (This repo is based on the work of [Mayfly277](https://github.com/Orange-Cyberdefense/GOAD/))
- BC-SECURITY's dev team for their awesome tool Empire and StarKiller
