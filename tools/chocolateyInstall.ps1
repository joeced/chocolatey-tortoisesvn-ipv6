$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://osdn.net/projects/tortoisesvn/storage/1.10.0/Application/ipv6/TortoiseSVN-1.10.0.28176-win32-ipv6-svn-1.10.0.msi'
$url64      = 'https://osdn.net/projects/tortoisesvn/storage/1.10.0/Application/ipv6/TortoiseSVN-1.10.0.28176-x64-ipv6-svn-1.10.0.msi'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'msi'
  url           = $url
  url64bit      = $url64
  softwareName  = 'tortoisesvn-ipv6*' 

  # e.g. checksum -t sha256 -f path\to\file
  checksum      = '11118EEB18D356D00B9F4D85D2AC2C38C7EB2401A04F8E449B22551CD4888885'
  checksumType  = 'sha256'
  checksum64    = '76FDBC774656F87E702EF6429A4FE1A5C7867B8503C33D65BCFECD5069724E42'
  checksumType64= 'sha256'

  # MSI
  silentArgs    = "/quiet /norestart ADDLOCAL=ALL /log `"$($env:TEMP)\$($packageName).$($PackageVersion).MsiInstall.log`""
  validExitCodes=  @(0,3010)
}

Install-ChocolateyPackage @packageArgs # https://chocolatey.org/docs/helpers-install-chocolatey-package
