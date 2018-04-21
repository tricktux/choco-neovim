# File:           chocolateybeforemodify.ps1
# Description:    Updating neovim
# Author:		    Reinaldo Molina
# Email:          rmolin88 at gmail dot com
# Revision:	    0.0.0
# Last Modified:  Fri Apr 20 2018 22:49
#
$packageName = "neovim"
$destDir = Join-Path $(Get-ToolsLocation) $packageName
Remove-Item $destDir -Force -Recurse

# Exit with the result of the last command
exit $?
