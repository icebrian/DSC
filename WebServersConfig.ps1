Configuration WebServersConfig
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
