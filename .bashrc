# ~/.bashrc — read by bash every time you open an interactive terminal.
#
# After editing, apply your changes to the current terminal with:
#     source ~/.bashrc

# ---------------------------------------------------------------------------
# Stop here if this shell is not interactive.
# ---------------------------------------------------------------------------
# Programs like scp and rsync start a non-interactive bash behind the scenes.
# If this file prints anything in that situation, those programs break.
# This line makes everything below apply only when a human is typing.

[[ $- != *i* ]] && return

# ---------------------------------------------------------------------------
# History
# ---------------------------------------------------------------------------

HISTSIZE=10000              # commands remembered in this session
HISTFILESIZE=20000          # commands saved to ~/.bash_history
HISTCONTROL=ignoreboth      # skip duplicates and lines starting with a space
shopt -s histappend         # add to the history file instead of overwriting it

# ---------------------------------------------------------------------------
# Prompt:   user@host:~/cs240/hw1 (main)$
# ---------------------------------------------------------------------------
# Shows the current git branch when you are inside a repository.

git_branch() {
    local b
    b=$(git symbolic-ref --short HEAD 2>/dev/null) && printf ' (%s)' "$b"
}

PS1='\[\e[32m\]\u@\h\[\e[0m\]:\[\e[34m\]\w\[\e[33m\]$(git_branch)\[\e[0m\]\$ '

# ---------------------------------------------------------------------------
# Aliases — shortcuts for commands you type constantly
# ---------------------------------------------------------------------------

# Colored ls. Linux and macOS spell this option differently.
if ls --color=auto / >/dev/null 2>&1; then
    alias ls='ls --color=auto'
else
    alias ls='ls -G'
fi

alias ll='ls -alF'          # long listing, hidden files, type markers
alias la='ls -A'            # hidden files, without . and ..

# Ask before deleting or overwriting. There is no trash can in a terminal.
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# Compile C with warnings and debug info.
# Named gccw on purpose: it does not replace plain gcc, so you always
# know exactly what flags you are using.

alias gccw='gcc -Wall -Wextra -g'

alias gdb='gdb -q'          # skip the gdb license banner
alias ..='cd ..'
alias grep='grep --color=auto'

# ---------------------------------------------------------------------------
# Environment
# ---------------------------------------------------------------------------

export EDITOR=vim           # editor used by programs that need one
export PAGER=less

# Put your own scripts in ~/bin and run them from anywhere.
if [ -d "$HOME/bin" ]; then PATH="$HOME/bin:$PATH"; fi
