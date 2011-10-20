alias ls='ls -G'
alias gpp="git pull origin \`git symbolic-ref HEAD | sed -e 's,.*/\(.*\),\1,'\` && git push origin \`git symbolic-ref HEAD | sed -e 's,.*/\(.*\),\1,'\`"

export PROMPT_COMMAND='echo -ne "\033]0;${HOSTNAME%%.*}:${PWD/$HOME/~}\007"'
export PATH=/Library/Ruby/Gems/1.8/bin/:$PATH

export HISTFILESIZE=100000
alias ll="ls -lah"

export NDK_ROOT=/usr/local/Cellar/android-ndk/r6/

if [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
fi

. ~/.git-completion.bash

export PROMPT_DIRTRIM=2

function parse_git_dirty {
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]] && echo " ✖" || echo " ✔"
}

function git_push_indicator {
  if [ -d .git ]; then
    [[ $(git log --branches --not --remotes --oneline  | nl)  ]] && echo "⇧ "
  fi
}

function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/\1$(parse_git_dirty)/"
}

export PS1="\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;36m\]\w \[\033[31m\]\$(parse_git_branch) \[\033[33m\]\$(git_push_indicator)\[\033[37m\]\n$\[\033[00m\] "

