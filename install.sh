#!/bin/bash
# Windows RDP Installer - 100% Independent (Nizwarax/Rdp)
# No dependency on bin456789
# Repo: https://github.com/Nizwarax/Rdp

set -e

DEFAULT_PASS="Rdp123@@"
DEFAULT_IMAGE="Windows Server 2022 SERVERDATACENTER"
PASSWORD="$DEFAULT_PASS"
IMAGE_NAME="$DEFAULT_IMAGE"

while [[ $# -gt 0 ]]; do
  case "$1" in
    --password) PASSWORD="$2"; shift 2;;
    --image-name) IMAGE_NAME="$2"; shift 2;;
    --iso) ISO_URL="$2"; shift 2;;
    *) shift;;
  esac
done

if [ "$EUID" -ne 0 ]; then
  echo "Please run as root: sudo $0"
  exit 1
fi

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

# If reinstall.sh not exists in current dir, use local
if [ ! -f "$SCRIPT_DIR/reinstall.sh" ]; then
  echo "reinstall.sh not found in $SCRIPT_DIR"
  exit 1
fi

# Patch confhome to use Nizwarax/Rdp instead of bin456789
cp "$SCRIPT_DIR/reinstall.sh" /tmp/reinstall.local.sh
sed -i "s|confhome=https://raw.githubusercontent.com/Nizwarax/Rdp/main|confhome=https://raw.githubusercontent.com/Nizwarax/Rdp/main|g" /tmp/reinstall.local.sh
sed -i "s|confhome_cn=.*|confhome_cn=https://raw.githubusercontent.com/Nizwarax/Rdp/main|g" /tmp/reinstall.local.sh

echo ""
echo "***** Windows RDP Installer (Independent) *****"
echo "Image: $IMAGE_NAME"
echo "Password: $PASSWORD"
echo ""

read -p "Type YES to continue (disk will be formatted!): " CONF
if [ "$CONF" != "YES" ]; then
  echo "Cancelled."
  exit 0
fi

bash /tmp/reinstall.local.sh windows --image-name "$IMAGE_NAME" --lang en --password "$PASSWORD" --allow-ping ${ISO_URL:+--iso $ISO_URL}

IP=$(curl -s http://ifconfig.me 2>/dev/null || echo "IP_VPS")
echo ""
echo "========================================="
echo "  VPS AKAN REBOOT DAN INSTALL WINDOWS"
echo "========================================="
echo "Tunggu 10-20 menit, jangan matikan VPS!"
echo "Abis itu konek RDP: $IP:3389"
echo "User: Administrator"
echo "Pass: $PASSWORD"
echo "Kalau gagal login, coba: .\Administrator"
echo "========================================="
echo "Ketik: reboot"
