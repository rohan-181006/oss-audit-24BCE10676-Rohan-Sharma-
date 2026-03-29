#!/bin/bash

# Script 1: System Identity Report 
# Author: Rohan Sharma (24BCE10676) 
# Course: Open Source Software 
# Software Choice: Git 

# --- Variables ---
STUDENT_NAME="Rohan"
SOFTWARE_CHOICE="Git"

# --- System info ---
KERNEL=$(uname -r)
USER_NAME=$(whoami)
UPTIME=$(uptime -p)

# --- Additional Info ---
DISTRO=$(lsb_release -ds 2>/dev/null || grep PRETTY_NAME /etc/os-release | cut -d= -f2 | tr -d '"')
CURRENT_DATE=$(date "+%Y-%m-%d %H:%M:%S")

# --- Display ---
echo "=========================================="
echo "    Open Source Audit - $STUDENT_NAME"
echo "=========================================="
echo "Chosen Software  : $SOFTWARE_CHOICE"
echo "------------------------------------------"
echo "Operating System : $DISTRO"
echo "Kernel Version   : $KERNEL"
echo "Current User     : $USER_NAME"
echo "Home Directory   : $HOME"
echo "System Uptime    : $UPTIME"
echo "Current Date/Time: $CURRENT_DATE"
echo "------------------------------------------"
echo "Note: This OS is covered by the GNU GPL License."
echo "=========================================="

