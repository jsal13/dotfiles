# !/bin/bash 

cd $HOME

sudo dpkg --add-architecture i386
sudo add-apt-repository -y ppa:obsproject/obs-studio
sudo add-apt-repository -y ppa:peek-developers/stable

sudo apt install curl jq -y
sudo apt-get install -y curl git gdebi-core vim ack-grep jq zsh obs-studio conky-all terminator peek default-jre default-jdk libgl1-mesa-dri:i386 libgl1-mesa-glx:i386


sudo snap install discord --classic
sudo snap install slack --classic

# ack fix
sudo dpkg-divert --local --divert /usr/bin/ack --rename --add /usr/bin/ack-grep 

# oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sed -e 's/^\s*chsh -s/sudo chsh -s/g' -e 's/^\s*env\szsh.*$/#/g')"

# Python -- maybe change version here.
curl https://repo.anaconda.com/archive/Anaconda3-2019.03-Linux-x86_64.sh -o $HOME/anaconda.sh
bash $HOME/anaconda.sh -b -p $HOME/anaconda
rm -rf $HOME/anaconda.sh

# brave browser beta
curl -s https://brave-browser-apt-beta.s3.brave.com/brave-core-nightly.asc | sudo apt-key --keyring /etc/apt/trusted.gpg.d/brave-browser-beta.gpg add -
. /etc/os-release
echo "deb [arch=amd64] https://brave-browser-apt-beta.s3.brave.com/ $UBUNTU_CODENAME main" | sudo tee /etc/apt/sources.list.d/brave-browser-beta-${UBUNTU_CODENAME}.list
sudo apt-get update -y
sudo apt-get install -y brave-browser-beta
 
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

# for higan
sudo apt-get install -y \ 
    build-essential \
    libgtk2.0-dev\
    libpulse-dev \
    mesa-common-dev \
    libgtksourceview2.0-dev \
    libcairo2-dev \
    libsdl2-dev \
    libxv-dev \
    libao-dev \
    libopenal-dev \
    libudev-dev

sudo apt-get install -y higan

# steam 
wget http://media.steampowered.com/client/installer/steam.deb
sudo gdebi -n steam.deb
rm -rf steam.deb

# minecraft
wget -o ~/Minecraft.deb https://launcher.mojang.com/download/Minecraft.deb
sudo dpkg -i ~/Minecraft.deb.1

# Cleaning
sudo apt autoremove -y
sudo apt-get clean -y

# github
git config --global user.email "jimmy.c.salvatore@gmail.com"
git config --global user.name "James Salvatore"
ssh-keygen -q -t rsa -b 4096 -C "jimmy.c.salvatore@gmail.com" -N "" -f /home/james/.ssh/id_rsa

read -p "** PUT YOUR KEY ON GITHUB, then press enter.  You will need to also accept github's fingerprint shortly."

mkdir -p $HOME/Projects
cd $HOME/Projects \
    && git clone ssh://git@github.com/jsal13/dotfiles \
    && cp dotfiles/zsh/.zshrc $HOME/.zshrc \
    && cp dotfiles/conky/.conkyrc $HOME/.conkyrc \
    && git clone ssh://git@github.com/jsal13/swiss-chocolate-knife \
    && cd ..

echo "** Done!  Now do the following: "
echo "**   + https://help.ubuntu.com/community/SettingUpConky#Set_Conky_To_Start_At_Boot"
echo "**   + https://www.nvidia.com/Download/index.aspx?lang=en-us"
echo "**   + For nvidia, disable Nouveau: https://askubuntu.com/questions/841876/how-to-disable-nouveau-kernel-driver"
echo "**   + Go into another terminal and run 'chsh -s /bin/zsh' and '. ~/.zshrc'"
