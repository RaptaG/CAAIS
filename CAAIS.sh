#!/bin/bash
# Made by RaptaG, for your peace of mind :)
echo "CAAIS, version 1.0 (by RaptaG)"

# Root permission checker
if [ $EUID -ne 0 ]; then
	echo "$(basename $0) requires root permissions. Please run: sudo ./$(basename $0)"
	echo "Exiting..."
	exit
fi

# Installing keys
echo "Installing the chaotic-aur keys..."
pacman-key --recv-key FBA220DFC880C036 --keyserver keyserver.ubuntu.com
pacman-key --lsign-key FBA220DFC880C036

# Downloading the keyring and the mirrorlist
echo "Downloading the keyring..."
pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst'
echo "Downloading the mirrorlist..."
pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'

# Adapting the Chaotic-AUR mirrorlist
echo "Adapting the mirrorlist..."
cd /etc/
echo -e "\r\n[chaotic-aur]\nInclude = /etc/pacman.d/chaotic-mirrorlist" >> pacman.conf

# Refreshing mirrorlist
echo "Refreshing the mirrorlists..."
echo -n "Doing this is needed for Chaotic-AUR to work but will also cause a system upgrade. Do you wish to continue? [Y/n] " 
read answer
case "$answer" in
  y)
    pacman -Syu
    ;;
  Y)
    pacman -Syu
    ;;
  *)
  	echo " You'll now have to refresh the mirrorlists manually, using the sudo pacman -Syu command"
    echo "Exiting..."
	exit
    ;;
esac
echo "Done! Now Chaotic-AUR should be installed and working in your system!"
echo "Exiting..."
exit