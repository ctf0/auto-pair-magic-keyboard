$deviceIdPart = "VID_0451&PID_8043"  # Replace with your actual device serial
$connectScript = Join-Path $PSScriptRoot "\connect.bat"
$disconnectScript = Join-Path $PSScriptRoot "\disconnect.bat"
$usbDeviewPath = "path\to\USBDeview.exe"
$tempFile = "$env:TEMP\usb_state.txt"
$lastState = $null

while ($true) {
    & "$usbDeviewPath" /scomma $tempFile | Out-Null

    $deviceLine = Get-Content $tempFile | Where-Object { $_ -like "*$deviceIdPart*" }

    if ($deviceLine) {
        $isConnected = ($deviceLine -split ",")[3].Trim() -eq "Yes"

        if ($lastState -ne $isConnected) {
            $lastState = $isConnected
            if ($isConnected) {
                Write-Host "[+] Device connected"
                Start-Process -FilePath $connectScript -WindowStyle Hidden
            } else {
                Write-Host "[-] Device disconnected"
                Start-Process -FilePath $disconnectScript -WindowStyle Hidden
            }
        }
    } else {
        # Device fully missing
        if ($lastState -ne $false) {
            $lastState = $false
            Write-Host "[-] Device missing or unplugged"
            Start-Process -FilePath $disconnectScript -WindowStyle Hidden
        }
    }

    Start-Sleep -Seconds 3
}