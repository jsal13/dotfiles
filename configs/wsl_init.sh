MINICONDA_LATEST_URL=https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
OH_MY_ZSH_LATEST_URL=https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh

sudo apt-get update \
    && apt-get install -y \
    jq \
    git \
    tmux \
    wget \
    zsh \
    && rm -rf /var/lib/apt/lists/*

wget $OH_MY_ZSH_LATEST_URL -O $HOME/omzsh.sh \
    && sh $HOME/omzsh.sh --unattended \
    && rm -f $HOME/omzsh.sh

sudo chsh -s /usr/bin/zsh

wget $MINICONDA_LATEST_URL -O $HOME/miniconda.sh \
    && bash $HOME/miniconda.sh -b -p $HOME/miniconda \
    && rm -f $HOME/miniconda.sh \
    && $HOME/miniconda/bin/conda init zsh

$HOME/miniconda/bin/conda install -c conda-forge -y mamba

$HOME/miniconda/bin/mamba install -y \
    altair \
    black \
    flake8 \
    jupyter \
    matplotlib \
    numpy \
    pandas \
    poetry \
    pydocstyle \
    pylint \
    pytest \
    requests

