# Kill the processes provided on input, saving the killed ones to revive.txt

$reviveFile = 'revive.txt'
if (Test-Path -Path $reviveFile -PathType Leaf) {
	Remove-Item $reviveFile
}

foreach ($processname in $input) {	
	if (!($processname.StartsWith('#') -or $processname.trim() -eq '')) {
		$proclist = (Get-CimInstance  win32_process | Where-Object {$_.Name -like "*$processname*"}) # | Select-Object CommandLine, ProcessId)
		foreach($proc in $proclist) {
			Write-Host "Stopping " $proc.Name "(" $proc.ProcessId ")..."
			try {
				Stop-Process -Id $proc.ProcessId -Force
				Add-Content -Path $reviveFile -Value $proc.CommandLine
			} catch {
			 	Write-Host "Could not stop " $proc.Name " (" $PSItem.Exception.Message ")"
			}		
		}
	}
}