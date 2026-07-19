#!/bin/bash

set -e

echo "===================================="
echo " Linux Mint Printer Driver Installer"
echo "===================================="

sudo apt update

sudo apt install -y \
printer-driver-all \
cups \
cups-client \
cups-bsd \
cups-filters \
cups-filters-core-drivers \
system-config-printer \
avahi-daemon \
ipp-usb \
foomatic-db \
foomatic-db-engine \
foomatic-filters \
ghostscript

# Brother
sudo apt install -y brother-cups-wrapper-common brother-lpr-drivers-extra || true

# HP
sudo apt install -y hplip hplip-gui printer-driver-hpcups || true

# Canon
sudo apt install -y printer-driver-gutenprint || true

# Epson
sudo apt install -y printer-driver-escpr || true

# Samsung
sudo apt install -y printer-driver-splix || true

# Xerox, Ricoh, Kyocera...
sudo apt install -y printer-driver-pxljr || true

sudo systemctl enable cups
sudo systemctl restart cups

sudo systemctl enable avahi-daemon
sudo systemctl restart avahi-daemon

echo
echo "===================================="
echo " Printer Drivers Installed!"
echo " Open http://localhost:631"
echo "===================================="
