#!/bin/bash

# Script 5: Open Source Manifesto Generator

echo "Answer three questions to generate your manifesto."
echo ""

# --- User Input ---
read -p "1. Name one open-source tool you use every day: " TOOL
read -p "2. In one word, what does 'freedom' mean to you? " FREEDOM
read -p "3. Name one thing you would build and share freely: " BUILD

# --- Variables ---
DATE=$(date '+%d %B %Y')
USER_ID=$(whoami)
OUTPUT="manifesto_${USER_ID}.txt"

# --- Generate Manifesto ---
{
    echo "----------------------------------------------------------"
    echo "             OPEN SOURCE MANIFESTO ($DATE)"
    echo "----------------------------------------------------------"
    echo "My name is $USER_ID, and I believe in the power of FOSS."
    echo "Every day, I rely on $TOOL to empower my digital life."
    echo "To me, the essence of open source is '$FREEDOM'."
    echo ""
    echo "In the spirit of global collaboration, I pledge that"
    echo "one day I will build and share a $BUILD with the world,"
    echo "just as others shared their hard work with me."
    echo "----------------------------------------------------------"
} > "$OUTPUT"

# --- Progress Animation ---
echo -n "Compiling your manifesto "
for i in {1..3}; do
    echo -n "."
    sleep 0.5
done
echo " DONE!"

# --- Final Output ---
echo "Manifesto successfully saved to: $OUTPUT"
echo ""
cat "$OUTPUT"
echo "=========================================================="
