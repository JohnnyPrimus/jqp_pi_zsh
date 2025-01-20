#!/bin/zsh
# a polarizing "ls" override. optional and manual only
alias ls="ls -gtAch --group-directories-first --color=tty"
alias lsr="ls -rgtAch --group-directories-first --color=tty"
alias lsls="ls | less"
alias lsrls="lsr | less"
