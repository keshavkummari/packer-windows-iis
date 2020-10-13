Import-Module ServerManager 
Add-WindowsFeature Web-Scripting-Tools
Import-Module "WebAdministration"

# Create New Directories
New-Item C:\ProGen -type Directory
New-Item C:\ProGen\SiteRoot -type Directory
#New-Item C:\ProGen\ProGenVirtualDir1 -type Directory
#New-Item C:\ProGen\ProGenVirtualDir2 -type Directory

# Copy Content
Set-Content C:\ProGen\Default.htm "ProGen Default Page"
Set-Content C:\ProGen\SiteRoot\Default.htm "ProGen\SiteRoot Default Page"
#Set-Content C:\ProGen\ProGenVirtualDir1\Default.htm "ProGen\ProGenVirtualDir1 Default Page"
#Set-Content C:\ProGen\ProGenVirtualDir2\Default.htm "ProGen\SiteRoot\ProGenVirtualDir2 Default Page"

# Create New Application Pool
New-Item IIS:\AppPools\SiteRootPool

# Create New Sites, Web Applications and Virtual Directories and Assign to Application Pool
New-Item IIS:\Sites\progen -physicalPath C:\ProGen\SiteRoot -bindings @{protocol="http";bindingInformation=":7000:"}
Set-ItemProperty IIS:\Sites\progen -name applicationPool -value SiteRootPool
New-Item IIS:\Sites\progen\progen -physicalPath C:\ProGen\SiteRoot -type Application
Set-ItemProperty IIS:\Sites\progen\progen -name applicationPool -value SiteRootPool
#New-Item IIS:\Sites\ProGen\ProGenVirtualDir1 -physicalPath C:\ProGen\ProGenVirtualDir1 -type VirtualDirectory
#New-Item IIS:\Sites\ProGen\ProGenVirtualDir2 -physicalPath C:\ProGen\ProGenVirtualDir2 -type VirtualDirectory

# Request the Web Content
#$webclient = New-Object Net.WebClient
#$webclient.DownloadString("http://localhost:7000/");
#$webclient.DownloadString("http://localhost:7000/SiteRoot");
#$webclient.DownloadString("http://localhost:7000/ProGenVirtualDir1");
#$webclient.DownloadString("http://localhost:7000/SiteRoot/ProGenVirtualDir2");