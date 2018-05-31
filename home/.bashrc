[ -z "$PS1" ] && return


HISTCONTROL=ignoreboth
HISTSIZE=500000 
HISTFILESIZE=2000

shopt -s histappend
shopt -s checkwinsize

[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

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

case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi




function color_my_prompt {
    if [ "$x" = "tal-thinkpad" ]; then
        local __user_and_host="\[\033[01;33m\]\u@\h"
    else
       local __user_and_host="\[\033[01;34m\]\u@\h"
    fi
    local __cur_location="\[\033[01;36m\]\W"
    local __git_branch_color="\[\033[31m\]"
    #local __git_branch="\`ruby -e \"print (%x{git branch 2> /dev/null}.grep(/^\*/).first || '').gsub(/^\* (.+)$/, '(\1) ')\"\`"
    local __git_branch='`git branch 2> /dev/null | grep -e ^* | sed -E  s/^\\\\\*\ \(.+\)$/\(\\\\\1\)\ /`'
    local __prompt_tail="\[\033[01;36m\]$"
    local __last_color="\[\033[00m\]"
    local __open_bracet="\[\033[01;36m\]["
    local __close_bracet="\[\033[01;36m\]]"
    export PS1="${debian_chroot:+($debian_chroot)}$__open_bracet$__user_and_host $__cur_location$__close_bracet $__git_branch_color$__git_branch$__prompt_tail$__last_color "
}
color_my_prompt
export CLICOLOR=1
export LSCOLORS=GxHxCxDxBxegedabagaced

if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

if [ -d "$HOME/.android-sdk" ] ; then
    PATH="$HOME/.android-sdk/platform-tools:$PATH"
    PATH="$HOME/.android-sdk/bin:$PATH"
    PATH="$HOME/.android-sdk/tools:$PATH"
    PATH="$HOME/.android-sdk/tools/bin:$PATH"
    export ANDROID_HOME="$HOME/.android-sdk"
    export NDK=$ANDROID_HOME/ndk-bundle/
fi

if [ -d "$HOME/Library/Android/sdk" ] ; then
    PATH="$HOME/Library/Android/sdk/platform-tools:$PATH"
    PATH="$HOME/Library/Android/sdk/bin:$PATH"
    PATH="$HOME/Library/Android/sdk/tools:$PATH"
    PATH="$HOME/Library/Android/sdk/tools/bin:$PATH"
    export ANDROID_HOME="$HOME/Library/Android/sdk"
    export NDK=$ANDROID_HOME/ndk-bundle/
fi

if [ -f $HOME/.local/bin/virtualenvwrapper.sh ]; then
    source $HOME/.local/bin/virtualenvwrapper.sh
fi


if [ -f $HOME/bin/git-completion.bash ]; then
    . $HOME/bin/git-completion.bash
fi


export PATH="$HOME/bin:$PATH"

if [ "$(uname)" == "Darwin" ]; then
export PATH="/usr/local/opt/gnu-getopt/bin:$PATH"
export PATH="/usr/local/opt/make/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/flex/bin:/usr/local/opt/bison/bin:$PATH"
export CMAKE_INCLUDE_PATH="/usr/local/opt/flex/include"
export CMAKE_LIBRARY_PATH="/usr/local/opt/flex/lib;/usr/local/opt/bison/lib"
fi

export EDITOR="vim"

if [ "$(uname)" == "Linux" ]; then
export VAGRANT_DEFAULT_PROVIDER="lxc"
fi

export HOMESICK_REPO="git@github.com:talz/dotfiles"


set -o vi
