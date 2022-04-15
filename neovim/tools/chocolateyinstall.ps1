# File:           chocolateyinstall.ps1
# Description:    Installation of Neovim
# Author:         Reinaldo Molina
# Email:          me at molina mail dot com

$ErrorActionPreference = 'Stop'; # stop on all errors

$packageName = 'neovim' # arbitrary name for the package, used in messages
$destDir     = Join-Path $(Get-ToolsLocation) $packageName
$url64       = 'https://github.com/neovim/neovim/releases/download/v0.7.0/nvim-win64.zip' # 64bit URL here (HTTPS preferred) or remove - if installer contains both (very rare), use $url
$bin         = $destDir + '\nvim-win64\bin'

# Get user provided paramaters
# Help here: https://github.com/chocolatey/choco/wiki/HelpersGetPackageParameters
$pp = Get-PackageParameters

$packageArgs = @{
    packageName   = $packageName
    unzipLocation = $destDir
    url64bit      = $url64
    softwareName  = 'neovim*' #part or all of the Display Name as you see it in Programs and Features. It should be enough to be unique
    checksum64    = 'a72a90e2897ea296b777c325a37c981a0b51e2fe0c8b8735e3366b65e958cddc'
    checksumType64= 'sha256' #default is checksumType
    validExitCodes= @(0) #please insert other valid exit codes here
}

# https://chocolatey.org/docs/helpers-install-chocolatey-package
Install-ChocolateyZipPackage @packageArgs

# Adds neovim to the path if not present already
# Define option here and check at the same time
if ($pp['NoNeovimOnPath']) {
    Write-Output "Please note that Neovim binary folder will NOT be added to the path"
} elseif ($pp['NeovimOnPathForAll']) {
    Install-ChocolateyPath -PathToInstall $bin -PathType Machine
    Write-Output "Added Neovim binary folder to the machines's PATH variable"
} else {
    Install-ChocolateyPath -PathToInstall $bin
    Write-Output "Added Neovim binary folder to the user's PATH variable"
}

Write-Output "Please Consider donating https://github.com/sponsors/neovim"
Write-Output "Issues? Please visit https://github.com/neovim/neovim/wiki/Installing-Neovim"
