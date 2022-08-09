#!/bin/zsh

fontq () { fc-list : family | rg -i $1 }

mktar() {
  if [ -z "$1" ]
  then
    printf "no argument given...\n";
  else
    archive=$(echo "$1" | perl -pe 's|\/||g')
    bsdtar -cvf $archive.tar $archive; gzip -9 $archive.tar
  fi
}

untar() {
  if [ -z "$1" ]
  then
    printf "no argument given...\n";
  else
    bsdtar -xvf $1
  fi
}


db() { sudo updatedb; sudo fc-cache -f; sudo mandb --quiet; fc-cache -f}
