Configuration WinServerConfig
{ 
  param ($MachineName)

  Node $MachineName
  { 

	# Web Server (IIS)
    WindowsFeature WebServer
    {
        Name = "Web-Server"
        Ensure = "Present"
    }

    # IIS Management Console
    WindowsFeature WebServerManagementConsole
    {
        Name = "Web-Mgmt-Console"
        Ensure = "Present"
    }
	
    #Install ASP.NET 4.5 
    WindowsFeature ASP 
    { 
		Ensure = "Present" 
		Name = "Web-Asp-Net45" 
    } 
	
	#Desktop experience
    WindowsFeature DesktopExperience
	{ 
		Ensure = "Present" 
		Name = "Desktop-Experience"
	}
  } 
}

WinServerConfig -MachineName "localhost"

Start-DscConfiguration -Wait -Path .\WinServerConfig -Verbose -Force

#cinst boxstarter -force -y

Set-WindowsExplorerOptions -EnableShowHiddenFilesFoldersDrives -EnableShowFileExtensions
Set-TaskbarOptions -Size Small -Lock -Combine Never

#cinst powershell-packagemanagement -y
(new-object Net.WebClient).DownloadString("http://psget.net/GetPsGet.ps1") | iex
install-module PsReadLine

cinst conemu -y
#cinst poshgit -y


cinst 7zip.install -y
cinst executor -y

cinst nodejs.install -y
cinst git.install -y
cinst kdiff3 -y
cinst notepadplusplus.install -y
cinst visualstudiocode -y

cinst googlechrome -y