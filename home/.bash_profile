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


if [ -d "$HOME/.android-sdk-macosx/platform-tools" ] ; then
    PATH="$HOME/.android-sdk-macosx/platform-tools:$PATH"
fi

if [ -d "$HOME/Library/Android/sdk/platform-tools" ] ; then
    PATH="$HOME/Library/Android/sdk/platform-tools:$PATH"
fi

#if [ -d "$HOME/.android-sdk-macosx/tools" ] ; then
#    PATH="$HOME/.android-sdk-macosx/tools:$PATH"
#fi

PATH="/usr/local/opt/ccache/libexec;/Users/talz/code/screenovate/platform/android/sdk/android-sdk-macosx/platform-tools":$PATH


if [ -d "/usr/local/bin" ] ; then
    PATH="/usr/local/bin:$PATH"
fi

#export WINEARCH="win32"
#export MAVEN_OPTS="-Xmx1024m -XX:MaxPermSize=256m"


# TODO: do this only if we are on mac
alias ls='ls --color'
alias adb_choose='source ~/bin/adb_choose'
alias tl='tmux list-session'
alias ta='tmux attach-session -t'
alias chrome='/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome'

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
export SLACK_TOKEN="xoxp-7424968405-7426320754-8370589138-e30a69"

export NDK_HOME=$HOME/Library/Android/sdk/ndk-bundle
export ANDROID_HOME=$HOME/Library/Android/sdk
