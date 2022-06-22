#!/bin/bash
# Made by RaptaG and me0wing-katt0, for your peace of mind :)

# Crash Checker
set -e

# Definitions
ver=1.1
fname=$0

caais-exit() {
    echo 'Exiting...'
    exit "$1"
}

# Starting message
echo 'CAAIS, version $ver (by RaptaG and me0wing-katt0)'

# Root permission checker
if [ "$EUID" -ne 0 ]; then
     echo 'Error: $fname requires root permissions. Please run: sudo ./$fname'
     caais-exit 1
fi

# Main script
main() {
    # Installing keys
    echo 'Installing the Chaotic-AUR keys...'
    pacman-key --recv-key FBA220DFC880C036 --keyserver keyserver.ubuntu.com
    pacman-key --lsign-key FBA220DFC880C036

    # Downloading the keyring and the mirrorlist
    echo 'Downloading the keyring...'
    pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst'

    echo 'Downloading the mirrorlist...'
    pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'

    # Checking if Chaotic-AUR is already appended in pacman.conf, if not skip
    echo 'Appending Chaotic-AUR to the mirrorlist...'

    if grep 'chaotic-aur' /etc/pacman.conf; then
        echo 'Chaotic-AUR is already append in pacman.conf, skipping...'
    else
        echo -e '\r\n[chaotic-aur]\nInclude = /etc/pacman.d/chaotic-mirrorlist' >> /etc/pacman.conf
    fi

    # Refreshing the mirrorlist
    echo 'Refreshing the mirrorlists...'

    echo -n "Doing this is needed for Chaotic-AUR to work, but will also cause a system upgrade. Do you wish to continue? [Y/n] "
    read answer

    case "$answer" in
    [yY]*)
        pacman -Syu
        ;;
    *)
        echo 'You'll now have to refresh the mirrorlists manually, by running: sudo pacman -Syu'
        caais-exit
        ;;
    esac
}

# Running the script
main "$@"
echo 'Done! Now Chaotic-AUR should be installed and working in your system!'
caais-exit
