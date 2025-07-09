autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
# End of lines configured by zsh-newuser-install

alias ls="ls --color=auto -h"
alias ll="ls -l -h"
alias lal="ls -lah"
alias la="ls -a"
alias g="git"
alias tm="tmux"

# paths
export EDITOR="nvim"

# node path
export PATH="${PATH}:${HOME}/.npm-global/bin"
export PATH="${PATH}:${HOME}/.local/bin"
eval "$(fnm env --use-on-cd --version-file-strategy=recursive --shell zsh)"

# go path
export PATH="$PATH:/usr/local/go/bin:/home/haln/go/bin"

# rust path
export PATH="${PATH}:${HOME}/.cargo/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:/home/haln/.npm-global/bin:/home/haln/.local/bin:/home/haln/repos/scripts/bin:/home/haln/.npm-global/bin:/home/haln/.local/bin:/home/haln/repos/scripts/bin"

# fly.io path
export FLYCTL_INSTALL="${HOME}/.fly"
export PATH="$FLYCTL_INSTALL/bin:$PATH"

# snapd
export PATH="${PATH}:/var/lib/snapd/snap/bin"

# zsh plugins
source $HOME/.zsh-vi-mode/zsh-vi-mode.zsh
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
eval "$(starship init zsh)"

# shell functions
function dirquery() {
    fd . $HOME --type directory --hidden --absolute-path \
        --exclude node_modules \
        --exclude .git \
        --exclude .cache \
        --exclude .npm \
        --exclude go/pkg \
        --exclude .cargo \
        --exclude .config \
        --exclude .rustup \
        --exclude .local/share \
        --exclude .local/share \
        --exclude .mozilla \
        --exclude .config/chromium \
        --exclude .bun \
        | fzf
}

function goto() {
    dir=$(dirquery)
    [[ -z $dir ]] || cd $dir
}
