#!/bin/bash
echo "Hi, I will install the driver for you now"
echo "Now I'm updating the repositories and your system"
{
  sudo apt update && sudo apt upgrade;
  sudo pacman -Syu;
  sudo dnf upgrade;
  sudo zypper update;
}&>/dev/null
echo "Now I install the necessary utilities for the driver"
{
  sudo apt install -y linux-headers-$(uname -r) build-essential dkms git libelf-dev;
  sudo apt install -y dkms git build-essential;
  sudo dnf -y install git dkms kernel-devel kernel-debug-devel;
  sudo zypper install -t pattern devel_kernel dkms;
  sudo eopkg install gcc linux-current-headers make git binutils;
  sudo pacman -S --noconfirm linux-headers dkms git;
}&>/dev/null
echo "Finally I start installing the driver. P.S. It may take longer, so don't stop me"
{
  git clone https://github.com/morrownr/8821au-20210708.git;
  cd 8821au-20210708;
  no | sudo ./install-driver.sh;
}&>/dev/null
echo "The driver is installed, restart the PC or reinstall the adapter"
