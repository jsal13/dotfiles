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
<<<<<<< HEAD
code --install-extension DavidAnson.vscode-markdownlint
code --install-extension formulahendry.code-runner
code --install-extension hashicorp.terraform
code --install-extension ms-azuretools.vscode-docker
code --install-extension ms-kubernetes-tools.vscode-kubernetes-tools
code --install-extension ms-python.black-formatter
code --install-extension ms-python.isort
code --install-extension ms-python.mypy-type-checker
code --install-extension ms-python.python
code --install-extension ms-python.vscode-pylance
code --install-extension ms-toolsai.jupyter
code --install-extension ms-toolsai.jupyter-keymap
code --install-extension ms-toolsai.jupyter-renderers
code --install-extension ms-toolsai.vscode-jupyter-cell-tags
code --install-extension ms-toolsai.vscode-jupyter-slideshow
code --install-extension ms-vscode.powershell
code --install-extension njpwerner.autodocstring
code --install-extension redhat.vscode-yaml
code --install-extension skellock.just
code --install-extension tamasfe.even-better-toml
code --install-extension Vue.volar
code --install-extension Vue.vscode-typescript-vue-plugin
code --install-extension yzhang.markdown-all-in-on
=======
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
>>>>>>> 76c939cd7b6c76b07840d40fc3c3ad70538150b1
