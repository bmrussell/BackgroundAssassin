# Start the processes listed in revive.txt

$reviveFile = 'revive.txt'
if (Test-Path -Path $reviveFile -PathType Leaf) {
    foreach ($commandline in Get-Content $reviveFile) {
        try {
            Invoke-Expression -Command "& $commandline"
        } catch {
            Write-Host "Failed to run [" $commandline "]"
        }
    }
}
