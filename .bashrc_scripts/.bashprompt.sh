# get current branch in git repo
function parse_git_branch() {
    BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
    if [ ! "${BRANCH}" == "" ]
    then
        STAT=`parse_git_dirty`
        echo "[${BRANCH}${STAT}] "
    else
        echo ""
    fi
}

# get current status of git repo
function parse_git_dirty {
    status=`git status 2>&1 | tee`
    dirty=`echo -n "${status}" 2> /dev/null | grep "modified:" &> /dev/null; echo "$?"`
    untracked=`echo -n "${status}" 2> /dev/null | grep "Untracked files" &> /dev/null; echo "$?"`
    ahead=`echo -n "${status}" 2> /dev/null | grep "Your branch is ahead of" &> /dev/null; echo "$?"`
    behind=`echo -n "${status}" 2> /dev/null | grep "Your branch is behind" &> /dev/null; echo "$?"`
    diverged=`echo -n "${status}" 2> /dev/null | grep "Your branch and '[^']*' have diverged" &> /dev/null; echo "$?"`
    newfile=`echo -n "${status}" 2> /dev/null | grep "new file:" &> /dev/null; echo "$?"`
    renamed=`echo -n "${status}" 2> /dev/null | grep "renamed:" &> /dev/null; echo "$?"`
    deleted=`echo -n "${status}" 2> /dev/null | grep "deleted:" &> /dev/null; echo "$?"`

    syncbits=""
    if [ "${behind}" == "0" ]; then
        syncbits="<-|"
    fi
    if [ "${ahead}" == "0" ]; then
        syncbits="|->"
    fi
    if [ "${diverged}" == "0" ]; then
        syncbits="<-|->"
    fi

    statusbits=""
    if [ "${newfile}" == "0" ]; then
        statusbits="${statusbits}+"
    fi
    if [ "${dirty}" == "0" ]; then
        statusbits="${statusbits}*"
    fi
    if [ "${renamed}" == "0" ]; then
        statusbits="${statusbits}~"
    fi
    if [ "${deleted}" == "0" ]; then
        statusbits="${statusbits}x"
    fi
    if [ "${untracked}" == "0" ]; then
        statusbits="${statusbits}?"
    fi

    bits=""
    if [ ! "${syncbits}" == "" -a ! "${statusbits}" == "" ]; then
        bits="${syncbits} ${statusbits}"
    else
        bits="${syncbits}${statusbits}"
    fi

    if [ ! "${bits}" == "" ]; then
        echo " ${bits}"
    else
        echo ""
    fi
}

PS1HOSTNAME="\[\e[35m\]\h\[\e[m\]"

if [ $(id -u) -eq 0 ]
then
    export PS1="[\[\e[37m\]\t\[\e[m\] \[\e[36m\]\u\[\e[m\]@$PS1HOSTNAME \[\e[33m\]\w\[\e[m\]]\\$ "
else
    export PS1="\[\e[33m\]\w\[\e[m\] \[\e[32m\]\`parse_git_branch\`\[\e[m\]->\n[\[\e[37m\]\t\[\e[m\] \[\e[36m\]\u\[\e[m\]@$PS1HOSTNAME] \\$ "
fi
