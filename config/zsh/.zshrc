#!/bin/zsh


unset COLORTERM
export TYPEWRITTEN_PROMPT_LAYOUT="pure"
export TYPEWRITTEN_SYMBOL='$'
export TYPEWRITTEN_CURSOR='terminal'
export TYPEWRITTEN_RELATIVE_PATH='adaptive'

HISTFILE=$ZDOTDIR/history
HISTSIZE=5000
SAVEHIST=2500
setopt autocd extendedglob
unsetopt beep
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/wbr/.zshrc'
fpath+=$ZDOTDIR/plugins/typewritten
autoload -U compinit promptinit
compinit; promptinit
prompt typewritten

zstyle ':completion::complete:*' use-cache 1
# End of lines added by compinstall


if [[ -r $ZDOTDIR/aliases.zsh ]]; then
    . $ZDOTDIR/aliases.zsh
fi

if [[ -r $ZDOTDIR/functions.zsh ]]; then
    . $ZDOTDIR/functions.zsh
fi

if [[ -r $ZDOTDIR/plugins.zsh ]]; then
    . $ZDOTDIR/plugins.zsh
fi

eval "$(zoxide init zsh)"
pfetch
fpath+=${ZDOTDIR:-~}/.zsh_functions
