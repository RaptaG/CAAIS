<div align="center">

# Chaotic-AUR Automated Install Script (CAAIS)

[![GitHub downloads](https://img.shields.io/github/downloads/RaptaG/CAAIS/total?color=3BB300&logo=github)](https://github.com/RaptaG/CAAIS/releases)
[![Total Size](https://img.shields.io/github/repo-size/RaptaG/CAAIS?color=660099&label=Total%20Size)]()
  
</div>

## What's this?

The **Chaotic-AUR Automated Install Script** (or _CAAIS_ for short) is a program (written in [Bash](https://www.gnu.org/software/bash)) which installs Chaotic-AUR **automatically** inside your system! It is based on the commands provided by [the Chaotic-AUR website](https://aur.chaotic.cx) and does pretty much everything that is shown there, with some extra options!

Chaotic-AUR is, like the AUR (Arch User Repository), availiable only on Arch-based Linux distribution. If you try to install it anywhere else, it will do nothing.

## Installation/Usage

### 1. Via the Releases Tab (recommended)

- Enter the [Releases Tab](https://github.com/RaptaG/CAAIS/releases) and download (recommended) the latest version available

- Enter the folder you downloaded CAAIS, press Right Click and then <kbd>Open in Terminal</kbd>. Then, copy the following command, paste it inside the terminal and hit <kbd>Enter</kbd>

```
chmod +x CAAIS.sh && sudo ./CAAIS.sh
```

### 2. By cloning the source code

- Open a terminal and run the command below. This will download the script and make it executable:

```
  curl -Os https://raw.githubusercontent.com/RaptaG/CAAIS/main/CAAIS.sh && chmod +x CAAIS.sh
```

- In the same terminal, run the following command, which will start the script:

```
  sudo ./CAAIS.sh
```

That's it! Now Chaotic-AUR should be installed in your system.

## Credits
  
- [terminalmaid](https://github.com/terminalmaid), for some imporant fixes and additions
- [TruncatedDinosour](https://github.com/TruncatedDinosour), for improving the original code
- [RaptaG](https://github.com/RaptaG) (myself), for the idea and for making the script itself

## Feedback/Support

You can use [the Issues section](https://github.com/RaptaG/CAAIS/issues) to report bugs, make suggestions or even ask a question.
  
## License

This project is under the [`Apache-2.0`](LICENSE) license.
