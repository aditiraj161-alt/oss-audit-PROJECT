#!/bin/bash
# Script 5: Open Source Manifesto Generator
# Description: Generates a personalized open source philosophy statement
# Alias concept: You can create an alias in ~/.bashrc: alias manifesto='./manifesto_generator.sh'

echo "========================================="
echo "Open Source Manifesto Generator"
echo "========================================="
echo "Answer three questions to generate your manifesto."
echo ""

# Question 1
echo "Question 1: Why do you love open source?"
read -p "Your answer: " Q1

# Question 2
echo ""
echo "Question 2: What open source project inspires you?"
read -p "Your answer: " Q2

# Question 3
echo ""
echo "Question 3: How will you contribute to open source?"
read -p "Your answer: " Q3

# Get name
echo ""
echo "What's your name?"
read -p "Your name: " NAME

# Get current date
DATE=$(date "+%Y-%m-%d")

# Generate filename
FILENAME="manifesto_${DATE}.txt"

# Create manifesto
cat > "$FILENAME" << EOF
Open Source Manifesto - $NAME
Date: $DATE

I believe open source is about: $Q1

I am inspired by: $Q2

I will contribute by: $Q3

I commit to being part of the open source community and helping it grow.
EOF

echo ""
echo "✓ Manifesto created: $FILENAME"
echo ""
cat "$FILENAME"
