$packageName= 'neovim' # arbitrary name for the package, used in messages
$destDir = Join-Path $(Get-ToolsLocation) $packageName
Remove-Item $destDir -Force -Recurse
exit $?
