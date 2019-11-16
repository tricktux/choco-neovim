# File:           chocolateyinstall.ps1
# Description:    Installation of Neovim
# Author:		    Reinaldo Molina
# Email:          rmolin88 at gmail dot com
# Revision:	    0.0.0
# Last Modified:  Fri Apr 20 2018 23:04

$ErrorActionPreference = 'Stop'; # stop on all errors
$packageName= 'neovim' # arbitrary name for the package, used in messages
$destDir = Join-Path $(Get-ToolsLocation) $packageName
$url        = 'https://github.com/neovim/neovim/releases/download/v0.4.3/nvim-win32.zip' # download url, HTTPS preferred
$url64      = 'https://github.com/neovim/neovim/releases/download/v0.4.3/nvim-win64.zip' # 64bit URL here (HTTPS preferred) or remove - if installer contains both (very rare), use $url
$bin         = $destDir + '\Neovim\bin'

# Get user provided paramaters
# Help here: https://github.com/chocolatey/choco/wiki/HelpersGetPackageParameters
$pp = Get-PackageParameters

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $destDir
  url           = $url
  url64bit      = $url64

  softwareName  = 'neovim*' #part or all of the Display Name as you see it in Programs and Features. It should be enough to be unique

	checksum      = '4f63f55697afaf4d9f82204768fd7ad3e98cc554f2745afd4a160d50a63d1025'
  checksumType  = 'sha256' #default is md5, can also be sha1, sha256 or sha512
	checksum64    = '549fd985e3e6207dc3d52d17fb2bc7957adc264f20b525fc7e62f8dc8c597931'
  checksumType64= 'sha256' #default is checksumType

  validExitCodes= @(0) #please insert other valid exit codes here
}

# https://chocolatey.org/docs/helpers-install-chocolatey-package
Install-ChocolateyZipPackage @packageArgs

# Adds neovim to the path if not present already
# Define option here and check at the same time
if (!$pp['NoNeovimOnPath']) {
	Install-ChocolateyPath -PathToInstall $bin
        Write-Output "Added Neovim binary folder to the user's PATH variable"

} else {
        Write-Output "Please note that Neovim binary folder will NOT be added to the path"
}

Write-Output "Please Consider donating https://salt.bountysource.com/teams/neovim"
Write-Output "Issues? Please visit https://github.com/neovim/neovim/wiki/Installing-Neovim"
