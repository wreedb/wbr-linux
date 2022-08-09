#!/bin/zsh

export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share

export ZDOTDIR=$XDG_CONFIG_HOME/zsh
export ZSH_PLUGIN_DIR=$ZDOTDIR/plugins

export TERMINAL=alacritty
export BROWSER=firefox
export EDITOR=nvim
export LAUNCHER=bemenu-run

# bemenu config
export BEMENU_OPTS="-l 10 -p 'run: ' -w -i --fn 'Play 15' -c -W 0.3 -B 2 --scrollbar never --bdr '#555753' --scf '#6aa1fd' --hb '#6aa1fd' --hf '#272935' --tb '#272935' --tf '#EEEEEC' --fork"

export WALLDIR=$HOME/Pictures/wallpapers
export CONF=$XDG_CONFIG_HOME

if ! [[ "$PATH" =~ "$HOME/.local/bin" ]]
then 
  PATH="$PATH:$HOME/.local/bin"
fi

if ! [[ "$PATH" =~ "$HOME/.cargo/bin" ]]
then 
  PATH="$HOME/.cargo/bin:$PATH"
fi

if ! [[ "$PATH" =~ "$HOME/.nimble/bin" ]]
then 
  PATH="$HOME/.nimble/bin:$PATH"
fi

unset COLORTERM
