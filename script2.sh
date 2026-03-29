#!/bin/bash

# Script 2: FOSS Package Inspector

# Setting the package as Git
PACKAGE="git"

echo "--- Commencing Package Inspection for: $PACKAGE ---"

# --- Package Installation Check ---
if dpkg -l | grep -q "^ii  $PACKAGE "; then
    echo "Status: $PACKAGE is successfully installed on this system."
    echo "--------------------------------------------------------"

    # Show package details
    apt show $PACKAGE 2>/dev/null | grep -E 'Version|Homepage|Download-Size'

    echo "--------------------------------------------------------"
else
    echo "Status: $PACKAGE is NOT currently installed."
    echo "Action: You can install it using 'sudo apt install $PACKAGE'"
fi

# --- Philosophy Section using case ---
case $PACKAGE in
    "httpd" | "apache2")
        echo "Philosophy: Apache - The web server that built the open internet."
        ;;
    "mysql" | "mysql-server")
        echo "Philosophy: MySQL - Open source at the heart of millions of apps."
        ;;
    "git")
        echo "Philosophy: Git - The tool Linus built when proprietary failed him."
        ;;
    "vlc")
        echo "Philosophy: VLC - A student-led project that plays anything."
        ;;
    "firefox")
        echo "Philosophy: Firefox - A nonprofit fighting for an open web."
        ;;
    *)
        echo "Philosophy: This is a valuable component of the FOSS ecosystem."
        ;;
esac
