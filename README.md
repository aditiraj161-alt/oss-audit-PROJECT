# OSS Audit - PROJECT

## Student Details
- **Name**: ADITI RAJ
- **Roll Number**: 24BAI10085
- **Course**: Open Source Software (OSS NGMC)

## Chosen Software for Audit
**Python** - Created by Guido van Rossum in 1989 as a "Christmas project," Python is now one of the most influential programming languages in the world, especially in Artificial Intelligence and Machine Learning domains. It is released under the Python Software Foundation (PSF) License, a permissive open-source license.

## Description of Each Script

### Script 1: `system_identity.sh`
Generates a comprehensive system identity report including hostname, operating system version, kernel details, uptime, CPU architecture, memory usage, and disk utilization. This script provides a snapshot of the Linux environment.

### Script 2: `package_audit.sh`
Checks if a software package is installed on the system. It automatically detects whether the system uses RPM-based (Red Hat, Fedora) or DPKG-based (Debian, Ubuntu) package management and uses a case statement to print a description of the package's purpose.

### Script 3: `disk_permission_auditor.sh`
Audits disk usage and file permissions on the system. It identifies large directories, checks for world-writable files, and flags potential security issues related to improper permission settings.

### Script 4: `openssl_analyzer.sh`
Analyzes the OpenSSL installation on the system, checking for version information, supported ciphers, and basic security configurations. This is relevant because Python depends on OpenSSL for secure network operations.

### Script 5: `manifesto_generator.sh`
An interactive script that generates a personalized Open Source Manifesto. It asks the user three questions about their open-source philosophy and saves the responses as a timestamped text file.

## Step-by-Step Instructions to Run Each Script on Linux

### Prerequisites
- Linux operating system (Ubuntu 20.04/22.04, Debian, Fedora, or RHEL recommended)
- Bash shell (default on most Linux distributions)
- Git installed: `sudo apt install git` (Ubuntu/Debian) or `sudo dnf install git` (Fedora/RHEL)
- Basic command-line familiarity

### Setup Instructions

1. **Clone the repository**
```bash
git clone https://github.com/[your-username]/oss-audit-PROJECT
cd oss-audit-PROJECT
▶️ Execution
🔹 Run System Identity Script
./system_identity.sh
🔹 Run Package Audit
./package_audit.sh python
🔹 Run Disk Permission Auditor
./disk_permission_auditor.sh
🔹 Run OpenSSL Analyzer
./openssl_analyzer.sh
🔹 Run Manifesto Generator
./manifesto_generator.sh
