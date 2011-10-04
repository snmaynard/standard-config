alias ls='ls -G'
alias gpp="git pull origin \`git symbolic-ref HEAD | sed -e 's,.*/\(.*\),\1,'\` && git push origin \`git symbolic-ref HEAD | sed -e 's,.*/\(.*\),\1,'\`"

export PROMPT_COMMAND='echo -ne "\033]0;${HOSTNAME%%.*}:${PWD/$HOME/~}\007"'
export PS1="\n\[\033[1;30m\][\[\033[1;32m\]\u@\h\[\033[1;30m\]\[\033[1;30m\]] \[\033[1;34m\]\w\[\033[0;37m\] \n\$ "
export PATH=/Library/Ruby/Gems/1.8/bin/:$PATH

export HISTFILESIZE=100000
alias ll="ls -lah"

export NDK_ROOT=/usr/local/Cellar/android-ndk/r6/

if [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
fi

. /usr/local/Cellar/git/1.7.6/etc/bash_completion.d/git-completion.bash
