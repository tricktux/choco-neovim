# choco-neovim

Chocolatey package for the distribution of released versions of [neovim](https://neovim.io/)

## Version upgrade checklist

- [ ] nuspec: update `version` tag.
- [ ] nuspec: update `release notes` tag.
- [ ] chocolateyinstall.ps1: update `$url` and `$url64`
- [ ] chocolateyinstall.ps1: update the `checksum` and `checksum64`
	- `"c:\ProgramData\chocolatey\tools\checksum.exe" nvim-win32.zip -t=sha256`
	- The checksum `-t` depends on what you have specified in your `checksumType`

## Installation Instructions

- Install [chocolatey](https://chocolatey.org/install)
- From command line `choco install neovim`
- Or `choco install neovim --pre`

# Dev Instructions

## Docker

- Instructions to setup the container, where `choco-neovim` is this repo.

```sh
sudo docker pull chocolatey/choco   
sudo docker run -ti --rm -v $PWD/choco-neovim:/data chocolatey/choco:latest /bin/bash
```
- Always pack after making any changes

```cmd
choco pack
```

## Testing beta version

```cmd
choco install neovim --pre -s '%cd%' -fy
choco uninstall neovim --pre -s '%cd%' -fy
```

## Testing regular version

```cmd
choco install neovim --source . -fy
choco uninstall neovim --source . -fy
```

## Pushing changes

```cmd
choco apikey --key <key> --source https://push.chocolatey.org
choco push <package> --source https://push.chocolatey.org

# Or in one command

choco push <package> --api-key <key> --source https://push.chocolatey.org
```
