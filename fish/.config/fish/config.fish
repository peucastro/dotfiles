# PATH
fish_add_path ~/.local/bin
if test (uname) = Darwin
    if test -x /opt/homebrew/bin/brew
        eval (/opt/homebrew/bin/brew shellenv)
    else if test -x /usr/local/bin/brew
        eval (/usr/local/bin/brew shellenv)
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
alias ls='ls --color=always'
alias ll='ls -la'
alias la='ls -A'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias ..='cd ..'
alias ...='cd ../..'
