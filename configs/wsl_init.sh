#!/bin/bash

OH_MY_ZSH_LATEST_URL=https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh
MINIFORGE_LATEST_URL=https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-Linux-x86_64.sh


sudo apt-get update \
    && sudo apt-get install -y \
    apt-transport-https \
    age \
    jq \
    git \
    gnupg \
    gpg \
    make \
    net-tools \
    software-properties-common \
    tmux \
    unzip \
    wget \
    wireless-tools \
    zsh \
    && sudo rm -rf /var/lib/apt/lists/*

wget $OH_MY_ZSH_LATEST_URL -O $HOME/omzsh.sh \
    && sh $HOME/omzsh.sh --unattended \
    && rm -f $HOME/omzsh.sh

wget $MINIFORGE_LATEST_URL -O $HOME/miniforge.sh \
 && sh $HOME/miniforge.sh -b -p  $HOME/miniconda \
 && $HOME/miniconda/bin/conda config --set always_yes yes --set changeps1 no \
 && $HOME/miniconda/bin/conda update -q -y conda \
 && rm -f $HOME/miniforge.sh

$HOME/miniconda/bin/conda install -c conda-forge -y mamba

# Install Poetry
curl -sSL https://install.python-poetry.org | python3 -

$HOME/miniconda/bin/mamba install -y \
    altair \
    black \
    flake8 \
    jupyter \
    matplotlib \
    numpy \
    pandas \
    pydocstyle \
    pylint \
    pytest \
    requests

# If you have the main directory as a dotfile git dir, then it'll have a custom ~/.zshrc.
cd $HOME && git restore ~/.zshrc || echo "Could not restore custom ~/.zshrc."

# Install k3d (2023-04-06)
wget -q -O - https://raw.githubusercontent.com/k3d-io/k3d/main/install.sh | bash

# Install Helm (2023-04-06)
curl https://baltocdn.com/helm/signing.asc | gpg --dearmor | sudo tee /usr/share/keyrings/helm.gpg > /dev/null && \
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/helm.gpg] https://baltocdn.com/helm/stable/debian/ all main" | sudo tee /etc/apt/sources.list.d/helm-stable-debian.list && \
sudo apt-get update && \
sudo apt-get install helm

# Install k9s
git clone ssh://git@github.com/derailed/k9s --depth=1 && \
cd k9s && \
make build && \
sudo mv ./execs/k9s /usr/local/bin && \
cd .. && \
rm -rf k9s

# Install AWS CLI
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
unzip awscliv2.zip && \
sudo ./aws/install --bin-dir /usr/local/bin --install-dir /usr/local/aws-cli && \
rm -rf awscliv2.zip

# Install Terraform
wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg && \
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list && \
sudo apt update && \
sudo apt install -y terraform

# Install just
curl -q 'https://proget.makedeb.org/debian-feeds/prebuilt-mpr.pub' | gpg --dearmor | sudo tee /usr/share/keyrings/prebuilt-mpr-archive-keyring.gpg 1> /dev/null && \
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/prebuilt-mpr-archive-keyring.gpg] https://proget.makedeb.org prebuilt-mpr $(lsb_release -cs)" | sudo tee /etc/apt/sources.list.d/prebuilt-mpr.list && \
sudo apt update && \
sudo apt install -y just

# Install SOPS.
SOPS_LATEST_VERSION=$(curl -Ls "https://api.github.com/repos/mozilla/sops/releases/latest" | grep -Po '"tag_name": "v\K[0-9.]+') && \
curl -Lo sops.deb "https://github.com/mozilla/sops/releases/latest/download/sops_${SOPS_LATEST_VERSION}_amd64.deb" && \
sudo apt --fix-broken install ./sops.deb && \
rm -rf sops.deb

# Terraformer
# https://github.com/GoogleCloudPlatform/terraformer/tree/master
export PROVIDER=all
curl -LO "https://github.com/GoogleCloudPlatform/terraformer/releases/download/$(curl -s https://api.github.com/repos/GoogleCloudPlatform/terraformer/releases/latest | grep tag_name | cut -d '"' -f 4)/terraformer-${PROVIDER}-linux-amd64"
chmod +x terraformer-${PROVIDER}-linux-amd64
sudo mv terraformer-${PROVIDER}-linux-amd64 /usr/local/bin/terraformer

# DVC
pip install dvc

# Install NVM.
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
. ~/.zshrc  # Command alias refresh.
nvm install node

# Make repo directory.
mkdir -p $HOME/repos

# Clean up
sudo apt-get -y autoremove
