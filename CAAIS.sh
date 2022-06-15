#!/bin/bash
# Made by RaptaG and me0wing-katt0, for your peace of mind :)
echo "CAAIS, version 1.1 (by RaptaG and me0wing-katt0)"

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

# Checking if chaotic-aur is already appended, if not exit
echo "Appending chaotic AUR to the mirrorlist..."
cd /etc/
if ! grep "chaotic-aur" /etc/pacman.conf; then
  echo -e "\r\n[chaotic-aur]\nInclude = /etc/pacman.d/chaotic-mirrorlist" >> pacman.conf
else
  echo "chaotic AUR is already added, exiting..."
  exit 1
fi

# Refreshing the mirrorlist
echo "Refreshing the mirrorlists..."
echo -n "Doing this is needed for chaotic AUR to work but will also cause a system upgrade. Do you wish to continue? [Y/n] " 
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
echo "Done! Now chaotic AUR should be installed and working in your system!"
echo "Exiting..."
exit
