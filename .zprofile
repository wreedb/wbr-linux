#!/usr/bin/zsh

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
export GIT_CONFIG_SYSTEM=$XDG_CONFIG_HOME/git/gitconfig

export TERMINAL=kitty
export EDITOR=nvim
export LAUNCHER=bemenu-run
export BROWSER=firefox
export COMPOSITOR=picom

#Path edits

if ! [[ "$PATH" =~ "$HOME/.local/bin" ]]; then
  PATH="$HOME/.local/bin:$PATH";
fi

if ! [[ "$PATH" =~ "$HOME/.cargo/bin" ]]; then
  PATH="$PATH:$HOME/.cargo/bin";
fi

if ! [[ "$PATH" =~ "$HOME/.nimble/bin" ]]; then
  PATH="$PATH:$HOME/.nimble/bin";
fi

if ! [[ "$PATH" =~ "$HOME/.ghcup/bin" ]]; then
  PATH="$PATH:$HOME/.ghcup/bin";
fi

if ! [[ "$PATH" =~ "$HOME/.cabal/bin" ]]; then
  PATH="$PATH:$HOME/.cabal/bin";
fi

export BEMENU_OPTS="-l 10 -p 'run: ' -w -i --fn 'Play 15' -c -W 0.2 -B 2 --scrollbar never --bdr '#555753' --scf '#6AA1FD' --hb '#6AA1FD' --cf '#27293500' --hf '#272935' --tb '#272935' --tf '#EEEEEC' --fork"

#export BEMENU_OPTS="bemenu-run \
#--prompt 'run:' \
#--fn 'Play 17' \
#--list 8 \
#--wrap \
#--index 40 \
#--line-height 17 \
#--grab \
#--ignorecase \
#--width-factor 100 \
#--ifne \
#--monitor focused \
#--hf '#181921' \
#--hb '#6AA1FD' \
#--tf '#181921' \
#--tb '#6AA1FD' \
#--cf '#6AA1FD' \
#--nb '#181921' \
#--nf '#D3D7CF' \
#--ab '#181921' \
#--af '#D3D7CF' \
#--ff '#EEEEEC' \
#--fb '#000000'"
