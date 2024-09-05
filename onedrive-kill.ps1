# Kill OneDrive process if running
$process = Get-Process "OneDrive" -ErrorAction SilentlyContinue
if ($process) {
    Stop-Process -Name "OneDrive" -Force
    Write-Host "OneDrive process terminated."
} else {
    Write-Host "OneDrive is not running."
}

# OneDrive path for 64-bit Windows 10/11
$OneDrivePath = "C:\Program Files\Microsoft OneDrive\OneDrive.exe"

# Start OneDrive again with ExecutionPolicy Bypass
if (Test-Path $OneDrivePath) {
    Start-Process -FilePath "powershell.exe" -ArgumentList "-ExecutionPolicy Bypass -Command Start-Process `'$OneDrivePath`'"
    Write-Host "OneDrive relaunched with ExecutionPolicy Bypass."
} else {
    Write-Host "OneDrive executable not found."
}
