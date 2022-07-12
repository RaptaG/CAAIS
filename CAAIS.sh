#!/bin/bash
# Made by RaptaG, terminalmaid and TruncatedDinosour for your peace of mind :)

# Crash checker
set -e

# Definitions
ver=1.4
fname=$(basename $0)

caais-exit() {
    echo 'Exiting...'
    exit "$1"
}

# Starting message
echo 'CAAIS, version $ver (by RaptaG, terminalmaid and TruncatedDinosour)'

# Root permission checker
if [ "$EUID" -ne 0 ]; then
     echo 'Error: $fname requires root permissions. Please run: sudo ./$fname'
     caais-exit 1
fi

# Main script
caais() {
    # Installing keys
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

    if [ $appendInPacmanConf -eq 0 ]; then
        echo 'Chaotic-AUR is already append in pacman.conf, skipping...'
    else
        echo -e '\r\n[chaotic-aur]\nInclude = /etc/pacman.d/chaotic-mirrorlist' >> /etc/pacman.conf
    fi

    # Refreshing the mirrorlist
    echo 'Refreshing the mirrorlists...'

    echo -n 'Doing this is needed for Chaotic-AUR to work, but will also cause a system upgrade. Do you wish to continue? [Y/n] '
    read answer

    case "$answer" in
    [yY]* | "")
        pacman -Syu
        ;;
    *)
        echo "You'll now have to refresh the mirrorlists manually, by running: sudo pacman -Syu"
        caais-exit
        ;;
    esac
    unset answer
}

# Select if you want to delete the script
delete-caais() {
    echo -n 'Since Chaotic-AUR is installed, this program has no use. Would you like to delete it [Y/n] '
    read answer
    
    case "$answer" in
    [yY]* | "")
        echo 'Deleting...'
        rm $fname
        caais-exit
        ;;
    *)
        caais-exit
        ;;
    esac
}

# Running the script
caais "$@"
echo 'Done! Now Chaotic-AUR should be installed and working in your system!'
delete-caais "$@"
