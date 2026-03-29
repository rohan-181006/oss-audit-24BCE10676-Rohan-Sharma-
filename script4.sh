#!/bin/bash

# Script 4: Log File Analyzer

# Input arguments
LOGFILE=$1
KEYWORD=${2:-"error"}   # default = error
COUNT=0

# --- Check if file exists ---
if [ ! -f "$LOGFILE" ]; then
    echo "Error: The log file '$LOGFILE' not found."
    exit 1
fi

# --- Wait if file is empty (Do-While style) ---
while [ ! -s "$LOGFILE" ]; do
    echo "File is currently empty. Retrying in 2 seconds..."
    sleep 2
done

echo "--- Analyzing $LOGFILE for keyword: '$KEYWORD' ---"

# --- Main Processing Loop ---
while IFS= read -r LINE; do
    if echo "$LINE" | grep -iq "$KEYWORD"; then
        COUNT=$((COUNT + 1))
    fi
done < "$LOGFILE"

# --- Output ---
echo "----------------------------------------------------------"
echo "Search Complete."
echo "Total occurrences of '$KEYWORD': $COUNT"

# --- Show last 5 matches ---
if [ $COUNT -gt 0 ]; then
    echo "----------------------------------------------------------"
    echo "Last 5 matching entries found:"
    grep -i "$KEYWORD" "$LOGFILE" | tail -n 5
fi

echo "=========================================================="
