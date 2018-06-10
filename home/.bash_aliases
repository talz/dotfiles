alias tl='tmux list-session'
alias ta='tmux attach-session -t'

if [ "$(uname)" == "Darwin" ]; then
alias vim='gvim -v'
alias ctags="`brew --prefix`/bin/ctags"
fi

alias ls='ls --color=auto'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias ip='ip --color'
alias ipb='ip --color --brief'

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'


if [ "$(uname)" == "Linux" ]; then
    alias open=xdg-open
fi


