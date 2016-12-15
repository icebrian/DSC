Configuration myChocoConfig
{
   Import-DscResource -Module cChoco  
   Node "localhost"
   {
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
