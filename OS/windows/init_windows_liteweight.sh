# Install Chocolatey
Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

# ---
# SEPARATE INSTALL: notion, twilio, huion-tablet screen-to-gif
choco install -y 7zip adobereader audacity deluge discord firacode git spybot vlc vscode

# ---

code --install-extension 2gua.rainbow-brackets
code --install-extension dbaeumer.vscode-eslint
code --install-extension formulahendry.auto-close-tag
code --install-extension formulahendry.code-runner
code --install-extension ms-python.python 
code --install-extension mtxr.sqltools
code --install-extension octref.vetur
code --install-extension peterjausovec.vscode-docker
code --install-extension vscode-icons-team.vscode-icons
code --install-extension yummygum.city-lights-theme