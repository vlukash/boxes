Configuration TestConfig 
{ 
  #param ($MachineName)

  Node "localhost"
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
      Ensure = “Present” 
      Name = “Web-Asp-Net45” 
    } 
  } 
}

TestConfig

Start-DscConfiguration –Wait -Path .\TestConfig –Verbose

cinst googlechrome -y
cinst nodejs.install -y
cinst 7zip.install -y
cinst git.install -y
cinst notepadplusplus.install -y
cinst conemu -y

#cinst visualstudio2015community -y