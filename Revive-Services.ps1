# Start the services given on input
foreach ($servicename in $input) {
	if (!($servicename.StartsWith('#') -or $servicename.trim() -eq '')) {		
		$svc = Get-Service $servicename
		if ($null -ne $svc) {
			if ($svc.Status -eq 'Stopped') {
				Write-Host "Starting " $svc.DisplayName "..."
				try {
					Start-Service $servicename
				}
				catch {
					Write-Error "Could not start " $svc.DisplayName " (" $PSItem.Exception.Message ")"
				}
			}
			foreach ($dep in $svc.DependentServices) {				
				if ($dep.StartType -ne 'Manual' -and $dep.StartType -ne 'Disabled') {
					Write-Host "Starting " $svc.DisplayName "/" $dep.DisplayName "..."
					try {
						Start-Service $dep
					}
					catch {
						Write-Error "Could not start " $dep.DisplayName " (" $PSItem.Exception.Message ")"
					}
				}				
			}			
		}
	}
}
Start-Sleep -Seconds 2