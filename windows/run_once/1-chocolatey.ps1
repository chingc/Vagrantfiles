if (Get-Command choco -ErrorAction SilentlyContinue) {
    choco upgrade -y chocolatey
} else {
    Invoke-Expression ((New-Object System.Net.WebClient).DownloadString("https://chocolatey.org/install.ps1"))
}
