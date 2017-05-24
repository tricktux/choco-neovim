$destDir = Join-Path Get-ToolsLocation $packageName
Remove-Item $destDir -Force -Recurse
