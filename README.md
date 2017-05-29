# choco-neovim
Chocolatey package for the distribution of released versions of [Nvim](https://neovim.io/)

## Installation Instructions
- Install [chocolatey](https://chocolatey.org/install)
- From command line `choco install neovim`

## Dev Instructions
- Always pack after making any changes
- `choco pack`
- Testing beta version
- `choco install neovim --pre -s '%cd%' -fy`
- `choco uninstall neovim --pre -s '%cd%' -fy`
- Testing regular version
- `choco install neovim -s '%cd%' -fy`
- `choco uninstall neovim -s '%cd%' -fy`
- Pushing changes
- `choco apikey --key <key> --source https://push.chocolatey.org` 
- `choco push <package> --source https://push.chocolatey.org` 
