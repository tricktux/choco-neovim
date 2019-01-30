# File:           chocolateyinstall.ps1
# Description:    Installation of Neovim
# Author:		    Reinaldo Molina
# Email:          rmolin88 at gmail dot com
# Revision:	    0.0.0
# Last Modified:  Fri Apr 20 2018 23:04

$ErrorActionPreference = 'Stop'; # stop on all errors
$packageName= 'neovim' # arbitrary name for the package, used in messages
$destDir = Join-Path $(Get-ToolsLocation) $packageName
$url        = 'https://github.com/neovim/neovim/releases/download/v0.3.4/nvim-win32.zip' # download url, HTTPS preferred
$url64      = 'https://github.com/neovim/neovim/releases/download/v0.3.4/nvim-win64.zip' # 64bit URL here (HTTPS preferred) or remove - if installer contains both (very rare), use $url
$bin         = $destDir + '\Neovim\bin'

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $destDir
  url           = $url
  url64bit      = $url64

  softwareName  = 'neovim*' #part or all of the Display Name as you see it in Programs and Features. It should be enough to be unique

  checksum      = '73AC0758E71CF33F8E8231FA221F17499A778771451BF426AB046B19AE888753'
  checksumType  = 'sha256' #default is md5, can also be sha1, sha256 or sha512
  checksum64    = '2E8FA4F4324B5449334F8B97268E2801330C19F9C09C57922E2A3E171D03FAD8'
  checksumType64= 'sha256' #default is checksumType

  validExitCodes= @(0) #please insert other valid exit codes here
}

# https://chocolatey.org/docs/helpers-install-chocolatey-package
Install-ChocolateyZipPackage @packageArgs

# Adds neovim to the path if not present already
Install-ChocolateyPath -PathToInstall $bin

Write-Output "Please Consider donating https://salt.bountysource.com/teams/neovim"
Write-Output "Issues? Please visit https://github.com/neovim/neovim/wiki/Installing-Neovim"
