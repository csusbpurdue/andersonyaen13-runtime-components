# ~/.zshrc — read by zsh every time you open an interactive terminal.
#
# zsh is the default shell on macOS. It does NOT read ~/.bashrc.
# After editing, apply your changes to the current terminal with:
#     source ~/.zshrc

# ---------------------------------------------------------------------------
# oh-my-zsh: a framework that adds themes, plugins, and sensible defaults.
# https://ohmyz.sh   (install.sh in this repository installs it for you)
# ---------------------------------------------------------------------------

export ZSH="$HOME/.oh-my-zsh"

# Prompt theme. Browse the options at
# https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# robbyrussell (the default) shows the current directory and git branch,
# and turns the arrow red when the last command failed.

ZSH_THEME="robbyrussell"

# Plugins live in $ZSH/plugins. Each one adds features or aliases.
# git                 ~150 shortcuts, e.g. `gst` for `git status`.
#                     Learn the full commands first; the shortcuts can wait.
# colored-man-pages   makes `man` pages easier to read

plugins=(git colored-man-pages)

# Remind me about oh-my-zsh updates instead of updating silently.

zstyle ':omz:update' mode reminder

if [ -d "$ZSH" ]; then
    source "$ZSH/oh-my-zsh.sh"
else
    # oh-my-zsh is not installed: use a plain prompt that still shows
    # the git branch, e.g.   user@host:~/cs240/hw1 (main)%
    autoload -Uz vcs_info
    precmd() { vcs_info }
    zstyle ':vcs_info:git:*' formats ' (%b)'
    setopt PROMPT_SUBST
    PROMPT='%F{green}%n@%m%f:%F{blue}%~%f%F{yellow}${vcs_info_msg_0_}%f%# '

    autoload -Uz compinit && compinit    # tab completion
fi

# ---------------------------------------------------------------------------
# History
# ---------------------------------------------------------------------------

HISTFILE=~/.zsh_history
HISTSIZE=10000              # commands remembered in this session
SAVEHIST=20000              # commands saved to ~/.zsh_history
setopt HIST_IGNORE_DUPS     # skip a command identical to the previous one
setopt HIST_IGNORE_SPACE    # skip commands that start with a space
setopt SHARE_HISTORY        # all open terminals share one history

# ---------------------------------------------------------------------------
# Aliases: the same ones as in bashrc, so both shells feel the same
# ---------------------------------------------------------------------------

if ls --color=auto / >/dev/null 2>&1; then
    alias ls='ls --color=auto'
else
    alias ls='ls -G'
fi

alias ll='ls -alF'
alias la='ls -A'

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

alias gccw='gcc -Wall -Wextra -g'
alias gdb='gdb -q'
alias grep='grep --color=auto'

# ---------------------------------------------------------------------------
# Environment
# ---------------------------------------------------------------------------

export EDITOR=vim
export PAGER=less

if [ -d "$HOME/bin" ]; then
    PATH="$HOME/bin:$PATH"
fi

# boilersay
export PATH="$HOME/.local/bin:$PATH"
alias boilersay='cowsay -f train'
alias hail='printf "Hammer Up\nBoiler Down\nHail Purdue\n" | boilersay -n'
