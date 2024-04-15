# Env Variables
source ~/.env
plugins=(aliases docker git gitignore terraform)

source $ZSH/oh-my-zsh.sh 
source ~/.aliases

# Make pressing "up" cycle through matching unix commands.
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search # Up
bindkey "^[[B" down-line-or-beginning-search # Down

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/james/miniconda/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/james/miniconda/etc/profile.d/conda.sh" ]; then
        . "/home/james/miniconda/etc/profile.d/conda.sh"
    else
        export PATH="/home/james/miniconda/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# Make poetry do local venvs.
poetry config virtualenvs.in-project true

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# export CUDA_HOME=/usr/local/cuda
# export LIBRARY_PATH="${CUDA_HOME}/lib64"
# export C_INCLUDE_PATH="${CUDA_HOME}/include"

