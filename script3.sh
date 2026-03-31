#!/bin/bash
# Script 4: Log File Analyzer
# Usage: ./log_analyzer.sh /var/log/syslog [keyword]
# Description: Analyzes log files for specific keywords

# Get command line arguments
LOGFILE=$1
KEYWORD=${2:-"error"}    # Default keyword is 'error' if not provided
COUNT=0
MATCHING_LINES=()

# Check if log file is provided
if [ -z "$LOGFILE" ]; then
    echo "Error: No log file specified."
    echo "Usage: $0 <logfile> [keyword]"
    echo "Example: $0 /var/log/syslog error"
    exit 1
fi

# Check if file exists
if [ ! -f "$LOGFILE" ]; then
    echo "Error: File $LOGFILE not found."
    exit 1
fi

echo "========================================="
echo "LOG FILE ANALYZER"
echo "========================================="
echo "File: $LOGFILE"
echo "Keyword: $KEYWORD"
echo "========================================="
echo

# Check if file is empty (do-while style retry)
if [ ! -s "$LOGFILE" ]; then
    echo "Warning: $LOGFILE is empty."
    
    # Retry logic - wait for file to have content
    RETRY_COUNT=0
    MAX_RETRIES=3
    
    while [ ! -s "$LOGFILE" ] && [ $RETRY_COUNT -lt $MAX_RETRIES ]; do
        RETRY_COUNT=$((RETRY_COUNT + 1))
        echo "Attempt $RETRY_COUNT: File is empty. Waiting 2 seconds..."
        sleep 2
        
        # Check again if file has content
        if [ -s "$LOGFILE" ]; then
            echo "✓ File now has content. Continuing..."
            break
        fi
    done
    
    # If still empty after retries
    if [ ! -s "$LOGFILE" ]; then
        echo "Error: File remains empty after $MAX_RETRIES attempts. Exiting."
        exit 1
    fi
fi

# Read the log file line by line
echo "Analyzing log file..."
echo

while IFS= read -r LINE; do
    # Convert to lowercase for case-insensitive matching
    if echo "$LINE" | grep -qi "$KEYWORD"; then
        COUNT=$((COUNT + 1))
        # Store matching lines (keep last 5)
        MATCHING_LINES+=("$LINE")
        if [ ${#MATCHING_LINES[@]} -gt 5 ]; then
            MATCHING_LINES=("${MATCHING_LINES[@]:1}")
        fi
    fi
done < "$LOGFILE"

echo "========================================="
echo "ANALYSIS RESULTS"
echo "========================================="
echo "Keyword '$KEYWORD' found $COUNT times in $LOGFILE"
echo

# Show summary with percentage
TOTAL_LINES=$(wc -l < "$LOGFILE")
if [ $TOTAL_LINES -gt 0 ]; then
    PERCENTAGE=$(echo "scale=2; ($COUNT * 100) / $TOTAL_LINES" | bc)
    echo "Total lines in file: $TOTAL_LINES"
    echo "Percentage of lines containing '$KEYWORD': $PERCENTAGE%"
fi

echo
echo "========================================="
echo "LAST 5 MATCHING LINES"
echo "========================================="

if [ $COUNT -gt 0 ]; then
    # Using tail + grep to show last 5 matching lines
    echo "The last 5 lines containing '$KEYWORD':"
    echo
    grep -i "$KEYWORD" "$LOGFILE" | tail -5 | while IFS= read -r LINE; do
        echo "  • $LINE"
    done
else
    echo "No matching lines found for keyword '$KEYWORD'"
fi

echo
echo "========================================="
echo "Analysis Complete"
echo "========================================="
