#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Alias
alias ls='ls --color=auto'
alias ll='ls -l'
alias la='ls -a'
alias lla='ls -al'
alias grep='grep --color=auto'
alias nn='nvim'

# Powerline
# export PATH="$PATH:/usr/bin"
# powerline-daemon -q 
# POWERLINE_BASH_CONTINUATION=1
# POWERLINE_BASH_SELECT=1
# source /home/haln/.local/lib/python3.10/site-packages/powerline/bindings/bash/powerline.sh

# Airline customization
# function _update_ps1() {
#     PS1=$(powerline-shell $?)
# }

# if [[ $TERM != linux && ! $PROMPT_COMMAND =~ _update_ps1 ]]; then
#     PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
# fi


# Cmd line prompt
source ~/.git-prompt.sh
PS1='\e[1;34m[\d, \@]\e[00m \e[1;32m[\w]\e[00m \e[2;33m$(__git_ps1 "( %s)")\e[00m:\n  '

# PS1='[\u] \w: $ __git_ps1 " (%s)" '
# PS1='\e[0;34m [\w]\e[m > '

# Go to same directory
cd () {
	builtin cd $@
	if [[ $@ ]];then
		pwd > $HOME/.cache/last_dir
	fi
}

cdd () {
	lastdir=$(cat $HOME/.cache/last_dir)
	echo "Changing directory to ${lastdir}"
	builtin cd $lastdir
}

currentdir () {
	cat $HOME/.cache/last_dir
}

# C++ compiler
function gg {
	g++ $1
	./a.out
}
