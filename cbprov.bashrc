# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=5000
HISTFILESIZE=10000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
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

# Setup notes capabilities
function n() {
    if [ $# -eq 0 ]; then
        ls -c ~/TaskList/notes/
    else $EDITOR ~/TaskList/notes/"$*".note
    fi
}

function nls(){
    ls -c ~/TaskList/notes/ | grep "$*"
}

# Setup autocompletion for note command
function _notecomplete {
    local cur=${COMP_WORDS[COMP_CWORD]}
    COMPREPLY=( $(compgen -W "$(ls ~/TaskList/notes | sed 's/.note//')" -- $cur) )
}
complete -F _notecomplete n


# Setup notes capabilities
# "Global" notes
function ng() {
    if [ $# -eq 0 ]; then
        ls -c ~/TaskList/gnotes/
    else $EDITOR ~/TaskList/gnotes/"$*".note
    fi
}

function ngls(){
    ls -c ~/TaskList/gnotes/ | grep "$*"
}

# Setup autocompletion for note command
function _gnotecomplete {
    local cur=${COMP_WORDS[COMP_CWORD]}
    COMPREPLY=( $(compgen -W "$(ls ~/TaskList/gnotes | sed 's/.note//')" -- $cur) )
}
complete -F _gnotecomplete ng

# setup cheap tagging
#function tag() {
#    if [ $# -eq 0 ]; then
#      ls ./.tags 2> /dev/null
#    else
#      if [ ! -d ./.tags ]; then
#        mkdir ./.tags
#      fi
#      $EDITOR ./.tags/"$*".tag
#    fi
#}

#function tagls() {
#  if [ ! -d ./.tags ]; then
#    echo "No tag descriptors found."
#  else
#    ls ./.tags | grep "$*"
#  fi
#}

#function _tagcomplete {
#  local cur=${COMP_WORDS[COMP_CWORD]}
#  rep1="$(ls ./.tags 2> /dev/null | sed 's/.tag//')"
#  rep2="$(ls)"
#  rep="$rep1 $rep2"
#  COMPREPLY=( $(compgen -W "$rep" -- $cur) )
#}
#complete -F _tagcomplete tag


# Setup my own wmanager
function wman() {
    if [ $# -eq 0 ]; then
        ls -c ~/TaskList/wman/
    else $EDITOR ~/TaskList/wman/"$*".note
    fi
}

function wmanls(){
    ls -c ~/TaskList/wman/ | grep "$*"
}

# Setup autocompletion for note command
function _wmancomplete {
    local cur=${COMP_WORDS[COMP_CWORD]}
    COMPREPLY=( $(compgen -W "$(ls ~/TaskList/wman | sed 's/.note//')" -- $cur) )
}
complete -F _wmancomplete wman
# added by Anaconda3 installer
export PATH="/home/djlowry/anaconda3/bin:$PATH"

export PATH="$HOME/bin:$PATH"
export EDITOR=vim

# show git branches
function parse_git_branch () {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# enable ccache
export PATH="/usr/lib/ccache/bin/:$PATH"

#PS1="\u@\h:\w\$(parse_git_branch)\$ "
PS1="\[$(tput setf 2)$(tput bold)\][\t] \w\n\[$(tput sgr0)$(tput setf 3)\](>\")>\[$(tput setf 4)\]\$(parse_git_branch)\$ \[$(tput sgr0)\]"

# don't overwrite automatically
alias mv="mv -i"

# Prevent accidental mass deletion
alias rm="rm -I"

# set vi to minimal vim
alias vi="vim -u NONE"

# homegrown tex
export PATH=/usr/local/texlive/2017/bin/x86_64-linux:$PATH
export INFOPATH=$INFOPATH:/usr/local/texlive/2017/texmf-dist/doc/info
export MANPATH=$MANPATH:/usr/local/texlive/2017/texmf-dist/doc/man

# set up tasklist
alias t='python ~/TaskList/tasks/tld/tld.py --date --task-dir ~/TaskList/tasks --list tasks.txt'

# mutt addresslist
#alias sadr='python ~/TaskList/email/simple_addr.py -d ~/TaskList/email -f .address_list'
# in bin instead now

export MANPATH="$MANPATH:$HOME/TaskList/man"
export MANSECT="1:n:l:8:3:2:3posix:3pm:3perl:5:4:9:6:7:eg"

export TERM=xterm-256color

## Temporary moments
#source .nowrc

export GPG_TTY=$(tty)