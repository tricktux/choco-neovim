$packageName= 'neovim' # arbitrary name for the package, used in messages
$destDir = Join-Path $(Get-ToolsLocation) $packageName

$nvim = $destDir + '\Neovim\bin\nvim-qt.exe'
Uninstall-BinFile -Name 'nvim-qt' -Path $nvim
$tee = $destDir + "\Neovim\bin\tee.exe"
Uninstall-BinFile -Name 'tee' -Path $tee
$tidy = $destDir + "\Neovim\bin\tidy.exe"
Uninstall-BinFile -Name 'tidy' -Path $tidy
$winYank = $destDir + "\Neovim\bin\win32yank.exe"
Uninstall-BinFile -Name 'win32yank' -Path $winYank
$agent = $destDir + "\Neovim\bin\winpty-agent.exe"
Uninstall-BinFile -Name 'winpty-agent' -Path $agent
$cat = $destDir + "\Neovim\bin\cat.exe"
Uninstall-BinFile -Name 'cat' -Path $cat
$diff = $destDir + "\Neovim\bin\diff.exe"
Uninstall-BinFile -Name 'diff' -Path $diff
$exe = $destDir + "\Neovim\bin\nvim.exe"
Uninstall-BinFile -Name 'nvim' -Path $exe
