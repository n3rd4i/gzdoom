$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
. "$toolsDir\commonEnv.ps1"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = "$installLocation"
  url           = 'https://github.com/coelckers/gzdoom/releases/download/g4.3.3/gzdoom-4-3-3-Windows-64bit.zip'
  checksum      = '85A08A81EE894C41EA851D8D4917E8AC0FCF5DAD2185FAFEBED83A93C55F9E37'
  checksumType  = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs

## StartMenu
Install-ChocolateyShortcut -ShortcutFilePath "$startMenuDir\$Name.lnk" `
  -TargetPath "$installLocation\$gzdoomBin" `
  -WorkingDirectory "$installLocation"
