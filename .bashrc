# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# Source aliases
if [ -f ~/.alias ]; then
    . ~/.alias
fi

# Bash prompt
if [ -f ~/.bashrc_scripts/.bashprompt.sh ]; then
    . ~/.bashrc_scripts/.bashprompt.sh
fi

# Additional autocomplete
if [ -f ~/.bash-completion.d/maven-completion.bash ]; then
    . ~/.bash-completion.d/maven-completion.bash
fi
if [ -f ~/.bash-completion.d/git-completion.bash ]; then
    . ~/.bash-completion.d/git-completion.bash
fi
if [ -f ~/.bash-completion.d/make-completion.bash ]; then
    . ~/.bash-completion.d/make-completion.bash
fi

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    #alias grep='grep --color=auto'
    #alias fgrep='fgrep --color=auto'
    #alias egrep='egrep --color=auto'
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

export VISUAL=vim
export EDITOR="$VISUAL"

###############################################################################

# User specific aliases and functions
export PATH=~/bin:$PATH:/sbin:/usr/sbin

stty -ixon
