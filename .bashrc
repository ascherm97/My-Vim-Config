# If not running interactively, do not do anything
export XDG_CONFIG_HOME="~/.config"
export GOPATH=/usr/lib/go

if [[ -z "$TMUX" ]] ;then
    ID="`tmux ls | grep -vm1 attached | cut -d: -f1`" # get the id of a deattached session
    if [[ -z "$ID" ]] ;then # if not available create a new one
        tmux new-session
    else
        tmux attach-session -t "$ID" # if available attach to it
    fi
fi
#all alias goes in ~/.bash_aliases
source ~/.bash_aliases

#color the man pages
man() {
    LESS_TERMCAP_md=$'\e[01;31m' \
    LESS_TERMCAP_me=$'\e[0m' \
    LESS_TERMCAP_se=$'\e[0m' \
    LESS_TERMCAP_so=$'\e[01;44;33m' \
    LESS_TERMCAP_ue=$'\e[0m' \
    LESS_TERMCAP_us=$'\e[01;32m' \
    command man "$@"
}

#powerline-daemon -q
#POWERLINE_BASH_CONTINUATION=1
#POWERLINE_BASH_SELECT=1
#. /usr/lib/python3.6/site-packages/powerline/bindings/bash/powerline.sh
clear
screenfetch

#autocomplete using history
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

export PROMPT_DIRTRIM=3
export HISTFILESIZE=20000
export HISTSIZE=20000
export EDITOR=vim
shopt -s histappend
# Combine multiline commands into one in history
shopt -s cmdhist
# Ignore duplicates, ls without options and builtin commands
HISTCONTROL=ignoredups
export HISTIGNORE="&:ls:[bf]g:exit"


#ls after cd
cd() { builtin cd "$@" && ls; }

#show git branch and status
source ~/.git-completion.bash
source ~/.git-prompt.sh
export GIT_PS1_SHOWDIRTYSTATE=1

export TERM='xterm-256color'
export CLICOLOR=1
# export LSCOLORS=BagxxxdaDaGafadaDahaha
eval $( dircolors -b $HOME/.LS_COLORS )



# colors!
green="\[\033[0;32m\]"
blue="\[\033[1;34m\]"
bldcyn="\[\033[1;36m\]"
purple="\[\033[0;35m\]"
bakgrn="\[\033[42m\]"
white="\[\033[1;37m\]"
lightgrn="\[\033[1;32m\]"
red="\[\033[0;31m\]"

# Change command prompt
# '\u' adds the name of the current user to the prompt
# '\$(__git_ps1)' adds git-related stuff
# '\W' adds the name of the current directory
export PS1="$blue[ \u @ \H ]                           \D{%F --> %T}\n$green\$(__git_ps1)$lightgrn\w\n$white\$ "

