<div align="center">

# Chaotic-AUR Automated Install Script (CAAIS)
<div align="left">

## What's that?
The _Chaotic-AUR Automated Install Script_ (or _CAAIS_ for short) is a program which installs Chaotic-AUR **automatically** inside your system! It is based on the commands provided by [the Chaotic-AUR website](https://aur.chaotic.cx/) and does pretty much everything that is shown there.

## Current status
This script is sadly **not tested** by anyone yet, which means it _could_ cause problems in your system. If you are willing to test this, follow the steps below:
	
1. Create an Arch based Virtual Machine (recommended distro: EndeavourOS, offline installation)
2. After the installation is complete, follow the usage tutorial below and run the script
3. Then, run this command on a terminal: `sudo pacman -S pamac-aur`
4. When it finishes, search in your application menu for "Add/Remove Software"
5. If this application exists, make an issue and report that it worked (if it failed, report it too)

## Usage
You'll need to download the script, make executable and run it. You can do this by just run the command below, on a terminal:

```
  curl -Os https://raw.githubusercontent.com/RaptaG/CAAIS/main/CAAIS.sh && chmod +x CAAIS.sh
```
After you do that, you need to actually run this script:
```
  sudo ./CAAIS.sh
```
That's it! Now Chaotic-AUR should be installed in your system. Feel free to remove this script after the installation (optional).
  
## Feedback/Support
You can use [the Issues section](https://github.com/RaptaG/CAAIS/issues) to report bugs, make suggestions or even ask a question.
  
## License
This project uses the Apache-2.0 License. You can find more aboout this license [here](LICENSE).
  
## Credits
  
- [RaptaG](https://github.com/RaptaG), for making this repo (self-credit, lol)
- [me0wing-katt0](https://github.com/me0wing-katt0), for his huge help
	
