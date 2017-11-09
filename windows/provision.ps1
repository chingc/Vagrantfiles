#Requires -RunAsAdministrator

if (Get-Command choco -ErrorAction SilentlyContinue) {
    Write-Output "Upgrading Chocolatey..."
    choco upgrade -y chocolatey
} else {
    Write-Output "Installing Chocolatey..."
    Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
}

Write-Output "`nInstalling Chocolatey packages..."
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

Write-Output "`nAdjusting timezone..."
Set-TimeZone -Name "Eastern Standard Time"

Write-Output "`nDone."
Remove-Item ".\RUN AS ADMIN.ps1"
