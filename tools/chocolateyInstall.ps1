$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://osdn.net/projects/tortoisesvn/storage/1.11.0/Application/ipv6/TortoiseSVN-1.11.0.28416-win32-ipv6-svn-1.11.0.msi'
$url64      = 'https://osdn.net/projects/tortoisesvn/storage/1.11.0/Application/ipv6/TortoiseSVN-1.11.0.28416-x64-ipv6-svn-1.11.0.msi'



$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'msi'
  url           = $url
  url64bit      = $url64
  softwareName  = 'tortoisesvn-ipv6*'

  # e.g. checksum -t sha256 -f path\to\file
  checksum      = 'BDC4AED80C670F9BE752E165A7992BF723DDE73979FF0FE30F9B316D3220FEDC'
  checksumType  = 'sha256'
  checksum64    = '1992F0F95009BCACCB0F24DEC13414A879BF0880D2AD8046E202F57B41A14573'
  checksumType64= 'sha256'

  # MSI
  silentArgs    = "/quiet /norestart ADDLOCAL=ALL /log `"$($env:TEMP)\$($packageName).$($PackageVersion).MsiInstall.log`""
  validExitCodes=  @(0,3010)
}

Install-ChocolateyPackage @packageArgs # https://chocolatey.org/docs/helpers-install-chocolatey-package
