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

# User specific aliases and functions
export PATH=~/bin:$PATH:/sbin:/usr/sbin

stty -ixon
