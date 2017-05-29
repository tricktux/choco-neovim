$packageName= 'neovim' # arbitrary name for the package, used in messages
$tools = Get-ToolsLocation 
$destDir = Join-Path $tools $packageName
Remove-Item $destDir -Force -Recurse
exit $?
