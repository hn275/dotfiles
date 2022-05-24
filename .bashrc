#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Blinking cursor
# syntax is:
# printf '\033[x q'
# where
# 	Ps = 0  -> blinking block.
# 	Ps = 1  -> blinking block (default).
# 	Ps = 2  -> steady block.
# 	Ps = 3  -> blinking underline.
# 	Ps = 4  -> steady underline.
# 	Ps = 5  -> blinking bar (xterm).
# 	Ps = 6  -> steady bar (xterm).
printf '\033[3 q'

# Alias
alias ls='lsd --color=auto'
alias ll='ls -l'
alias la='ls -a'
alias lla='ls -al'
alias grep='grep --color=auto'
alias nn='nvim'

# Cmd line prompt
source ~/.git-prompt.sh
PS1='\e[1;34m\e[00m  \e[1;32m \w\e[00m \e[2;33m$(__git_ps1 "[ %s]")\e[00m\n   '


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

# C++ compiler
function buggo {
	g++ $1
	./a.out
}


