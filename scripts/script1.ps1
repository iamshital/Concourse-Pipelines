Copy-Item -Path C:\concourse-worker\common-files\* -Destination . -Recurse -Force
Get-ChildItem -Recurse | Unblock-File
.\tools\AddAzureRmAccount.ps1
Write-Host ----------------------
Write-Host $PWD
Write-Host ----------------------
echo ".\AzureAutomationManager.ps1 -runtests -Distro U16IP1CDK -cycleName PROVISION -xmlConfigFile Azure_ICA_all_run-CloudTestAutoBuilds-3427.xml -OverrideVMSize Standard_A1 -ImageType Standard -UseAzureResourceManager"
Write-Host ----------------------
$folderName = (Get-Date).Ticks
mkdir C:\AutomationExecutions\$folderName
Copy-Item -Recurse * C:\AutomationExecutions\$folderName
cd C:\AutomationExecutions\$folderName
.\AzureAutomationManager.ps1 -runtests -Distro U16IP1CDK -cycleName PROVISION -xmlConfigFile Azure_ICA_all_run-CloudTestAutoBuilds-3427.xml -OverrideVMSize Standard_A1 -ImageType Standard -UseAzureResourceManager
sleep 1800
exit 0
