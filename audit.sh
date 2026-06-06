#!/bin/bash

echo "=============================="
echo "   SERVER SECURITY AUDIT TOOL"
echo "=============================="
echo "Started at: $(date)"
echo "Hostname:   $(hostname)"
echo "User:       $(whoami)"
echo "=============================="
echo ""

echo "[ CHECK 1 ] SUDO PERMISSIONS"
echo "-----------------------------"
sudo -l 2>/dev/null || echo "No sudo access"
echo ""

echo "[ CHECK 2 ] SUID FILES"
echo "----------------------"
find / usr /bin /sbin -perm -u=s -type f 2>/dev/null
echo ""

echo "[ CHECK 3 ] OPEN PORTS"
echo "----------------------"
ss -tulpn 2>/dev/null
echo ""

echo "[ CHECK 4 ] FAILED LOGIN ATTEMPTS"
echo "----------------------------------"
grep "Failed password" /var/log/auth.log 2>/dev/null | awk '{print $11}' | sort | uniq -c | sort -rn | head -10
echo ""

echo "[ CHECK 5 ] RUNNING SERVICES"
echo "-----------------------------"
systemctl list-units --type=service --state=running 2>/dev/null | grep running
echo ""
