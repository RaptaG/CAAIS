<div align="center">

# Chaotic-AUR Automated Install Script

[![GitHub downloads](https://img.shields.io/github/downloads/RaptaG/CAAIS/total?color=158000&logo=github)](https://github.com/RaptaG/CAAIS/releases)
[![Latest release](https://img.shields.io/github/v/release/RaptaG/CAAIS?label=Latest%20release)](https://github.com/RaptaG/CAAIS/releases/tag/2.2)<br />
[![License](https://img.shields.io/github/license/RaptaG/CAAIS?label=License)](https://github.com/RaptaG/CAAIS/blob/main/LICENSE)
[![Total Size](https://img.shields.io/github/repo-size/RaptaG/CAAIS?color=660099&label=Total%20size)](https://github.com/RaptaG/CAAIS/find/main)<br/>
[![Last commit](https://img.shields.io/github/last-commit/RaptaG/CAAIS?color=lightblue&label=Last%20commit)](https://github.com/RaptaG/CAAIS/commits/main)
 
 The **Chaotic-AUR Automated Install Script** (or _CAAIS_ for short) is a program (written in [Bash](https://www.gnu.org/software/bash)) which allows you to install and remove Chaotic-AUR **automatically** inside your system! It is based on the commands provided by [the Chaotic-AUR website](https://aur.chaotic.cx), including more functions and features!

Remember, Chaotic-AUR, like the AUR (Arch User Repository), is availiable **only** on Arch based Linux distributions.

</div>

## Installation

### 1. Via the Releases Tab (recommended, stable)

- Enter the [Releases Tab](https://github.com/RaptaG/CAAIS/releases) and download the latest version available and run the following command in the folder you installed CAAIS:

```
chmod +x CAAIS
```

This will make it executable (working).

### 2. By cloning the source code (possibly unstable)

- Open a terminal and run the command below. This will download the script and make it executable:

```
curl -Os https://raw.githubusercontent.com/RaptaG/CAAIS/main/CAAIS && chmod +x CAAIS
```

## Usage

Open up a terminal inside the folder where CAAIS is installed and run one of the following, according to what you want to do:

```
sudo ./CAAIS -h or --help:            Display the help menu
sudo ./CAAIS -a or --about:           Display info related to CAAIS
sudo ./CAAIS -i or --install:         Download and install Chaotic-AUR
sudo ./CAAIS -r or --remove:          Uninstall Chaotic-AUR
```

## Feedback / Support

You can use the [Issues section](https://github.com/RaptaG/CAAIS/issues) to report bugs, make suggestions or even ask a question.

## Contact with me / Discuss about CAAIS

[GitHub Discussions](https://github.com/RaptaG/CAAIS/discussions) are available. Feel free to start a discussion there!

## Contributing

Feel free to make a PR to fix or improve my code, I'll review and consider to merge it!

## Support the project

If you like this project, you can give it a star (click the `Star ⭐` button on the top right of your screen).<br />This will help CAAIS grow more popular _and_ will make me happy :)

## Credits

- [terminalmaid](https://github.com/terminalmaid), for some imporant fixes and additions, on [#1](https://github.com/RaptaG/CAAIS/pull/1)
- [TruncatedDinosour](https://github.com/TruncatedDinosour), for improving the original code, on [#2](https://github.com/RaptaG/CAAIS/pull/2)
- [Linux.Chat](https://linux.chat/) [Discord server](https://discord.com/invite/fA7UuAAhzt), and its members who helped me with some parts of the code<br />(special thanks to [Theros](https://github.com/therosin))
- [RaptaG](https://github.com/RaptaG) (myself), for the idea and for making the script itself
