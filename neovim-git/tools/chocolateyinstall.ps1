$ErrorActionPreference = 'Stop'; # stop on all errors

$packageName= 'neovim' # arbitrary name for the package, used in messages
$destDir = Join-Path $(Get-ToolsLocation) $packageName
$url        = 'https://github.com/neovim/neovim/releases/download/nightly/nvim-win32.zip' # download url, HTTPS preferred
$url64      = 'https://github.com/neovim/neovim/releases/download/nightly/nvim-win64.zip' # 64bit URL here (HTTPS preferred) or remove - if installer contains both (very rare), use $url


# Write-Output $destDir
$packageArgs = @{
	packageName   = $packageName
	unzipLocation = $destDir
	url           = $url
	url64bit      = $url64

	softwareName  = 'neovim*' #part or all of the Display Name as you see it in Programs and Features. It should be enough to be unique

	checksum      = ''
	checksumType  = 'sha256' #default is md5, can also be sha1, sha256 or sha512
	checksum64    = ''
	checksumType64= 'sha256' #default is checksumType

	validExitCodes= @(0) #please insert other valid exit codes here
}

Install-ChocolateyZipPackage @packageArgs # https://chocolatey.org/docs/helpers-install-chocolatey-package

$nvim = $destDir + '\Neovim\bin\nvim-qt.exe'
Install-BinFile -Name 'nvim-qt' -Path $nvim -UseStart true
$tee = $destDir + "\Neovim\bin\tee.exe"
Install-BinFile -Name 'tee' -Path $tee
$tidy = $destDir + "\Neovim\bin\tidy.exe"
Install-BinFile -Name 'tidy' -Path $tidy
$winYank = $destDir + "\Neovim\bin\win32yank.exe"
Install-BinFile -Name 'win32yank' -Path $winYank
$agent = $destDir + "\Neovim\bin\winpty-agent.exe"
Install-BinFile -Name 'winpty-agent' -Path $agent
$cat = $destDir + "\Neovim\bin\cat.exe"
Install-BinFile -Name 'cat' -Path $cat
$diff = $destDir + "\Neovim\bin\diff.exe"
Install-BinFile -Name 'diff' -Path $diff
$exe = $destDir + "\Neovim\bin\nvim.exe"
Install-BinFile -Name 'nvim' -Path $exe

Write-Output "Please Consider donating https://salt.bountysource.com/teams/neovim"
Write-Output "Issues? Please visit https://github.com/neovim/neovim/wiki/Installing-Neovim"
