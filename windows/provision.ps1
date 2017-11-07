#Requires -RunAsAdministrator

Write-Output "Adjusting timezone..."
Set-TimeZone -Name "Eastern Standard Time"

if (Get-Command choco -ErrorAction SilentlyContinue) {
    Write-Output "Upgrading Chocolatey..."
    choco upgrade -y chocolatey
} else {
    Write-Output "Installing Chocolatey..."
    Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
}

Write-Output "Installing Chocolatey packages..."
choco install -y `
    7zip `
    curl `
    docker-for-windows `
    git `
    googlechrome `
    sysinternals `
    visualstudiocode

Write-Output "`nEnabling auto logon..."
autologon "IEUser" "WORKGROUP" "Passw0rd!"

Write-Output "Updating hostname..."
Rename-Computer -NewName <HOSTNAME>

Write-Output "Installing VirtualBox Guest Additions..."
Mount-DiskImage -ImagePath (Get-ChildItem "..\Downloads\VBoxGuestAdditions.iso").FullName
D:\VBoxWindowsAdditions.exe /S
Start-Sleep -s 30

Write-Output "`nA reboot is require."
Remove-Item ".\RUN AS ADMIN.ps1"
