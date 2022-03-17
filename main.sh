#!/bin/bash
sudo apt update && sudo apt upgrade
sudo pacman -Syu
sudo dnf upgrade
sudo zypper update
sudo apt install -y linux-headers-$(uname -r) build-essential dkms git libelf-dev
sudo apt install -y dkms git build-essential
sudo dnf -y install git dkms kernel-devel kernel-debug-devel
sudo zypper install -t pattern devel_kernel dkms
sudo eopkg install gcc linux-current-headers make git binutils
sudo pacman -S --noconfirm linux-headers dkms git
git clone https://github.com/morrownr/8821au-20210708.git
cd 8821au-20210708
no | sudo ./install-driver.sh
echo "The driver is installed, restart the PC or reinstall the adapter"
