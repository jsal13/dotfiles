export PATH=$HOME/bin:/usr/local/bin:$PATH
export ZSH="/home/james/.oh-my-zsh"
export PATH="/home/james/anaconda3/bin:$PATH"

ZSH_THEME="avit"

plugins=(git docker)

source $ZSH/oh-my-zsh.sh

alias jsenv="source activate jsalv"
alias please="sudo"
alias pls="sudo"

alias ga="git add"
alias gc="git commit"
alias gpo="git push origin"
