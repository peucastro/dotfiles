#
# ~/.zshrc
#

export PATH=$HOME/bin:$HOME/.local/bin:$PATH

# Path to ohmyzsh installation
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load
ZSH_THEME="robbyrussell"

# ohmyzsh auto-update behavior
zstyle ':omz:update' mode reminder

# Disable auto-setting terminal title
DISABLE_AUTO_TITLE="true"

# ohmyzsh plugins
plugins=(fzf gh git man sudo tldr z zsh-syntax-highlighting zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# User configuration

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Personal aliases
alias zshconfig="nvim ~/.zshrc"
alias ohmyzsh="nvim ~/.oh-my-zsh"
