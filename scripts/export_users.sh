#!/bin/bash

EXPORT_DIR="/tmp/user_export"
mkdir -p "$EXPORT_DIR"

echo "[*] Exporting users from $(hostname)..."

awk -F: '$3 >= 1000 && $3 < 65534' /etc/passwd > "$EXPORT_DIR/passwd.users"
awk -F: '$3 >= 1000 && $3 < 65534' /etc/shadow > "$EXPORT_DIR/shadow.users"
awk -F: '$3 >= 1000 && $3 < 65534' /etc/group > "$EXPORT_DIR/group.users"
awk -F: '$3 >= 1000 && $3 < 65534' /etc/gshadow > "$EXPORT_DIR/gshadow.users"

tar -czf "$EXPORT_DIR/users_backup.tar.gz" -C "$EXPORT_DIR" passwd.users shadow.users group.users gshadow.users

echo "[+] Export complete."
echo "[-] Now copy '$EXPORT_DIR/users_backup.tar.gz' to your new server."
