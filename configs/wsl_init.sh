#!/bin/bash

MINICONDA_LATEST_URL=https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
OH_MY_ZSH_LATEST_URL=https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh

sudo apt-get update \
    && sudo apt-get install -y \
    jq \
    git \
    tmux \
    wget \
    zsh \
    && sudo rm -rf /var/lib/apt/lists/*

wget $OH_MY_ZSH_LATEST_URL -O $HOME/omzsh.sh \
    && sh $HOME/omzsh.sh --unattended \
    && rm -f $HOME/omzsh.sh

wget $MINICONDA_LATEST_URL -O $HOME/miniconda.sh \
    && bash $HOME/miniconda.sh -b -p $HOME/miniconda \
    && rm -f $HOME/miniconda.sh \
    && $HOME/miniconda/bin/conda init zsh

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

# Make repo directory.
mkdir -p $HOME/repos
