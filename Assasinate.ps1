param($RunExe)

Set-Location $PSScriptRoot

# Kill unwanted processes
Get-Content .\Assasinate-Processes.txt | .\Assasinate-Processes.ps1

# Kill unwanted services as admin
Start-Process Powershell -Verb runAs -Wait -ArgumentList " -Command cd $pwd;cat Assasinate-Services.txt | .\Assasinate-Services.ps1"

if ($null -eq $RunExe) {
    Write-Host "Press any key to restart services & processes..."
    $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown") | out-null
} else {
    Start-Process $RunExe -Wait
}

Start-Process Powershell -Verb runAs -ArgumentList "-Command Get-Content Assasinate-Services.txt | .\Revive-Services.ps1"

.\Revive-Processes.ps1