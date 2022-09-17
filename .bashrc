#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Alias
alias ls='lsd --color=auto'
alias ll='ls -l'
alias la='ls -a'
alias lla='ls -al'
alias grep='grep --color=auto'
alias g='git'
alias t='tmux'

# Cmd line prompt
source ~/.git-prompt.sh
PS1=' \e[1;32m \w\e[00m \e[2;40m\e[2;37m$(__git_ps1 "    %s ")\e[00m\n   '

# C++ compile and run file
function buggo {
	g++ -Wall -std=c++20 -o $1 $2
	./"${1}"
}


# NPM configuration
NPM_PACKAGES="${HOME}/.npm-packages"
export PATH="$PATH:$NPM_PACKAGES/bin"
export MANPATH="${MANPATH-$(manpath)}:$NPM_PACKAGES/share/man"
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# Lua language server 
LSP="${HOME}/.language-server-protocol"
export PATH="${PATH}:${LSP}/lua-language-server/bin" # Lua
export PATH="${PATH}:${LSP}/marksman/bin" # Markdown 
# Ruby/Gem executables
# My scripts
export PATH="${PATH}:${HOME}/.local/bin"
