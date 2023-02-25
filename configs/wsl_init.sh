#!/bin/bash

# MINICONDA_LATEST_URL=https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
OH_MY_ZSH_LATEST_URL=https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh
KIND_VERSION=0.17.0
MINIFORGE_LATEST_URL=https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-Linux-x86_64.sh

sudo apt-get update \
    && sudo apt-get install -y \
    jq \
    git \
    gnupg \
    gpg \
    software-properties-common \
    tmux \
    unzip \
    wget \
    zsh \
    && sudo rm -rf /var/lib/apt/lists/*

wget $OH_MY_ZSH_LATEST_URL -O $HOME/omzsh.sh \
    && sh $HOME/omzsh.sh --unattended \
    && rm -f $HOME/omzsh.sh

wget $MINIFORGE_LATEST_URL -O $HOME/miniforge.sh \
 && sh ./miniforge.sh -b -p  $HOME/miniconda \
 && $HOME/miniconda/bin/conda config --set always_yes yes --set changeps1 no \
 && $HOME/miniconda/bin/conda update -q -y conda \
 && rm -f $HOME/miniforge.sh

# wget $MINICONDA_LATEST_URL -O $HOME/miniconda.sh \
#     && bash $HOME/miniconda.sh -b -p $HOME/miniconda \
#     && rm -f $HOME/miniconda.sh \
#     && $HOME/miniconda/bin/conda init zsh

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


# Install Kind
if [ ! -d $HOME/kind ]
then
    curl -Lo ./kind https://kind.sigs.k8s.io/dl/v{KIND_VERSION}/kind-linux-amd64 && \
    chmod +x ./kind && \
    sudo mv ./kind /usr/local/bin/kind
fi

# Install AWS CLI
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
unzip awscliv2.zip && \
sudo ./aws/install --bin-dir /usr/local/bin --install-dir /usr/local/aws-cli

# Install Terraform
wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg && \
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list && \
sudo apt update && \
sudo apt install -y terraform

# Make repo directory.
mkdir -p $HOME/repos
