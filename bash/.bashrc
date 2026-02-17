#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

set -o vi

if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  fi
fi

eval "$(starship init bash)"
eval "$(fzf --bash)"

# git
alias ga="git add -p"
alias gc="git commit -m"
alias gp="git push"
alias gl="git pull"
alias gd="git diff"
alias gs="git status"
alias gss="git status --short"
alias glog="git log --graph --topo-order --pretty='%w(100,0,6)%C(yellow)%h%C(bold)%C(black)%d %C(cyan)%ar %C(green)%an%n%C(bold)%C(white)%s %N' --abbrev-commit"

# dirs
alias ..="cd .."
alias ...="cd ../.."

alias cat=bat
alias ls="ls --color=auto"
alias la="ls -lAh"

alias tmuxs="tmux new-session -s"

export EDITOR=nvim
export PATH="$HOME/bin:$HOME/.local/bin:/usr/local/bin:$(go env GOPATH)/bin:$PATH"
