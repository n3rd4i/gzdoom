$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
. "$toolsDir\commonEnv.ps1"

$url = 'https://github.com/coelckers/gzdoom/releases/download/g4.2.1/gzdoom-4-2-1-Windows-64bit.zip'
$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = "$installLocation"
  url           = $url
  softwareName  = 'gzdoom*'
  checksum      = '434D576C823BEA78D83364C8890707D76D1F38EBC47AC4E3E743A97F2D993EAC'
  checksumType  = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs

## StartMenu
Install-ChocolateyShortcut -ShortcutFilePath "$startMenuDir\$Name.lnk" `
  -TargetPath "$installLocation\$gzdoomBin" `
  -WorkingDirectory "$installLocation"

## Desktop
# Install-ChocolateyShortcut -ShortcutFilePath "$lnkDesktop" `
#   -TargetPath "$installLocation\$gzdoomBin" `
#   -WorkingDirectory "$installLocation"
