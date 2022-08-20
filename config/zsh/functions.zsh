#!/bin/zsh

fontq() { fc-list : family | rg -i $1 }

readme() { glow -p README.md }

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

wmdir() {
  cd $(printf "$XDG_CONFIG_HOME/$DESKTOP_SESSION\n")
}

function man() {
	env \
		LESS_TERMCAP_md=$(tput bold; tput setaf 4) \
		LESS_TERMCAP_me=$(tput sgr0) \
		LESS_TERMCAP_mb=$(tput blink) \
		LESS_TERMCAP_us=$(tput setaf 2) \
		LESS_TERMCAP_ue=$(tput sgr0) \
		LESS_TERMCAP_so=$(tput smso) \
		LESS_TERMCAP_se=$(tput rmso) \
		PAGER="${commands[less]:-$PAGER}" \
		man "$@"
}

db() { sudo updatedb; sudo fc-cache -f; sudo mandb --quiet; fc-cache -f}

zd() {
  cd $(fd . "$PWD" -d 1 -t d -H | perl -pe "s|$PWD\/||g; s|\/$||g;" | fzf);
}
