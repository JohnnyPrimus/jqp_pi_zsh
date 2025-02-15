#!/bin/zsh
# change sh to zsh in current dir (mostly here for ref)
alias sh2zsh="for file in ./*.sh(D.); do mv \$file \$(echo \"\$file\" | sed -e 's/\.sh/\.zsh/g'); done"
