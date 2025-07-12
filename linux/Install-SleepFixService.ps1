#!/opt/microsoft/powershell/7/pwsh

if ($IsLinux -eq $false) {
    throw "This is only meant to run on Linux."
}

$serviceFile = "/etc/systemd/system/biosWakeupWorkaround.service"

if (Get-Item -Path $serviceFile -ErrorAction SilentlyContinue) {
    throw "Service file already exists. Aborting"
}

Write-Host "Installing service..."

$serviceContent = @"
[Unit]
Description=Workaround for Gigabyte B550 F13 bios sleep/wakeup bug

[Service]
Type=oneshot
ExecStart=/bin/sh -c "echo GPP0 > /proc/acpi/wakeup && echo GPP8 > /proc/acpi/wakeup && echo XHC0 > /proc/acpi/wakeup && echo PTXH > /proc/acpi/wakeup"

[Install]
WantedBy = multi-user.target
"@

New-Item $serviceFile -ItemType File -Value $serviceContent

& systemctl enable --now $serviceFile