#!/bin/bash
# Script 1: System Identity Report
# Author: aditi | Course: Open Source Software

# --- Variables ---
STUDENT_NAME="aditi"
SOFTWARE_CHOICE="Python"

# --- System info ---
KERNEL=$(uname -r)
USER_NAME=$(whoami)
HOME_DIR=$HOME
UPTIME=$(uptime -p)
CURRENT_DATE=$(date)
DISTRO=$(lsb_release -ds 2>/dev/null || cat /etc/*release 2>/dev/null | head -n1 || uname -s)
PYTHON_VERSION=$(python3 --version 2>/dev/null)

# --- Display ---
echo "=========================================="
echo "Open Source Audit — $STUDENT_NAME"
echo "Software Choice: $SOFTWARE_CHOICE"
echo "=========================================="
echo "Distribution : $DISTRO"
echo "Kernel       : $KERNEL"
echo "User         : $USER_NAME"
echo "Home Directory: $HOME_DIR"
echo "Uptime       : $UPTIME"
echo "Current Date : $CURRENT_DATE"
echo "Python Version: $PYTHON_VERSION"
echo "------------------------------------------"
echo "This operating system is covered by the"
echo "GNU General Public License (GPL)"
echo "=========================================="
