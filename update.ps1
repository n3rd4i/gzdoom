import-module au

$domain   = 'https://github.com'
$releases = "$domain/coelckers/gzdoom/releases"

function global:au_SearchReplace {
  @{
    ".\tools\chocolateyInstall.ps1" = @{
      "(?i)(^\s*url\s*=\s*)('.*')"          = "`$1'$($Latest.URL32)'"
      "(?i)(^\s*checksum\s*=\s*)('.*')"   	= "`$1'$($Latest.Checksum32)'"
    }
  }
}

# https://github.com/coelckers/gzdoom/releases/download/g4.4.2/gzdoom-4-4-2-Windows-64bit.zip
function global:au_GetLatest {
  $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing #1
  $regex   = '-Windows-64bit.zip$'
  $url_raw     = $download_page.links | ? href -match $regex | select -First 1 -expand href #2
  $url = "$domain/$url_raw"

  $token = $url_raw -split 'gzdoom-' | select -First 1 -Skip 1 #3
  $raw_version = $token -split '-Windows-64bit.zip' | select -Last 1 -Skip 1 #3
  $version = $raw_version -replace '-','.'
  return @{ Version = $version; URL32 = $url }
}

update -ChecksumFor 32
