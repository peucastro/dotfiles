#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# PATH
export PATH="$HOME/.local/bin:$PATH"

# Editor
if [[ -n $SSH_CONNECTION ]]; then
	export EDITOR='vim'
else
	export EDITOR='nvim'
fi

# History
HISTSIZE=50000
HISTFILESIZE=50000
HISTCONTROL=ignoredups:ignorespace
shopt -s histappend
shopt -s cmdhist
PROMPT_COMMAND='history -a'

# fzf
if [[ -f /usr/share/fzf/key-bindings.bash ]]; then
	source /usr/share/fzf/key-bindings.bash
fi

if [[ -f /usr/share/fzf/completion.bash ]]; then
	source /usr/share/fzf/completion.bash
fi

# zoxide
if command -v zoxide &>/dev/null; then
	eval "$(zoxide init bash)"
fi

# direnv
if command -v direnv &>/dev/null; then
	eval "$(direnv hook bash)"
fi

# Aliases
alias ls='ls --color=auto'
alias ll='ls -la'
alias la='ls -A'
alias grep='grep --color=auto'
alias ..='cd ..'
alias ...='cd ../..'

# Prompt
PS1='[\u@\h \W]\$ '
