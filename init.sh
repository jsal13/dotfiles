sudo apt-get update -y
sudo apt-get install -y \
    curl \
    git \ 
    gdebi-core \
    wget \
    gnome-tweak-tool \
    ack-grep

# if not jq, get jq
# if not ffmpeg get ffmpeg
# gnome terminator doesn't have repo?

#VSCode Configuration.
wget https://vscode-update.azurewebsites.net/latest/linux-deb-x64/stable -O /tmp/code_latest_amd64.deb
sudo dpkg -i /tmp/code_latest_amd64.deb

code --install-extension ms-python.python 
code --install-extension vscode-icons-team.vscode-icons
code --install-extension dbaeumer.vscode-eslint
code --install-extension octref.vetur
code --install-extension peterjausovec.vscode-docker
code --install-extension esbenp.prettier-vscode
code --install-extension formulahendry.code-runner
code --install-extension formulahendry.auto-close-tag
code --install-extension 2gua.rainbow-brackets

# Brave
curl -s https://brave-browser-apt-beta.s3.brave.com/brave-core-nightly.asc | sudo apt-key --keyring /etc/apt/trusted.gpg.d/brave-browser-beta.gpg add -
source /etc/os-release
echo "deb [arch=amd64] https://brave-browser-apt-beta.s3.brave.com/ $UBUNTU_CODENAME main" | sudo tee /etc/apt/sources.list.d/brave-browser-beta-${UBUNTU_CODENAME}.list
sudo apt update -y
sudo apt-get install -y brave-browser-beta

sudo add-apt-repository -y ppa:obsproject/obs-studio
sudo apt-get install -y obs-studio

sudo add-apt-repository -y ppa:gnome-terminator
sudo apt-get install -y terminator

curl -sL -o conky-x86_64.AppImage \
    $(curl -sL https://api.github.com/repos/brndnmtthws/conky/releases/latest | \
    jq --raw-output '.assets[0] | .browser_download_url')

sudo snap install discord --classic
sudo snap install slack --classic

# higan
sudo apt-get install -y build-essential libgtk2.0-dev libpulse-dev \
    mesa-common-dev libgtksourceview2.0-dev libcairo2-dev libsdl2-dev \
    libxv-dev libao-dev libopenal-dev libudev-dev
sudo apt-get install -y higan

# peek
sudo add-apt-repository -y ppa:peek-developers/stable
sudo apt install -y peek

# ack
sudo dpkg-divert --local --divert /usr/bin/ack --rename --add /usr/bin/ack-grep 

# github
git config --global user.email "jimmy.c.salvatore@gmail.com"
git config --global user.name "James Salvatore"
ssh-keygen -q -t rsa -b 4096 -C "jimmy.c.salvatore@gmail.com" -N "" -f /home/james/.ssh/id_rsa
echo "REMEMBER TO PUT YOUR KEY ON GITHUB."

# Stop things here?

mkdir Projects
cd Projects \
    && git clone ssh://git@github.com/jsal13/dotfiles \
    # you have to "yes" here once \
    

# zshell.
# copy zshell stuff.
