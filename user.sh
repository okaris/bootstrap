#!/usr/bin/env bash
set -e

USERNAME=ok

if id "$USERNAME" &>/dev/null; then
  echo "User $USERNAME already exists"
  exit 0
fi

adduser "$USERNAME"
usermod -aG sudo "$USERNAME"

echo "User $USERNAME created and added to sudo"
echo "NEXT: copy SSH keys and test login"
