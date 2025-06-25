#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

# User specific environment
if ! [[ "$HOME/bin:$HOME/.local/bin:/usr/local/bin:" ]]; then
  PATH="$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH"
fi
export PATH

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

# nvm
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# pnpm
case ":$PATH:" in
*":$PNPM_HOME:"*) ;;
*) export PATH="$PATH:$PNPM_HOME" ;;
esac

# sdkman
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
