#!/bin/bash
# Made by RaptaG, terminalmaid and TruncatedDinosour
set -e

# Definitions
ver="1.7"
fname="$(basename $0)"
GHrelease="https://github.com/RaptaG/CAAIS/releases/tag/$ver"

# Startup message
echo "CAAIS, version $ver (by RaptaG, terminalmaid and TruncatedDinosour)"

# Root permission checker
if [ "$EUID" -ne 0 ]; then
     echo -e "Error: Root permissions are required for $fname to work.\nPlease run: sudo ./$fname"
     exit 1
fi

# Download & install Chaotic-AUR
caais-get() {
    # Download & install the Chaotic-AUR key
    echo "Installing the Chaotic-AUR key..."
    pacman-key --recv-key FBA220DFC880C036 --keyserver keyserver.ubuntu.com > /dev/null 2>&1
    pacman-key --lsign-key FBA220DFC880C036 > /dev/null 2>&1

    # Download its keyring and mirrorlist
    echo "Downloading its keyring..."
    pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst' --noconfirm > /dev/null 2>&1

    echo "Downloading its mirrorlist..."
    pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst' --noconfirm > /dev/null 2>&1

    # Check if it's already appended in pacman.conf, if not skip
    appendInPacmanConf=$(grep 'chaotic-aur' /etc/pacman.conf)

    if [ $appendInPacmanConf == "[chaotic-aur]" ]; then
        echo "Chaotic-AUR is already append in pacman.conf, skipping..."
    else
        echo "Appending Chaotic-AUR to the mirrorlist..."
        echo -e "\r\n[chaotic-aur]\nInclude = /etc/pacman.d/chaotic-mirrorlist" >> /etc/pacman.conf
    fi

    # Refresh the mirrorlists so that it can be activated
    echo "Refreshing the mirrorlists..."
    pacman -Sy

    # Finish message
    echo "Done! Now Chaotic-AUR should be installed and working in your system!"
    exit 0
}

# Uninstall Chaotic-AUR
caais-remove() {
    # Delete the Chaotic-AUR key
    echo "Deleting the Chaotic-AUR key..."
    pacman-key --delete 3FFA0B5E092ED4095E26F69B8ADB4AEC585061CF > /dev/null 2>&1

    # Uninstall its keyring
    echo "Uninstalling its keyring..."
    pacman -Rns chaotic-keyring --no-confirm > /dev/null 2>&1
    
    # Uninstall its mirrorlist
    echo "Uninstalling the mirrorlist..."
    pacman -Rns chaotic-mirrorlist --no-confirm > /dev/null 2>&1

    # Remove Chaotic-AUR from pacman.conf
    echo "Removing Chaotic-AUR from pacman.conf..."
    

    # Refresh the mirrorlists
    echo "Refreshing the mirrorlists..."
    pacman -Sy

    # Finish message
    echo "Done! Now Chaotic-AUR should be removed from your system."
    exit 0
}

# Select if you want to delete CAAIS
delete-caais() {
    echo -n "Warning: This will remove CAAIS completely from your system. Are you sure you want to proceed [Y/n] "
    read answer
    
    case "$answer" in
    [yY]* | "")
        echo "Deleting..."
        rm $fname
        echo -e "Remember, you can always reinstall CAAIS in case you want to remove Chaotic-AUR:\n$GHrelease"
        exit 0
        ;;
    *)
        exit 0
        ;;
    esac
}


# Find the option selected and run the correct command
case "$1" in
-h | --help)
    echo -e "Usage: $fname [OPTION]\n"
    echo -e "\n-h, --help       This help menu\n"
    echo -e "\n-v, --version    Display the version of CAAIS you currently use\n"
    echo -e "\n-d, --delete     Delete CAAIS (NOT Chaotic-AUR)\n"
    echo -e "\n-i, --install    Download and install Chaotic-AUR\n"
    echo -e "\n-r, --remove     Remove Chaotic-AUR from your system\n"
    echo -e "\nThe main repo with the source code, the license and all the info related is availiable here:\nhttps://github.com/RaptaG/CAAIS"
    ;;
-v | --version)
    echo -e "CAAIS, version $ver\n$GHrelease"
    ;;
-d | --delete)
    delete-caais "$@"
-i | --install)
    caais-get "$@"
    ;;
-r | --remove)
    caais-remove "$@"
    ;;
*)
    echo "Invalid option '$1'. Please run 'sudo ./$fname --help' for more information."
    exit 1
    ;;
esac
