#!/bin/bash
# setup_kali.sh - Installs Evilginx2, Metasploit, and other attacker tools for the quishing lab

echo "Updating Kali and installing Evilginx2, Metasploit, and dependencies..."
# Example install commands (customize as needed)
sudo apt update
sudo apt install -y git metasploit-framework
git clone https://github.com/kgretzky/evilginx2.git
cd evilginx2 && make build

echo "Attacker tools setup complete."