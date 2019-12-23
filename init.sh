# !/bin/bash 
cd $HOME

sudo dpkg --add-architecture i386
sudo apt-get update 
sudo apt-get install -y \
    apt-transport-https \
    curl \
    fonts-firacode \
    g++ \
    gdebi-core \
    gcc \
    git \
    gnome-tweak-tool \
    gnupg-agent \
    jq \
    make \
    p7zip-full \
    vim \
    zsh

# Best snipping tool on there.
sudo add-apt-repository -y ppa:peek-developers/stable
sudo apt-get -y install peek

# docker: disco dist for ubuntu 19 hardcoded here.
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) test"   
sudo apt-get install -y docker-ce docker-ce-cli containerd.io
sudo curl -L "https://github.com/docker/compose/releases/download/1.24.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

sudo apt-get install -y terminator conky-all libgl1-mesa-dri:i386 libgl1-mesa-glx:i386
sudo apt-get install -y fonts-noto-color-emoji  # emoji support

# Sometimes these error out due to a conflict.
sudo apt-get install -y default-jre default-jdk

# Snap installs
sudo snap install obs-studio
sudo snap install gimp --classic
sudo snap install discord --classic
sudo snap install slack --classic
sudo snap install vlc --classic
sudo snap install node --channel=12/stable --classic

# ack fix
sudo apt-get install -y ack-grep
sudo dpkg-divert --local --divert /usr/bin/ack --rename --add /usr/bin/ack-grep 

# oh-my-zsh
# TODO: Sometimes not getting installed?
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sed -e 's/^\s*chsh -s/sudo chsh -s/g' -e 's/^\s*env\szsh.*$/#/g')"

# Python -- maybe change version here.
curl https://repo.anaconda.com/archive/Anaconda3-2019.10-Linux-x86_64.sh -o $HOME/anaconda.sh
bash $HOME/anaconda.sh -b -p $HOME/anaconda
rm -rf $HOME/anaconda.sh
 
#VSCode Configuration.
wget https://vscode-update.azurewebsites.net/latest/linux-deb-x64/stable -O /tmp/code_latest_amd64.deb
sudo dpkg -i /tmp/code_latest_amd64.deb
rm -rf /tmp/code_latest_amd64.deb

code --install-extension ms-python.python 
code --install-extension vscode-icons-team.vscode-icons
code --install-extension dbaeumer.vscode-eslint
code --install-extension octref.vetur
code --install-extension peterjausovec.vscode-docker
code --install-extension esbenp.prettier-vscode
code --install-extension formulahendry.code-runner
code --install-extension formulahendry.auto-close-tag
code --install-extension 2gua.rainbow-brackets
code --install-extension yummygum.city-lights-theme

# for higan
# sudo apt-get install -y \ 
#     build-essential \
#     libgtk2.0-dev\
#     libpulse-dev \
#     mesa-common-dev \
#     libgtksourceview2.0-dev \
#     libcairo2-dev \
#     libsdl2-dev \
#     libxv-dev \
#     libao-dev \
#     libopenal-dev \
#     libudev-dev
# sudo apt-get install -y higan

# steam 
wget http://media.steampowered.com/client/installer/steam.deb
sudo gdebi -n steam.deb
rm -rf steam.deb

# minecraft
sudo apt-get instally -y \
    libgtk2.0-0 \
    gconf-service \
    libpango1.0-0
    
wget -o ~/Minecraft.deb https://launcher.mojang.com/download/Minecraft.deb
sudo dpkg -i ~/Minecraft.deb.1
rm -rf ~/Minecraft.deb*

# Cleaning
sudo apt autoremove -y
sudo apt-get clean -y

# github
git config --global user.email "jimmy.c.salvatore@gmail.com"
git config --global user.name "James Salvatore"
ssh-keygen -q -t rsa -b 4096 -C "jimmy.c.salvatore@gmail.com" -N "" -f /home/james/.ssh/id_rsa

read -p "** PUT YOUR KEY ON GITHUB, then press enter.  You will need to also accept github's fingerprint shortly."

mkdir -p $HOME/repos
cd $HOME/repos \
    && git clone ssh://git@github.com/jsal13/dotfiles \
    && cp dotfiles/zsh/.zshrc $HOME/.zshrc \
    && cp dotfiles/conky/.conkyrc $HOME/.conkyrc \
    && git clone ssh://git@github.com/jsal13/swiss-chocolate-knife \
    && cd ..

echo "** Done!  Now do the following: "
echo "**   + https://help.ubuntu.com/community/SettingUpConky#Set_Conky_To_Start_At_Boot"
echo "**   + Go into another terminal and run 'chsh -s /bin/zsh' and '. ~/.zshrc'"
