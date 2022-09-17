export PATH=$HOME/bin:/usr/local/bin:$PATH
export ZSH="/home/james/.oh-my-zsh"

# Ruby Stuff.
export GEM_HOME="$HOME/gems"
export PATH="$HOME/gems/bin:$PATH"

ZSH_THEME="avit"

plugins=(git docker)

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
__conda_setup="$('/home/james/anaconda/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/james/anaconda/etc/profile.d/conda.sh" ]; then
        . "/home/james/anaconda/etc/profile.d/conda.sh"
    else
        export PATH="/home/james/anaconda/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
