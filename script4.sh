#!/bin/bash
# Script 3: Disk and Permission Auditor

# Define array of directories
DIRS=("/etc" "/var/log" "/home" "/usr/bin" "/tmp")

echo "========================================="
echo "Directory Audit Report"
echo "Date: $(date)"
echo "========================================="
echo

for DIR in "${DIRS[@]}"; do
    if [ -d "$DIR" ]; then
        # Get permissions, owner, and group
        PERMS=$(ls -ld "$DIR" | awk '{print $1, $3, $4}')
        # Get size in human readable format
        SIZE=$(du -sh "$DIR" 2>/dev/null | cut -f1)
        echo "$DIR => Permissions: $PERMS | Size: $SIZE"
    else
        echo "$DIR => Directory does NOT exist"
    fi
done

echo
echo "========================================="
echo "Audit Complete"
echo "========================================="
