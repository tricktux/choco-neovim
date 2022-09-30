# File:           chocolateyuninstall.ps1
# Description:    Uninstallation of neovim

$packageName= 'neovim' # arbitrary name for the package, used in messages
$destDir = Join-Path $(Get-ToolsLocation) $packageName
$bin         = $destDir + '\nvim-win64\bin'

Write-Output "==> Please manually remove `"$($bin)`" from the PATH environment variable if not installing neovim again."
