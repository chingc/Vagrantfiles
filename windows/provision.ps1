Write-Output "Disabling Windows Firewall..."
netsh advfirewall set AllProfiles state off

if (Get-Command choco -ea SilentlyContinue) {
    Write-Output "Installing Chocolatey..."
    Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
} else {
    Write-Output "Upgrading Chocolatey..."
    choco upgrade -y chocolatey
}

Write-Output "Installing Chocolatey packages..."
choco install -y curl
choco install -y docker-for-windows
choco install -y git
choco install -y googlechrome
choco install -y visualstudiocode

Remove-Item "C:\Users\IEUser\Desktop\RUN AS ADMIN.ps1"
