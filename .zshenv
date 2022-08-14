#!/bin/zsh

export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
export ZDOTDIR=$XDG_CONFIG_HOME/zsh
export ZSH_PLUGIN_DIR=$ZDOTDIR/plugins
export WALLPAPERS_DIR=$HOME/Pictures/wallpapers
export SCREENSHOTS_DIR=$HOME/Pictures/screenshots
export SCRIPTS_DIR=$HOME/.repo/scripts

# change less history file location
export LESSHISTFILE=$XDG_CACHE_HOME/less_history
export LESSHISTSIZE=150

# change gitconfig location
export GIT_CONFIG_GLOBAL=$XDG_CONFIG_HOME/git/gitconfig

export TERMINAL=kitty
export BROWSER=firefox
export EDITOR=nvim
export LAUNCHER=bemenu-run
export COMPOSITOR=picom
export BEMENU_OPTS="-l 10 -p 'run: ' -w -i --fn 'Play 15' -c -W 0.3 -B 2 --scrollbar never --bdr '#555753' --scf '#6BF1BE' --hb '#6BF1BE' --hf '#272935' --tb '#272935' --tf '#EEEEEC' --fork"

unset COLORTERM

. "$ZDOTDIR/path.zsh"
