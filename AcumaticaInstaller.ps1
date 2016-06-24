
$downloadsPath = "C:\Downloads"

#Make sure the path exists where we watn to download to.
if(!(Test-Path -Path $downloadsPath))
{
    New-Item -ItemType directory -Path $downloadsPath
}

$source = "https://builds.acumatica.com/builds/5.20/5.20.1757/AcumaticaERP/AcumaticaERPInstall.msi"
$target = "$downloadsPath\AcumaticaERPInstall.msi"

#download the Acumatica installer
$webclient = New-Object System.Net.WebClient
$webclient.DownloadFile($source,$target)

#Run the installer
msiexec /i $target /quiet /qn /norestart /log $downloadsPath\install.log
