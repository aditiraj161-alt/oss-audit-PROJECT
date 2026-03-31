#!/bin/bash
# Script 2: FOSS Package Inspector

PACKAGE="python3"

echo "========================================="
echo "FOSS Package Inspector"
echo "Checking package: $PACKAGE"
echo "========================================="
echo

if dpkg -l "$PACKAGE" 2>/dev/null | grep -q "^ii"; then
    echo "✓ $PACKAGE is INSTALLED on this system."
    echo
    echo "--- Package Details ---"
    dpkg -l "$PACKAGE" 2>/dev/null | grep "^ii"
    echo
    echo "--- Python Version Details ---"
    python3 --version
    echo
else
    echo "✗ $PACKAGE is NOT INSTALLED on this system."
    echo "To install: sudo apt install python3"
    echo
fi

echo "--- About Python ---"
case $PACKAGE in
    python3)
        echo "Python: A high-level, interpreted programming language known for its simplicity."
        echo "Used for web development, data science, automation, and more."
        ;;
esac

echo
echo "========================================="
echo "Inspection complete."
echo "========================================="
