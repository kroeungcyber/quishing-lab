# Quishing Lab

A comprehensive lab environment for safely practicing and defending against QR code phishing (quishing) attacks.

## Repository Structure

```
quishing-lab/
├── attacker_scripts/       # Kali setup & automation  
│   ├── setup_kali.sh       # Installs Evilginx2, Metasploit, etc.  
│   └── start_phish.sh      # Launches phishing server  
├── phishing_pages/         # Fake login templates  
│   ├── office365/          # Microsoft clone  
│   └── vpn_login/          # Corporate VPN clone  
├── payloads/               # Malicious files (e.g., .exe, .apk)  
├── qr_codes/               # Generated malicious QR codes  
├── README.md               # Lab documentation (this file)  
├── LAB_SETUP.md            # Step-by-step lab setup instructions  
└── blue_team_defenses/     # Detection rules & training  
    ├── suricata_rules/     # IDS rules for QR phishing  
    └── user_training.md    # Awareness guidelines
```

## Quick Start

1. Review [LAB_SETUP.md](./LAB_SETUP.md) for detailed setup and usage instructions.
2. Use the scripts and templates in this repository to simulate and defend against QR code phishing attacks in a controlled environment.

## Disclaimer

**This repository is for educational and authorized testing purposes only. Do not use these techniques outside of a controlled, permitted environment.**

## References

- [OWASP QR Code Security](https://owasp.org/www-community/attacks/QR_Code_Attacks)
- [Flask Documentation](https://flask.palletsprojects.com/)
- [qrcode Python Library](https://pypi.org/project/qrcode/)