$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://downloads.sourceforge.net/project/tortoisesvn/1.9.7/Application/ipv6/TortoiseSVN-1.9.7.27907-win32-ipv6-svn-1.9.7.msi'
$url64      = 'https://downloads.sourceforge.net/project/tortoisesvn/1.9.7/Application/ipv6/TortoiseSVN-1.9.7.27907-x64-ipv6-svn-1.9.7.msi'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'msi'
  url           = $url
  url64bit      = $url64
  softwareName  = 'tortoisesvn-ipv6*' 

  # e.g. checksum -t sha256 -f path\to\file
  checksum      = '718ABBA18AA1B15D7DDF6CEE99872C41CA0B8288A470F3DE9F818376711EFA1A'
  checksumType  = 'sha256'
  checksum64    = '7BB37264D25978F146963A47F691CF262469C73FE6B7901ED0983EBAD5F869A1'
  checksumType64= 'sha256'

  # MSI
  silentArgs    = "/quiet /norestart ADDLOCAL=ALL /log `"$($env:TEMP)\$($packageName).$($PackageVersion).MsiInstall.log`""
  validExitCodes=  @(0,3010)
}

Install-ChocolateyPackage @packageArgs # https://chocolatey.org/docs/helpers-install-chocolatey-package
