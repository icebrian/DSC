Configuration WebServersFullConfig
{
    Import-DscResource -Module cChoco
    Node ("localhost")
    {
        #Install the IIS Role
        WindowsFeature IIS
        {
            Ensure = "Present"
            Name = "Web-Server"
        }

        #Install ASP.NET 4.5
        WindowsFeature ASP45
        {
            Ensure = "Present"
            Name = "Web-Asp-Net45"
        }

        #Install ASP.NET 3.5
        WindowsFeature ASP35
        {
            Ensure = "Present"
            Name = "Web-Asp-Net"
        }

        WindowsFeature TelnetClient 
        {
            Ensure = 'Present'
            Name = 'Telnet-Client'
        }

        Registry RegistryLegalNoticeCaption
        {
            Ensure      = "Present"  # You can also set Ensure to "Absent"
            Key         = "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System"
            ValueName   = "legalnoticecaption"
            ValueData   = "Notice to All Users (Authorized or Unauthorized)."
        }

        Registry RegistryLegalNoticeText
        {
            Ensure      = "Present"  # You can also set Ensure to "Absent"
            Key         = "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System"
            ValueName   = "legalnoticetext"
            ValueData   = "This computer system is for authorized use only. Users have no explicit or implicit expectation of privacy."
        }

        LocalConfigurationManager
        {
            DebugMode = 'ForceModuleImport'
        }

        cChocoInstaller installChoco
        {
            InstallDir = "c:\choco"
        }

        cChocoPackageInstaller installChrome
        {
            Name = "googlechrome"
            DependsOn = "[cChocoInstaller]installChoco"
        }
    }
}
