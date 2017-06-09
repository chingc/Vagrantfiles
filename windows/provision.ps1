Write-Output "Adjusting timezone..."
Set-TimeZone -Name "Eastern Standard Time"

if (Get-Command choco -ea SilentlyContinue) {
    Write-Output "Upgrading Chocolatey..."
    choco upgrade -y chocolatey
} else {
    Write-Output "Installing Chocolatey..."
    Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
}

Write-Output "Installing Chocolatey packages..."
choco install -y `
    curl `
    docker-for-windows `
    git `
    googlechrome `
    visualstudiocode

Remove-Item "C:\Users\IEUser\Desktop\RUN AS ADMIN.ps1"
