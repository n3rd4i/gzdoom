$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
. "$toolsDir\commonEnv.ps1"

$url = 'https://github.com/coelckers/gzdoom/releases/download/g4.2.0/gzdoom-bin-4-2-0-Windows-x64.zip'
$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = "$installLocation"
  url           = $url
  softwareName  = 'gzdoom*'
  checksum      = '09331AF60F53D9DB7CC6F23A90871D9F890E7C66CC4AB7B6484FDBB127D4C4F1'
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
