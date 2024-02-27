# oh-my-zsh
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git zsh-syntax-highlighting zsh-autosuggestions zsh-fzf-history-search)
source $ZSH/oh-my-zsh.sh

# GO
export GOPATH="$HOME/go"
export PATH="$GOPATH/bin:$PATH"

# aliases
alias vim='nvim'
alias ls='colorls'
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
