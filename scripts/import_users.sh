#!/bin/bash

IMPORT_FILE="/tmp/users_backup.tar.gz"
IMPORT_DIR="/tmp/user_import"

if [ ! -f "$IMPORT_FILE" ]; then
  echo "[!] Backup file not found: $IMPORT_FILE"
  exit 1
fi

echo "[*] Extracting backup..."
mkdir -p "$IMPORT_DIR"
tar -xzf "$IMPORT_FILE" -C "$IMPORT_DIR"

echo "[*] Backing up current system files..."
for f in passwd shadow group gshadow; do
  cp /etc/$f /etc/$f.bak
done

echo "[*] Importing users..."
cat "$IMPORT_DIR/passwd.users" >> /etc/passwd
cat "$IMPORT_DIR/shadow.users" >> /etc/shadow
cat "$IMPORT_DIR/group.users" >> /etc/group
cat "$IMPORT_DIR/gshadow.users" >> /etc/gshadow

echo "[*] Creating home directories if missing..."
for user in $(cut -d: -f1 "$IMPORT_DIR/passwd.users"); do
  if [ ! -d "/home/$user" ]; then
    mkdir -p "/home/$user"
    chown $user:$user "/home/$user"
    chmod 755 "/home/$user"
  fi
done

echo "[+] Import complete. You may now login with the imported users."
