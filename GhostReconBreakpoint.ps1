cd H:\code\github\BackgroundAssassin
cat .\killprocesses.txt | .\Assasinate-Processes.ps1


& "E:\Games\Uplay\SpareCore.ps1" "E:\Games\Uplay\Ghost Recon Breakpoint\GRB_vulkan.exe"

Write-Host "Press any key to continue..."
$Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown") | out-null
Start-Process Powershell -Verb runAs -ArgumentList " -Command cd $pwd;cat killservices.txt | .\Revive-Services.ps1"

.\Revive-Processes.ps1