#!/bin/bash

# Script 3: Disk and Permission Auditor

# --- Array Definition ---
DIRS=("/etc" "/var/log" "/home" "/usr/bin" "/tmp")

echo "=========================================================="
echo "          SYSTEM DIRECTORY AUDIT REPORT                   "
echo "=========================================================="

# --- Main Audit Loop ---
for DIR in "${DIRS[@]}"; do
    if [ -d "$DIR" ]; then
        PERMS=$(ls -ld "$DIR" | awk '{print $1, $3, $4}')
        SIZE=$(du -sh "$DIR" 2>/dev/null | cut -f1)

        echo "$DIR => Permissions: $PERMS | Size: $SIZE"
    else
        echo "$DIR does not exist on this system"
    fi
done

echo "----------------------------------------------------------"

# --- Git Config Audit ---
GIT_CONFIG="/etc/gitconfig"

echo ">>> Conducting Specific Audit for: Git Configuration <<<"

if [ -f "$GIT_CONFIG" ]; then
    CONF_PERMS=$(ls -l "$GIT_CONFIG" | awk '{print $1}')
    echo "Git System Config ($GIT_CONFIG) exists."
    echo "Permissions: $CONF_PERMS"

else
    LOCAL_GIT="$HOME/.gitconfig"

    if [ -f "$LOCAL_GIT" ]; then
        LOCAL_PERMS=$(ls -l "$LOCAL_GIT" | awk '{print $1}')
        echo "Local Git Config ($LOCAL_GIT) found."
        echo "Permissions: $LOCAL_PERMS"
    else
        echo "Git configuration file not detected in standard locations."
    fi
fi

echo "=========================================================="
