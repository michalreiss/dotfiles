# oh-my-zsh
# just aliases etc.
export ZSH="$HOME/.oh-my-zsh"
plugins=(git)
source $ZSH/oh-my-zsh.sh

# starship
eval "$(starship init zsh)"

# GO
export GOPATH="$HOME/go"
export PATH="$GOPATH/bin:$PATH"

# plugins
source <(fzf --zsh)
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# aliases
alias vim='nvim'

bindkey -v
