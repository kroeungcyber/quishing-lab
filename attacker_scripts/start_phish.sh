#!/bin/bash
# start_phish.sh - Launches the phishing server for the quishing lab

echo "Starting phishing server (Flask example on port 5000)..."
attacker_scripts/venv/bin/python3 attacker_scripts/phish_server.py &

echo "Phishing server started. Monitor logs for captured credentials."