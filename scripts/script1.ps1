Copy-Item -Path C:\concourse-worker\common-files\* -Destination . -Recurse -Force
Get-ChildItem -Recurse | Unblock-File
.\tools\AddAzureRmAccount.ps1
.\AzureAutomationManager.ps1 -runtests -Distro SS1604EHPC -cycleName PROVISION -xmlConfigFile Azure_ICA_all_run-CloudTestAutoBuilds-3427.xml -OverrideVMSize Standard_A1 -ImageType Standard -UseAzureResourceManager
exit 0
