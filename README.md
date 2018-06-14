# choco-neovim
Chocolatey package for the distribution of released versions of [neovim](https://neovim.io/)

## Version upgrade checklist
- [ ] nuspec: update on the `version` tag.
- [ ] chocolateyinstall.ps1: update `$url` and `$url64`
- [ ] chocolateyinstall.ps1: update the `checksum` and `checksum64`
	- `"c:\ProgramData\chocolatey\tools\checksum.exe" nvim-win32.zip -t=sha256`
	- The checksum `-t` depends on what you have specified in your `checksumType`

## Installation Instructions
- Install [chocolatey](https://chocolatey.org/install)
- From command line `choco install neovim`
- Or `choco install neovim --pre`

## Dev Instructions
- Always pack after making any changes
- `choco pack`
### Testing beta version
- `choco install neovim --pre -s '%cd%' -fy`
- `choco uninstall neovim --pre -s '%cd%' -fy`
### Testing regular version
- `choco install neovim -s '%cd%' -fy`
- `choco uninstall neovim -s '%cd%' -fy`
### Pushing changes
- `choco apikey --key <key> --source https://push.chocolatey.org` 
- `choco push <package> --source https://push.chocolatey.org` 
