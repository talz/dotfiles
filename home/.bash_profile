# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022


# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
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



#export WINEARCH="win32"
#export MAVEN_OPTS="-Xmx1024m -XX:MaxPermSize=256m"


# TODO: do this only if we are on mac
alias adb_choose='source ~/bin/adb_choose'
alias tl='tmux list-session'
alias ta='tmux attach-session -t'

if [ "$(uname)" == "Darwin" ]; then
alias vim='gvim -v'
alias ctags="`brew --prefix`/bin/ctags"
fi

#TODO: do this only if this file exists
. $HOME/bin/git-completion.bash

export BUILD_MAC_SDK_EXPERIMENTAL=1

export CLICOLOR=1
export LSCOLORS=GxHxCxDxBxegedabagaced

export DYLD_LIBRARY_PATH="$DYLD_LIBRARY_PATH:$HOME/bin/libmobiledevice/"
PATH="$HOME/bin:$PATH"

PATH="$HOME/bin/libmobiledevice:$PATH"
export PATH=$HOME/code/chrome/depot_tools:"$PATH"
export NACL_SDK_ROOT=~/.nacl_sdk/pepper_49


alias ilog='idevicesyslog -u `idevice_id -l`'

export CLICOLOR=1
#export TERM=xterm-256color
export GOPATH=$HOME/code/talz/go
export EDITOR="vim"

if [ "$(uname)" == "Darwin" ]; then
export PATH="/usr/local/opt/gnu-getopt/bin:$PATH"
export PATH="/usr/local/opt/make/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/flex/bin:/usr/local/opt/bison/bin:$PATH"
export CMAKE_INCLUDE_PATH="/usr/local/opt/flex/include"
export CMAKE_LIBRARY_PATH="/usr/local/opt/flex/lib;/usr/local/opt/bison/lib"
fi

alias ls='ls --color=auto'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'


