# NVIDIA Context Menu Thing (right click in folders)
# COPY in the Creds stuff.
# See if solitaire works before this noise is cut out; if not, then add 
# https://answers.microsoft.com/en-us/windows/forum/all/microsoft-solitaire-collection-keeps-crashing/967d320a-e999-4782-aed3-bb10072b4ece

# TO HOSTS:
# #solitaire_ad_block
# 0.0.0.0 msmonplat.trafficmanager.net
# 0.0.0.0 cdn.spotxcdn.com
# 0.0.0.0 msmonplat.trafficmanager.net
# 0.0.0.0 cdn.spotxcdn.com
# 0.0.0.0 ads.api.vungle.com
# 0.0.0.0 fp.msedge.net
# 0.0.0.0 cdn.adnxs.com
# 0.0.0.0 widgets.outbrain.com

# Install Chocolatey
Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

exit

Get-AppxPackage -name "Microsoft.ZuneMusic" | Remove-AppxPackage
Get-AppxPackage -name "Microsoft.Music.Preview" | Remove-AppxPackage
Get-AppxPackage -name "Microsoft.XboxIdentityProvider" | Remove-AppxPackage
Get-AppxPackage -name "Microsoft.BingTravel" | Remove-AppxPackage
Get-AppxPackage -name "Microsoft.BingHealthAndFitness" | Remove-AppxPackage
Get-AppxPackage -name "Microsoft.BingFoodAndDrink" | Remove-AppxPackage
Get-AppxPackage -name "Microsoft.People" | Remove-AppxPackage
Get-AppxPackage -name "Microsoft.BingFinance" | Remove-AppxPackage
Get-AppxPackage -name "Microsoft.3DBuilder" | Remove-AppxPackage
Get-AppxPackage -name "Microsoft.BingNews" | Remove-AppxPackage
Get-AppxPackage -name "Microsoft.BingSports" | Remove-AppxPackage
Get-AppxPackage -name "Microsoft.WindowsCamera" | Remove-AppxPackage
Get-AppxPackage -name "Microsoft.Getstarted" | Remove-AppxPackage
Get-AppxPackage -name "Microsoft.Office.OneNote" | Remove-AppxPackage
Get-AppxPackage -name "Microsoft.WindowsMaps" | Remove-AppxPackage
Get-AppxPackage -name "Microsoft.MicrosoftOfficeHub" | Remove-AppxPackage
Get-AppxPackage -name "Microsoft.BingWeather" | Remove-AppxPackage
Get-AppxPackage -name "Microsoft.WindowsPhone" | Remove-AppxPackage

exit

# conemu rainmeter spotify
# NEED TO INSTALL SEPARATELY:
# chatty visual-studio elgato notion screen-to-gif huion-tablet logitech-g-hub twilio calibre krita obs-websocket-extension parsec
# INSTALL SEPARATELY DUE TO IT BEING SO SLOW: gimp
choco install -y 7zip adobereader audacity googlechrome deluge discord firacode git minecraft obs-studio slack spybot steam vlc vscode

exit

code --install-extension 2gua.rainbow-brackets
code --install-extension dbaeumer.vscode-eslint
code --install-extension esbenp.prettier-vscode
code --install-extension formulahendry.auto-close-tag
code --install-extension formulahendry.code-runner
code --install-extension ms-azuretools.vscode-docker
code --install-extension ms-vscode-remote.remote-wsl
code --install-extension ms-python.python 
code --install-extension mtxr.sqltools
code --install-extension octref.vetur
code --install-extension peterjausovec.vscode-docker
code --install-extension vscode-icons-team.vscode-icons
code --install-extension yummygum.city-lights-theme

# You'll want to manually install:
# - Docker
# - Fruityloops
