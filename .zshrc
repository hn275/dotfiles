autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
# End of lines configured by zsh-newuser-install

alias ls="ls --color=auto"
alias ll="ls -l"
alias lal="ls -la"
alias la="ls -a"
alias g="git"
alias tm="tmux"

# paths
export EDITOR="nvim"

# node path
export PATH="${PATH}:${HOME}/.npm-global/bin"
export PATH="${PATH}:${HOME}/.local/bin"

# go path
export GOPATH="${HOME}/go"
export PATH="${PATH}:${GOPATH}/bin"

# rust path
export PATH="/home/haln/.cargo/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:/home/haln/.npm-global/bin:/home/haln/.local/bin:/home/haln/repos/scripts/bin:/home/haln/go/go/bin:/home/haln/.npm-global/bin:/home/haln/.local/bin:/home/haln/repos/scripts/bin:/home/haln/go/go/bin":"/home/haln/go/bin"

# fly.io path
export FLYCTL_INSTALL="/home/haln/.fly"
export PATH="$FLYCTL_INSTALL/bin:$PATH"

# shell
function goto() {
    dir=$(fd . $HOME --type directory --hidden --absolute-path \
            --exclude node_modules \
            --exclude .git \
            --exclude .cache \
            --exclude .npm \
            --exclude go/pkg \
            --exclude .cargo \
            --exclude .rustup \
            --exclude .local/share \
            --exclude .local/share \
            --exclude .mozilla \
            --exclude .config/chromium \
            --exclude .bun \
            | fzf
    )
    [[ -z $dir ]] || cd "${dir}"
}

# eval "$(fnm env --use-on-cd)"

# console theme
source /usr/share/zsh/plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
eval "$(oh-my-posh init zsh --config $HOME/Repositories/oh-my-posh/themes/honukai.json)"


# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
# bun completions
[ -s "/home/haln/.bun/_bun" ] && source "/home/haln/.bun/_bun"
