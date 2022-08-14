#!/bin/zsh

alias ff="fastfetch" #--set wm=$(wmname)"
alias pf=pfetch
alias l='exa --icons -alhF --no-time --octal-permissions --no-permissions --group-directories-first'
alias ll='exa --icons -alhF --time modified --octal-permissions --no-permissions --group-directories-first'
alias la='exa --icons -aF --group-directories-first'
alias zd='cd $( fd . -d 1 -t d | perl -pe "s|^./||g" | fzf )'
alias m=micro
alias portconf="sudo $EDITOR /etc/portage/make.conf"
alias mkdir='mkdir -pv'
alias cp='cp -iv'
alias mv='mv -iv'
alias rm='rm -Iv'
alias cd='z'
alias nv=nvim
alias v=nvim
alias pac='sudo pacman -S'
alias pacs='pacman -Ss'
