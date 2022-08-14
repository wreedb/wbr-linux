#!/bin/zsh

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

if ! [[ "$PATH" =~ "$HOME/.ghcup/bin" ]]
then
  PATH="$HOME/.ghcup/bin:$PATH"
fi

if ! [[ "$PATH" =~ "$HOME/.cabal/bin" ]]
then
  PATH="$HOME/.cabal/bin:$PATH"
fi
