# Stop  the services given on input
foreach ($servicename in $input) {	
	if (!($servicename.StartsWith('#') -or $servicename.trim() -eq '')) {
		$svc = (Get-Service $servicename | Where-Object Status -eq 'Running')
		Write-Host "Stopping " $svc.DisplayName "..."
		if ($null -ne $svc) {		
			foreach ($dep in $svc.DependentServices) {
				if ($dep.Status -eq 'Running') {
					try {
						Stop-Service $dep -Force -NoWait
					}
					catch {
						Write-Error "Could not stop " $dep.DisplayName " (" $PSItem.Exception.Message ")"
					}
				}
			}
			try {
				Stop-Service $servicename -Force -NoWait
			}
			catch {
				Write-Error "Could not stop " $svc.DisplayName " (" $PSItem.Exception.Message ")"
			}		
		}
	}
}
Start-Sleep -Seconds 2