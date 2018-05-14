[ -z "$PS1" ] && return
HISTCONTROL=ignoredups:ignorespace
shopt -s histappend
HISTSIZE=1000
HISTFILESIZE=2000

shopt -s checkwinsize

[ -x /bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

export TERM=xterm-256color

if [ "$TERM" == "xterm" ]; then
    export TERM=xterm-256color
fi

case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

if [ -x /bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias ls='ls --color=auto'

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

function rmlog { rm -f *.log; }
function dmsg { dmesg | $PAGER; }
function ff { find . -type f -iname '*'$*'*' -ls; }
function swap
{
    local TMPFILE=tmp.$$;
    mv "$1" $TMPFILE;
    mv "$2" "$1";
    mv $TMPFILE "$2";
}
function hgrep ()
{
    find . -name "*[hH]" | xargs /bin/grep --color=auto "$@" /dev/null
}
function strgrep ()
{
    find . -name "*[hcCH]" | LC_ALL=C xargs /bin/grep --color=auto "`echo $@ | iconv -t cp866`" /dev/null
}
function srcgrep ()
{
    find . -name "*[hcCH]" | xargs /bin/grep --color=auto "$@" /dev/null
}
function sqlgrep ()
{
    find . -name "*[sql]" | xargs /bin/grep --color=auto "$@" /dev/null
}
function tsgrep () 
{
    find . -name "*.ts" | xargs /bin/grep --color=auto "$@" /dev/null
}

alias ..='cd ..'
alias cd..='cd ..'
alias sqlplus='rlwrap sqlplus'

if [ -f ~/.bashrc_local ]; then
    source ~/.bashrc_local
fi
