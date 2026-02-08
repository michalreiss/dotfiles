#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

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

alias esp_build="arduino-cli compile --fqbn esp8266:esp8266:generic ."
alias esp_upload="arduino-cli upload -p /dev/esp8266 --fqbn esp8266:esp8266:generic ."
alias esp_monitor="arduino-cli monitor -p /dev/esp8266 -c 115200"

export EDITOR=nvim
export PATH="$HOME/bin:$HOME/.local/bin:$HOME/go/bin:/usr/local/bin:/usr/local/go/bin:$PATH"
