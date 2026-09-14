#
# ~/.zshrc
#

# PATH
export PATH="$HOME/.local/bin:$PATH"

# Editor
if [[ -n $SSH_CONNECTION ]]; then
	export EDITOR='vim'
else
	export EDITOR='nvim'
fi

# History
HISTFILE=~/.zsh_history
HISTSIZE=50000
SAVEHIST=50000
setopt append_history share_history hist_ignore_dups hist_ignore_space hist_reduce_blanks extended_history

# Completion
autoload -Uz compinit
compinit
zstyle ':completion:*' menu select

# Plugins
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh

# fzf
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

# zoxide
if command -v zoxide &>/dev/null; then
	eval "$(zoxide init zsh)"
fi

# direnv
if command -v direnv &>/dev/null; then
	eval "$(direnv hook zsh)"
fi

# Prepend sudo
sudo-command-line() {
	[[ -z $BUFFER ]] && zle up-history
	[[ $BUFFER != sudo\ * ]] && BUFFER="sudo $BUFFER"
	zle end-of-line
}
zle -N sudo-command-line
bindkey '^[^[' sudo-command-line

# Aliases
alias ls='ls --color=auto'
alias ll='ls -la'
alias la='ls -A'
alias grep='grep --color=auto'
alias ..='cd ..'
alias ...='cd ../..'

# Prompt
PROMPT='%F{green}%n@%m%f %F{blue}%~%f %# '
