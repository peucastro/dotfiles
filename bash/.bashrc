#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Prompt
PS1='[\u@\h \W]\$ '

# Color support
alias ls='ls --color=auto'
alias grep='grep --color=auto'

# ls aliases
alias ll='ls -la'
alias la='ls -A'

# Navigation shortcuts
alias ..='cd ..'
alias ...='cd ../..'

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi
