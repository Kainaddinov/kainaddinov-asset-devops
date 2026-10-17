#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
INFO_FILE="$SCRIPT_DIR/../Kainaddinov_Asset_info.txt"

echo "=============================="
echo "Student Information"
echo "=============================="
echo
echo "Name: Asset"
echo "Surname: Kainaddinov"
echo "Group: IT2-2306"
echo "Student ID: 37428"
echo
echo "=============================="
echo "System Information"
echo "=============================="
echo

if command -v free >/dev/null 2>&1; then
  MEMORY="$(free -h | awk '/^Mem:/ {print $3 " used of " $2}')"
else
  MEMORY="$(top -l 1 | grep PhysMem)"
fi

echo "Username: $(whoami)"
echo "Hostname: $(hostname)"
echo "Current Date: $(date)"
echo "Operating System: $(uname -sr)"
echo "Disk Usage: $(df -h / | awk 'NR==2 {print $3 " used of " $2 " (" $5 ")"}')"
echo "Memory Usage: $MEMORY"
echo

if [ -f "$INFO_FILE" ]; then
  echo "Student information file exists."
else
  echo "Student information file does not exist."
fi
