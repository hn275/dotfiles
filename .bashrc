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

# Shell Prompt
# PS1='[\u] \w: $ '
# PS1='\e[1;34m \w: > \e[0m'
# Powerline
# export PATH="$PATH:/usr/bin"
# powerline-daemon -q
# POWERLINE_BASH_CONTINUATION=1
# POWERLINE_BASH_SELECT=1
# source /usr/share/powerline/bindings/bash/powerline.sh
function _update_ps1() {
	PS1=$(powerline-shell $?)
}

if [[ $TERM != linux && ! $PROMPT_COMMAND =~ _update_ps1 ]]; then
	PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi


# Cdd
cd () {
	builtin cd $@
	if [[ $@ ]];then
		pwd > $HOME/.cache/last_dir
	fi
}

# samedir to go to the current directory
cdd () {
	lastdir=$(cat $HOME/.cache/last_dir)
	echo "Changing directory to ${lastdir}"
	builtin cd $lastdir
}

currentdir () {
	cat $HOME/.cache/last_dir
}

# Compiling and executing C++ files
buggo () {
	g++ $1 && ./a.out
}

# Path
export PYTHONPATH=/usr/local/bin
