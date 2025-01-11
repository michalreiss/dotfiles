# starship
eval "$(starship init zsh)"

# GO
export GOPATH="$HOME/go"
export PATH="$GOPATH/bin:$PATH"

# plugins
source <(fzf --zsh)
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

alias cat=bat
alias ls="ls --color=auto"
alias la="ls -lAh"
alias vim=nvim

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

bindkey -v
