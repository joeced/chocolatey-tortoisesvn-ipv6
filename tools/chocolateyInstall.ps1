$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://osdn.net/projects/tortoisesvn/storage/1.10.1/Application/ipv6/TortoiseSVN-1.10.1.28295-win32-ipv6-svn-1.10.2.msi'
$url64      = 'https://osdn.net/projects/tortoisesvn/storage/1.10.1/Application/ipv6/TortoiseSVN-1.10.1.28295-x64-ipv6-svn-1.10.2.msi'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'msi'
  url           = $url
  url64bit      = $url64
  softwareName  = 'tortoisesvn-ipv6*' 

  # e.g. checksum -t sha256 -f path\to\file
  checksum      = '7BDDED22E5F20EA6F37356FF613EB05B1F0FDF82F11B9B449E62B4F3151A6198'
  checksumType  = 'sha256'
  checksum64    = '19F4DDCDB679B5061DC4F6501717FEFF1578B3A0CD000DF7A99B8794EE46E436'
  checksumType64= 'sha256'

  # MSI
  silentArgs    = "/quiet /norestart ADDLOCAL=ALL /log `"$($env:TEMP)\$($packageName).$($PackageVersion).MsiInstall.log`""
  validExitCodes=  @(0,3010)
}

Install-ChocolateyPackage @packageArgs # https://chocolatey.org/docs/helpers-install-chocolatey-package
