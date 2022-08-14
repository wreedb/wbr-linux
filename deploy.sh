#!/bin/sh

dir=$(pwd);
cdir=$dir/config
cfg=$HOME/.config;

mkdir -pv $HOME/.repo/scripts;
mkdir -pv $HOME/.repo/clones;
mkdir -pv $HOME/Pictures/screenshots;

ln -sf $cdir/alacritty $cfg/alacritty;
ln -sf $cdir/awesome $cfg/awesome;
ln -sf $cdir/berry $cfg/berry;
ln -sf $cdir/bspwm $cfg/bspwm;
ln -sf $cdir/dunst $cfg/dunst;
ln -sf $cdir/fontconfig $cfg/fontconfig;
ln -sf $cdir/kitty $cfg/kitty;
ln -sf $cdir/leftwm $cfg/leftwm;
ln -sf $cdir/nvim $cfg/nvim;
ln -sf $cdir/paru $cfg/paru;
ln -sf $cdir/picom $cfg/picom;
ln -sf $cdir/polybar $cfg/polybar;
ln -sf $cdir/spectrwm $cfg/spectrwm;
ln -sf $cdir/xmobar $cfg/xmobar;
ln -sf $cdir/xmonad $cfg/xmonad;
ln -sf $cdir/zsh $cfg/zsh;
ln -sf $dir/.zshenv $HOME/.zshenv;
ln -sf $dir/scripts $HOME/.repo/scripts;
ln -sf $dir/wallpapers $HOME/Pictures/wallpapers;
