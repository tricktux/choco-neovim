$packageName = "neovim"
$tools = Get-ToolsLocation 
$destDir = Join-Path $tools $packageName
Remove-Item $destDir -Force -Recurse
exit $?
