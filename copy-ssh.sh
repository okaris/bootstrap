#!/usr/bin/env bash
set -e

USERNAME=omer
SRC_KEYS="/root/.ssh/authorized_keys"
DST_DIR="/home/$USERNAME/.ssh"

if [ ! -f "$SRC_KEYS" ]; then
  echo "ERROR: $SRC_KEYS does not exist"
  echo "STOP. Do NOT continue."
  exit 1
fi

mkdir -p "$DST_DIR"
cp "$SRC_KEYS" "$DST_DIR/authorized_keys"
chown -R "$USERNAME:$USERNAME" "$DST_DIR"
chmod 700 "$DST_DIR"
chmod 600 "$DST_DIR/authorized_keys"

echo "SSH keys copied to $USERNAME"
echo "NEXT: open a NEW terminal and test ssh $USERNAME@server"
