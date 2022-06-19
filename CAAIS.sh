#!/usr/bin/env bash

set -e

VERSION='1.1'

eexit() {
    echo 'Exiting...'
    exit "$1"
}

main() {
    # Made by RaptaG and me0wing-katt0, for your peace of mind :)
    echo "CAAIS, version $VERSION (by RaptaG and me0wing-katt0)"

    # Root permission checker
    if [ "$EUID" -ne 0 ]; then
        _bname="${0##*/}"

        echo "$_bname requires root permissions. Please run: su -c './$_bname'" >&2
        eexit 1
    fi

    # Installing keys
    echo 'Installing the Chaotic-AUR keys...'
    pacman-key --recv-key FBA220DFC880C036 --keyserver keyserver.ubuntu.com
    pacman-key --lsign-key FBA220DFC880C036

    # Downloading the keyring and the mirrorlist
    echo "Downloading the keyring..."
    pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst'

    echo "Downloading the mirrorlist..."
    pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'

    # Checking if Chaotic-AUR is already appended in pacman.conf, if not skip
    echo 'Appending Chaotic-AUR to the mirrorlist...'

    if grep 'chaotic-aur' /etc/pacman.conf; then
        echo 'Chaotic-AUR is already append in pacman.conf, skipping...'
        eexit 2
    else
        echo -e "\r\n[chaotic-aur]\nInclude = /etc/pacman.d/chaotic-mirrorlist" >>/etc/pacman.conf
    fi

    # Refreshing the mirrorlist
    echo 'Refreshing the mirrorlists...'

    echo -n \
        "doing this is needed for chaotic-aur to work,
but will also cause a system upgrade. do you wish to continue?
[y/N] "
    read -r yn

    case "$yn" in
    [yY]*)
        pacman -Syu
        ;;
    *)
        echo "You'll now have to refresh the mirrorlists manually, by running: su -c 'pacman -Syu'"
        eexit
        ;;
    esac

    echo 'Done! Now Chaotic-AUR should be installed and working in your system!'
    eexit
}

main "$@"
