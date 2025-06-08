#!/bin/bash
# start_phish.sh - Launches the phishing server for the quishing lab

echo "Starting phishing server (Flask example on port 5000)..."
python3 ../phishing_pages/office365/index.html &

echo "Phishing server started. Monitor logs for captured credentials."