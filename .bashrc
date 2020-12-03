#!/bin/bash
# .bashrc

# User specific aliases and functions

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# -----/ aliases /-----
. ~/.alias

# ls settings (this is used for completion stuff)
export LS_COLORS='no=00:fi=00:di=01;33:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jpg=01;35:*.png=01;35:*.gif=01;35:*.bmp=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.png=01;35:*.mpg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:';

export EDITOR=vim

set -o vi

# ignore Control-D
set -o ignoreeof

export HISTCONTROL=ignoreboth
export HISTTIMEFORMAT='[%d %b %T] '

# sets ls and other time display formats to smarter old-school way
export LC_TIME=C

export PATH=$PATH:~/bin

# author: Duane Johnson
# email: duane.johnson@gmail.com
# date: 2008 Jun 12
# license: MIT
#
# Based on discussion at http://kerneltrap.org/mailarchive/git/2007/11/12/406496
function gitinfo {

    pushd . >/dev/null

# Find base of git directory
    while [ ! -d .git ] && [ ! `pwd` = "/" ]; do cd ..; done

# Show various information about this git directory
    if [ -d .git ]; then
        echo "== Remote URL: `git remote -v`"

        echo "== Remote Branches: "
        git branch -r
        echo

        echo "== Local Branches:"
        git branch
        echo

        echo "== Configuration (.git/config)"
        cat .git/config
        echo

        echo "== Most Recent Commit"
        git --no-pager log --max-count=1
        echo

        echo "Type 'git log' for more commits, or 'git show' for full commit details."
    else
        echo "Not a git repository."
    fi

    popd >/dev/null
}


export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWCOLORHINTS=true
export GIT_PS1_SHOWUPSTREAM="auto"
export GIT_PS1_STATESEPARATOR=" "
export GIT_PS1_SHOWUNTRACKEDFILES=true

source /usr/local/opt/chruby/share/chruby/chruby.sh
source /usr/local/opt/chruby/share/chruby/auto.sh

#  Color defines#{{{

# Reset
Color_Off="\[\033[0m\]"       # Text Reset

# Regular Colors
Black="\[\033[0;30m\]"        # Black
Red="\[\033[0;31m\]"          # Red
Green="\[\033[0;32m\]"        # Green
Yellow="\[\033[0;33m\]"       # Yellow
Blue="\[\033[0;34m\]"         # Blue
Purple="\[\033[0;35m\]"       # Purple
Cyan="\[\033[0;36m\]"         # Cyan
White="\[\033[0;37m\]"        # White
Grey="\[\033[30;1m\]"

# Bold
BBlack="\[\033[1;30m\]"       # Black
BRed="\[\033[1;31m\]"         # Red
BGreen="\[\033[1;32m\]"       # Green
BYellow="\[\033[1;33m\]"      # Yellow
BBlue="\[\033[1;34m\]"        # Blue
BPurple="\[\033[1;35m\]"      # Purple
BCyan="\[\033[1;36m\]"        # Cyan
BWhite="\[\033[1;37m\]"       # White

# Underline
UBlack="\[\033[4;30m\]"       # Black
URed="\[\033[4;31m\]"         # Red
UGreen="\[\033[4;32m\]"       # Green
UYellow="\[\033[4;33m\]"      # Yellow
UBlue="\[\033[4;34m\]"        # Blue
UPurple="\[\033[4;35m\]"      # Purple
UCyan="\[\033[4;36m\]"        # Cyan
UWhite="\[\033[4;37m\]"       # White

# Background
On_Black="\[\033[40m\]"       # Black
On_Red="\[\033[41m\]"         # Red
On_Green="\[\033[42m\]"       # Green
On_Yellow="\[\033[43m\]"      # Yellow
On_Blue="\[\033[44m\]"        # Blue
On_Purple="\[\033[45m\]"      # Purple
On_Cyan="\[\033[46m\]"        # Cyan
On_White="\[\033[47m\]"       # White

# High Intensty
IBlack="\[\033[0;90m\]"       # Black
IRed="\[\033[0;91m\]"         # Red
IGreen="\[\033[0;92m\]"       # Green
IYellow="\[\033[0;93m\]"      # Yellow
IBlue="\[\033[0;94m\]"        # Blue
IPurple="\[\033[0;95m\]"      # Purple
ICyan="\[\033[0;96m\]"        # Cyan
IWhite="\[\033[0;97m\]"       # White

# Bold High Intensty
BIBlack="\[\033[1;90m\]"      # Black
BIRed="\[\033[1;91m\]"        # Red
BIGreen="\[\033[1;92m\]"      # Green
BIYellow="\[\033[1;93m\]"     # Yellow
BIBlue="\[\033[1;94m\]"       # Blue
BIPurple="\[\033[1;95m\]"     # Purple
BICyan="\[\033[1;96m\]"       # Cyan
BIWhite="\[\033[1;97m\]"      # White

# High Intensty backgrounds
On_IBlack="\[\033[0;100m\]"   # Black
On_IRed="\[\033[0;101m\]"     # Red
On_IGreen="\[\033[0;102m\]"   # Green
On_IYellow="\[\033[0;103m\]"  # Yellow
On_IBlue="\[\033[0;104m\]"    # Blue
On_IPurple="\[\033[10;95m\]"  # Purple
On_ICyan="\[\033[0;106m\]"    # Cyan
On_IWhite="\[\033[0;107m\]"   # White
#}}}#}}}

[ -f $HOME/.git/git-prompt.sh ] && source $HOME/.git/git-prompt.sh
[ -f $HOME/.git/git-completion.sh ] && source $HOME/.git/git-completion.sh

function __git_pair {
  ini=`git config user.initials`
  [ "$ini" != "" ] && [ "$ini" != "sb" ] && echo "$ini "
}

# using a magic fancy prompt like the fancy folks https://github.com/magicmonty/bash-git-prompt
GIT_PROMPT_ONLY_IN_REPO=1
GIT_PROMPT_FETCH_REMOTE_STATUS=0
GIT_PROMPT_SHOW_UNTRACKED_FILES=no
GIT_PROMPT_THEME=Solarized
GIT_PROMPT_START="$Yellow\\W$Color_Off"
GIT_PROMPT_END="$Purple$(__git_pair)$BIBlue\[\]❯$Cyan\[\]❯$Blue\[\]❯$Color_Off "
GIT_PROMPT_IGNORE_STASH=1
[ -f $HOME/.git/bash-git-prompt/gitprompt.sh ] && source $HOME/.git/bash-git-prompt/gitprompt.sh

# export PROMPT_COMMAND='__git_ps1 "$Grey\W/$Color_Off" "$Purple$(__git_pair)$Red\[\]❯$Green\[\]❯$Blue\[\]❯$Color_Off "'
export PS1='\[\e]2;\h \W/\a\[\e[30;1m\]\W\[\e[0;34m\]\[\e[35;1m\]$\[\e[0m\] '

if [ -f ./.bashrc.local ]; then
	. ./.bashrc.local
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
export FZF_DEFAULT_COMMAND="fd . $HOME"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd -t d . $HOME"
