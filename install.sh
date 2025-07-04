#!/bin/bash

echo "[*] Installing..."

INSTALL_DIR="/usr/local/bin"
TMP_DIR="/tmp/userclone_install_$$"
REPO_BASE="https://raw.githubusercontent.com/ermia81/userclone/main/scripts"

mkdir -p "$TMP_DIR"

curl -s "$REPO_BASE/export_users.sh" -o "$TMP_DIR/export_users.sh"
curl -s "$REPO_BASE/import_users.sh" -o "$TMP_DIR/import_users.sh"

chmod +x "$TMP_DIR"/*.sh

sudo mv "$TMP_DIR/export_users.sh" "$INSTALL_DIR/export_users"
sudo mv "$TMP_DIR/import_users.sh" "$INSTALL_DIR/import_users"

rm -rf "$TMP_DIR"

echo "[+] The package has been installed successfully. Now you can run the following commands:"
echo "    ➤ export_users"
echo "    ➤ import_users"
