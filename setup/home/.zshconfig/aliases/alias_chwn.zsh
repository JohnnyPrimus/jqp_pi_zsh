#!/bin/zsh
alias chwnme="sudo chown -hR $(whoami):$(groups | awk '{ print $1 }') "
alias chwn="echo \"Use 'chwnme' instead\""
alias chwnus="sudo chown -hR $(whoami):users "
alias chwnr="sudo chown -hR root:root "
alias chx="sudo chown +x "
alias chxu="chown +x "
