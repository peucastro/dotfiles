#
# ~/.zshrc
#

export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

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

# Environment variables
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/keyring/ssh"
export ANDROID_HOME="$HOME/Android/Sdk/platform-tools"
export NVM_DIR="$HOME/.nvm"
export PNPM_HOME="$HOME/.local/share/pnpm"
export CHROME_EXECUTABLE="chromium"
export DMENU_BLUETOOTH_LAUNCHER="fuzzel"

# Path entries
export PATH="$PATH:$ANDROID_HOME"
export PATH="$PATH:$HOME/.local/share/JetBrains/Toolbox/scripts"
export PATH="$PATH:$HOME/development/flutter/bin"
export PATH="$PATH:$HOME/.pub-cache/bin"

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Personal aliases
alias zshconfig="nvim ~/.zshrc"
alias ohmyzsh="nvim ~/.oh-my-zsh"

# nvm
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# pnpm
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PATH:$PNPM_HOME" ;;
esac

# sdkman
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
