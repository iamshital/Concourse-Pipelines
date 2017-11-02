Copy-Item -Path C:\concourse-worker\common-files\* -Destination . -Recurse -Force
Get-ChildItem -Recurse | Unblock-File
.\tools\AddAzureRmAccount.ps1
Write-Host ----------------------
Write-Host $PWD
Write-Host ----------------------
echo ".\AzureAutomationManager.ps1 -runtests -Distro CentOS73 -cycleName PROVISION -xmlConfigFile Azure_ICA_all_run-CloudTestAutoBuilds-3427.xml -OverrideVMSize Standard_A1 -ImageType Standard -UseAzureResourceManager"
Write-Host ----------------------
$Day = Get-Date -Format "yyyy-MM-dd"
$Time = Get-Date -Format "HH-ss-ffff"
mkdir C:\AutomationExecutions\$Day -ErrorAction SilentlyContinue
mkdir C:\AutomationExecutions\$Day\$Time -ErrorAction SilentlyContinue
$folderName = "C:\AutomationExecutions\$Day\$Time"
Copy-Item -Recurse * $folderName
cd $folderName
.\AzureAutomationManager.ps1 -runtests -Distro CentOS73 -cycleName PROVISION -xmlConfigFile Azure_ICA_all_run-CloudTestAutoBuilds-3427.xml -OverrideVMSize Standard_A1 -ImageType Standard -UseAzureResourceManager
exit 0