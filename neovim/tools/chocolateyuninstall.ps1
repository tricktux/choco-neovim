# File:           chocolateyuninstall.ps1
# Description:    Uninstallation of neovim
# Author:		    Reinaldo Molina
# Email:          rmolin88 at gmail dot com
# Revision:	    0.0.0
# Last Modified:  Fri Apr 20 2018 22:50
#
$packageName= 'neovim' # arbitrary name for the package, used in messages
$destDir = Join-Path $(Get-ToolsLocation) $packageName
$bin         = $destDir + '\Neovim\bin'

Write-Output "Please manually remove `"$($bin)`" from the PATH environment variable if not installing neovim again."
