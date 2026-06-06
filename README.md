# Server Security Audit Script

A Bash script that performs automated security audits on Linux servers.

## What it checks
- Sudo permissions (privilege escalation risk)
- SUID files (common attack vector)
- Open ports and listening services
- Failed login attempts (brute force detection)
- Running services

## Usage
```bash
bash audit.sh
```

## Skills Demonstrated
- Bash scripting
- Linux security concepts
- Log analysis with grep/awk/sed
- SUID and privilege escalation awareness
