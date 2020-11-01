$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
. "$toolsDir\commonEnv.ps1"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = "$installLocation"
  url           = 'https://github.com//coelckers/gzdoom/releases/download/g4.5.0/gzdoom-4-5-0-Windows-64bit.zip'
  checksum      = 'af99bf22f30876f7c658badc245e44d7fcde7a4b3b9bd53639412231a0c0e42c'
  checksumType  = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs

## StartMenu
Install-ChocolateyShortcut -ShortcutFilePath "$startMenuDir\$Name.lnk" `
  -TargetPath "$installLocation\$gzdoomBin" `
  -WorkingDirectory "$installLocation"
