# PATH
fish_add_path ~/.local/bin ~/go/bin
if test (uname) = Darwin
    if test (uname -m) = arm64
        fish_add_path /opt/homebrew/bin /opt/homebrew/sbin
    else
        fish_add_path /usr/local/bin /usr/local/sbin
    end
end

if not status is-interactive
    return
end

set -g fish_greeting
set -gx EDITOR (set -q SSH_CONNECTION; and echo "vim"; or echo "nvim")

type -q fzf; and fzf --fish | source
type -q zoxide; and zoxide init fish | source
type -q direnv; and direnv hook fish | source

# Aliases
switch (uname)
    case Darwin
        alias ls='ls -G'
    case Linux
        alias ls='ls --color=auto'
        alias dir='dir --color=auto'
        alias vdir='vdir --color=auto'
end
alias ll='ls -la'
alias la='ls -A'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias ..='cd ..'
alias ...='cd ../..'
