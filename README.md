<div align="center">

# Chaotic-AUR Automated Install Script (CAAIS)

[![GitHub downloads](https://img.shields.io/github/downloads/RaptaG/CAAIS/total?color=3BB300&logo=github)](https://github.com/RaptaG/CAAIS/releases)
[![Total Size](https://img.shields.io/github/repo-size/RaptaG/CAAIS?color=660099&label=Total%20Size)](https://github.com/RaptaG/CAAIS/find/main)

The **Chaotic-AUR Automated Install Script** (or _CAAIS_ for short) is a program (written in [Bash](https://www.gnu.org/software/bash)) which installs Chaotic-AUR **automatically** inside your system! It is based on the commands provided by [the Chaotic-AUR website](https://aur.chaotic.cx) and does pretty much everything that is shown there, with some extra options!

Chaotic-AUR is, like the AUR (Arch User Repository), availiable only on Arch-based Linux distributions. If you try to install it anywhere else, CAAIS will tell that you that trying to install Chaotic-AUR there is impossible. Also, since Chaotic-AUR is preinstalled in Garuda Linux, CAAIS will also tell you to that it's useless there.

</div>

## Installation/Usage

### 1. Via the Releases Tab (recommended, stable)

- Enter the [Releases Tab](https://github.com/RaptaG/CAAIS/releases) and download the latest version available

- Enter the folder you downloaded CAAIS, press Right Click -> <kbd>Open in Terminal</kbd>. Then, copy the following command, paste it inside the terminal and hit <kbd>Enter</kbd>

```
chmod +x CAAIS.sh && sudo ./CAAIS --install
```

### 2. By cloning the source code (unstable)

- Open a terminal and run the command below. This will download the script and make it executable:

```
  curl -Os https://raw.githubusercontent.com/RaptaG/CAAIS/main/CAAIS && chmod +x CAAIS
```

- In the same terminal, run the following command, which will start the script:

```
  sudo ./CAAIS --install
```

That's it! Now Chaotic-AUR should be installed in your system.

## Credits
  
- [terminalmaid](https://github.com/terminalmaid), for some imporant fixes and additions, on [#1](https://github.com/RaptaG/CAAIS/pull/1)
- [TruncatedDinosour](https://github.com/TruncatedDinosour), for improving the original code, on [#2](https://github.com/RaptaG/CAAIS/pull/2)
- [Linux.Chat](https://linux.chat/) [Discord server](https://discord.com/invite/fA7UuAAhzt), and its member who helped me with some parts of the code <br />(special thanks to [Theros](https://github.com/therosin))
- [RaptaG](https://github.com/RaptaG) (myself), for the idea and for making the script itself

## Feedback/Support

You can use [the Issues section](https://github.com/RaptaG/CAAIS/issues) to report bugs, make suggestions or even ask a question.
  
## License

This project is licensed under the [`Apache-2.0`](LICENSE) license.
