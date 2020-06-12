# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH # Path to your oh-my-zsh installation.  export ZSH=/michel/.oh-my-zsh
# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
export ZSH="/michel/.oh-my-zsh"
export GOPATH="/michel/go"
export XDG_CONFIG_HOME="~/.config"
export TMPDIR="/tmp"
# added by Miniconda3 4.3.21 installer
#export PATH="/opt/anaconda/bin:$PATH"
export PATH="/opt:$PATH"
export ZSH_THEME="gentoo"
export LC_ALL="en_US.UTF-8"
export LANGUAGE="en_US"

#For virtualenv in python
export WORKON_HOME=~/.virtualenvs
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python2.7
export VIRTUALENVWRAPPER_VIRTUALENV=/usr/bin/virtualenv2
source /usr/bin/virtualenvwrapper_lazy.sh

export VAGRANT_HOME=~/.vagrant.d
#export VAGRANT_HOME=/home/.vagrant.d
export PYRO_SERIALIZER=pickle
export PYRO_SERIALIZERS_ACCEPTED=pickle
#User-wide installation
export npm_config_prefix=~/.node_modules

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case # sensitive completion must be off. _ and - will be interchangeable.  # HYPHEN_INSENSITIVE="true"
# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

DISABLE_AUTO_UPDATE="true"
# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

source $ZSH/oh-my-zsh.sh
#source ~/.oh-my-zsh/oh-my-zsh.sh
# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

#Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='nvim'
else
    export EDITOR='nvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"

# pip zsh completion start
function _pip_completion {
    local words cword
    read -Ac words
    read -cn cword
    reply=( $( COMP_WORDS="$words[*]" \
        COMP_CWORD=$(( cword-1 )) \
        PIP_AUTO_COMPLETE=1 $words[1] ) )
}
compctl -K _pip_completion pip
# pip zsh completion end


# get seconds from midnight
function getSecsM {
    zmodload zsh/datetime
    now=$EPOCHSECONDS
    strftime -s today %F $now
    strftime -rs midnight %F $today
    echo $((now - midnight))
}
# get seconds from midnight



# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="svim ~/.zshrc"
# alias ohmyzsh="svim ~/.oh-my-zsh"

if [[ -z "$TMUX" ]] ;then
    ID="`tmux ls | grep -vm1 attached | cut -d: -f1`" # get the id of a deattached session
    if [[ -z "$ID" ]] ;then # if not available create a new one
        tmux new-session
    else
        tmux attach-session -t "$ID" # if available attach to it
    fi
fi
#color the man pages
#man() {
#LESS_TERMCAP_md=$'\e[01;31m' \
    #LESS_TERMCAP_me=$'\e[0m' \
    #LESS_TERMCAP_se=$'\e[0m' \
    #LESS_TERMCAP_so=$'\e[01;44;33m' \
    #LESS_TERMCAP_ue=$'\e[0m' \
    #LESS_TERMCAP_us=$'\e[01;32m' \
    #command man "$@"
#}



plugins=( warhol zsh-completions )
autoload -U compinit && compinit
if [[ -r ~/.zsh_aliases ]]; then
    source ~/.zsh_aliases
fi
screenfetch
#source /etc/profile.d/fzf.zsh
#source /home/Xilinxs/14.7/ISE_DS/settings64.sh
#Enabling powerline
#. /usr/share/zsh/site-contrib/powerline.zsh


# add bins installed by me from AUR
#export PATH="/opt/:$PATH"
