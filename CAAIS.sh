#!/bin/bash
# Made by RaptaG, terminalmaid and TruncatedDinosour for your peace of mind :)
set -e

# Definitions
ver=1.6
fname=$(basename $0)

caais-exit() {
    echo 'Exiting...'
    exit "$1"
}

# Starting message
echo "CAAIS, version $ver (by RaptaG, terminalmaid and TruncatedDinosour)"

# Root permission checker
if [ "$EUID" -ne 0 ]; then
     echo -e "Error: Root permissions are required for $fname to work.\nPlease run: sudo ./$fname"
     caais-exit 1
fi

# Main script
caais() {
    # Installing the Chaotic-AUR keys
    echo 'Installing the Chaotic-AUR keys...'
    pacman-key --recv-key FBA220DFC880C036 --keyserver keyserver.ubuntu.com > /dev/null 2>&1
    pacman-key --lsign-key FBA220DFC880C036 > /dev/null 2>&1

    # Downloading the keyring and the mirrorlist
    echo 'Downloading the keyring...'
    pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst' --noconfirm > /dev/null 2>&1

    echo 'Downloading the mirrorlist...'
    pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst' --noconfirm > /dev/null 2>&1

    # Checking if Chaotic-AUR is already appended in pacman.conf, if not skip
    echo 'Appending Chaotic-AUR to the mirrorlist...'
    appendInPacmanConf=$(grep 'chaotic-aur' /etc/pacman.conf)

    if [ $appendInPacmanConf == "[chaotic-aur]" ]; then
        echo 'Chaotic-AUR is already append in pacman.conf, skipping...'
    else
        echo -e '\r\n[chaotic-aur]\nInclude = /etc/pacman.d/chaotic-mirrorlist' >> /etc/pacman.conf
    fi

    # Refreshing the mirrorlists so that Chaotic-AUR can be activated
    echo 'Refreshing the mirrorlists...'
    pacman -Sy
}

# Select if you want to delete the script
delete-caais() {
    echo -n 'Since Chaotic-AUR is installed, this file has no use. Would you like to delete it [Y/n] '
    read answer
    
    case "$answer" in
    [yY]* | "")
        echo 'Deleting...'
        rm $fname
        caais-exit 0
        ;;
    *)
        caais-exit 0
        ;;
    esac
}

# Running the script
caais "$@"
echo 'Done! Now Chaotic-AUR should be installed and working in your system!'
delete-caais "$@"
