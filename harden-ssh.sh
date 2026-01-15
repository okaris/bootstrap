#!/usr/bin/env bash
set -e

SSHD_CONFIG="/etc/ssh/sshd_config"

cp "$SSHD_CONFIG" "$SSHD_CONFIG.bak.$(date +%s)"

sed -i 's/^#\?PermitRootLogin.*/PermitRootLogin no/' "$SSHD_CONFIG"
sed -i 's/^#\?PasswordAuthentication.*/PasswordAuthentication no/' "$SSHD_CONFIG"

sshd -t

systemctl reload ssh

echo "Root SSH disabled, password auth disabled"
echo "NEXT: test logins"
