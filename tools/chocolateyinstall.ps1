$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
. "$toolsDir\commonEnv.ps1"

$url = 'https://zdoom.org/files/gzdoom/bin/gzdoom-bin-4-1-3-x64.zip'
$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = "$installLocation" # Install-ChocolateyZipPackage
  url           = $url # download url, HTTPS preferred
  softwareName  = 'gzdoom*' #part or all of the Display Name as you see it in Programs and Features. It should be enough to be unique
  checksum      = '139DC50192E1A451D7710703FC7E54B4' # %chocolateyinstall%\tools\checksum.exe
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
