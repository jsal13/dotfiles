# POWERSHELL ADMIN:
# Install Chocolatey
Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

# ---
# POWERSHELL ADMIN (New Window):
# Gets rid of a lot of Windows crufty unnecessary packages.
# Run get-appxpackage | format-table -autosize -property PackageFamilyName and compare unwanted packages to this.
$apps = @(
    "*BingNews*",
    "*BingWeather*",
    "*GetHelp*",
    "*Getstarted*",
    "*Messaging*",
    "*Microsoft3DViewer*",
    "*MicrosoftOfficeHub*",
    "*MicrosoftSolitaireCollection*",
    "*MicrosoftStickyNotes*",
    "*MicrosoftTeams*",
    "*MixedReality.Portal*",
    "*Office.OneNote*",
    "*OneConnect*",
    "*OneDriveSync*",
    "*Print3D*",
    "*SkypeApp*",
    "*Wallet*",
    "*WindowsAlarms*",
    "*windowscommunicationsapps*",
    "*WindowsFeedbackHub*",
    "*WindowsMaps*",
    "*WindowsSoundRecorder*",
    "*XboxApp*",
    "*XboxGameOverlay*",
    "*XboxGamingOverlay*",
    "*XboxIdentityProvider*",
    "*XboxSpeechToTextOverlay*",
    "*YourPhone*",
    "*ZuneMusic*",
    "*ZuneVideo*"
)

foreach ($app in $apps) {
    & Get-AppxPackage "${app}" | Remove-AppxPackage
}


# ---
# POWERSHELL ADMIN (New Window):
choco install -y `
    7zip `
    adobereader `
    audacity `
    authy-desktop `
    awscli `
    calibre `
    darktable `
    dbeaver `
    deluge `
    discord `
    docker-desktop `
    firacode `
    firefox `
    git `
    googlechrome `
    googledrive `
    just `
    k3d `
    lghub `
    lightshot `
    notion `
    obs-studio `
    plex `
    powertoys `
    screentogif `
    slack `
    spybot `
    steam `
    terraform `
    tidal `
    vlc `
    vscode `
    whatsapp `
    windirstat

# INSTALL THESE SEPARATELY: huion-tablet, screen-to-gif, iCUE (RGB RAM).

# ---
# POWERSHELL NON-ADMIN
# For VSCode only, don't install if you don't use VSCode.
$apps = @(
    "DavidAnson.vscode-markdownlint",
    "formulahendry.code-runner",
    "hashicorp.terraform",
    "ms-azuretools.vscode-docker",
    "ms-kubernetes-tools.vscode-kubernetes-tools",
    "ms-python.black-formatter",
    "ms-python.isort",
    "ms-python.python",
    "ms-python.mypy-type-checker",
    "ms-python.vscode-pylance",
    "ms-toolsai.jupyter",
    "ms-toolsai.jupyter-keymap",
    "ms-toolsai.jupyter-renderers",
    "ms-toolsai.vscode-jupyter-cell-tags",
    "ms-toolsai.vscode-jupyter-slideshow",
    "ms-vscode.powershell",
    "njpwerner.autodocstring",
    "skellock.just",
    "tamasfe.even-better-toml",
    "Yummygum.city-lights-theme",
    "yzhang.markdown-all-in-one"
)

foreach ($app in $apps) {
    & code --install-extension "${app}"
}
