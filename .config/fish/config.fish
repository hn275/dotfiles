if status is-interactive
    # Commands to run in interactive sessions can go here
end

alias g="git"

set -x GOPATH $HOME/go
set -x PATH $PATH $GOPATH/bin

function edit
    cd ($HOME/repos/scripts/bin/jumpto)
    pwd
end

function fish_prompt
    # set -g __fish_git_prompt_showdirtystate true
    set -g __fish_git_prompt_showstashstate true
    set -g __fish_git_prompt_showdirtystate true
    set -g __fish_git_prompt_showuntrackedfiles true
    set -g __fish_git_prompt_char_stashstate "*"
    set -g __fish_git_prompt_char_dirtystate "+"
    set -g __fish_git_prompt_char_untrackedfiles "%"
    set -g __fish_git_prompt_char_stateseparator "|"
    set -g __fish_git_prompt_color red
    printf '[%s]%s\n$ ' $PWD (fish_git_prompt)
end
