# File:           chocolateybeforemodify.ps1
# Description:    Updating neovim

$packageName = "neovim"
$destDir = Join-Path $(Get-ToolsLocation) $packageName
Remove-Item $destDir -Force -Recurse

# Exit with the result of the last command
exit $?
