#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=5000
HISTFILESIZE=10000

alias grep="grep --color=auto"

#alias vi="vim"

# short TODO access for vim
alias todo="vim ~/Dropbox/TODO.markdown"
alias drafts="cd ~/Dropbox/Mathematics/TeX/MyPaperDrafts"
alias scratch="cd ~/scratch"

# short access to task directory
alias tasks="cd ~/TaskList/"

#TODO add tasklist
# Setup task list "t"
alias t='python2 ~/TaskList/tasks/t/t.py --task-dir ~/TaskList/tasks --list tasks.txt'

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



# quick TeX junk file remover
#alias rmTeX="bash ~/bin/rmTeX.sh"
export PATH="$HOME/bin:$PATH"

# don't overwrite automatically
alias mv="mv -i"

# Prevent accidental mass deletion
alias rm="rm -I"

#export CDPATH=.:~:~/Dropbox/
export EDITOR=vim

# show git branches
function parse_git_branch () {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# enable ccache
export PATH="/usr/lib/ccache/bin/:$PATH"

#PS1="\u@\h:\w\$(parse_git_branch)\$ "
PS1="\[$(tput setf 2)$(tput bold)\][\t] \w\n\[$(tput sgr0)$(tput setf 3)\](>\")>\[$(tput setf 4)\]\$(parse_git_branch)\$ \[$(tput sgr0)\]"

# add neovim
#export PATH="$HOME/neovim/bin:$PATH"

#TODO add fuzzyness
#[ -f ~/.fzf.bash ] && source ~/.fzf.bash

alias brothers='cd /home/djlowry/Dropbox/BigBrothersLittleBrothers/'
#alias mini='cd /home/djlowry/Dropbox/Programming/pythonMiniProjects'
alias books='cd /home/djlowry/Dropbox/Mathematics/Books'
#alias teaching='cd /home/djlowry/Dropbox/Mathematics/MyTeaching/math10/'
#alias saferm="mv -t ~/.backups"
#alias thesis='cd /home/djlowry/Dropbox/Mathematics/thesis_github/PhD_Thesis/'
#alias msri='ssh dlowry@sshost.msri.org'
#alias current='cd /home/djlowry/CurrentlyThinkingAbout/'
alias lmf='cd ~/Devel/lmfdb/'

# added for latex placement
#export PATH="/opt/texbin/:$PATH"

bash ~/.config/base16-shell/scripts/base16-monokai.sh

alias activate_anaconda="source /opt/anaconda/bin/activate root"
alias deactivate_anaconda="source /opt/anaconda/bin/deactivate root"

alias colorterm1="bash ~/.config/base16-shell/scripts/base16-atelier-seaside.sh"
alias colorterm2="bash ~/.config/base16-shell/scripts/base16-classic-dark.sh"
alias colorterm3="bash ~/.config/base16-shell/scripts/base16-phd.sh"
alias colorg="bash ~/.config/base16-shell/scripts/base16-green-screen.sh"
alias colorr="bash ~/.config/base16-shell/scripts/base16-red-screen.sh"
alias colorb="bash ~/.config/base16-shell/scripts/base16-blue-screen.sh"
alias colorl="bash ~/.config/base16-shell/scripts/base16-gruvbox-light-hard.sh"

alias gvim="gvim --servername GVIM --remote-silent"
alias evince="echo \"(>\\\")> evince isn't installed. Using zathura\" ; zathura"
