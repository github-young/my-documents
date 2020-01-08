#!/bin/bash

usage="NAME
    ClipDict -- A command line wrapper of dictd reading from your clipboard.

SYNOPSIS
    ClipDict.sh [OPTION] [value]

OPTIONS
    -h  show this help text
    -m  set the working MODE:
          copy    translate a word when copied (default)
          select  translate a word upon selected
    -n  display the output in system notifications or terminal
          false  in terminal (default)
          true   in system notifications
    -v  show the version

EXAMPLE
    ./ClipDict.sh
    ./ClipDict.sh -m select -n true

REQUIREMENTS
    xclip, dictd"

version=0.1
MODE="copy"
NOTIFY=false

while getopts vhm:n: option; do
  case "$option" in
    v) echo "$version"
       exit
       ;;
    h) echo "$usage"
       exit
       ;;
    m) MODE=$OPTARG
       ;;
    n) NOTIFY=true
       ;;
    :) printf "missing argument for -%s\n" "$OPTARG" >&2
       echo "$usage" >&2
       exit 1
       ;;
   \?) printf "illegal option: -%s\n" "$OPTARG" >&2
       echo -e "Type\n./ClipDict.sh -h\nfor help" >&2
       exit 1
       ;;
  esac
done
shift $((OPTIND - 1))


main() {
  oldWord=""
  echo -e "ClipDict is on. Copy or select a word and get it translated.\n"
  echo $oldWord | xclip
  echo $oldWord | xclip -sel clip
  while true; do
    sleep 1
    if [[ -n $MODE ]] && [[ $MODE == "copy" ]]; then
      RES=$(xclip -o -sel clip | sed -e 's/[^[:alpha:]]//g')
    elif [[ -n $MODE ]] && [[ $MODE == "select" ]]; then
      RES=$(xclip -o | sed -e 's/[^[:alpha:]]//g')
    fi

    if [[ -n $RES ]] && [[ $RES != $oldWord ]] && [[ $NOTIFY == false ]]; then
      echo $RES | xargs dict
      oldWord=$RES
    elif [[ -n $RES ]] && [[ $RES != $oldWord ]] && [[ $NOTIFY == true ]]; then
      notify-send "$(echo $RES | xargs dict)"
      oldWord=$RES
    fi
  done
}

if [[ -z $(command -v xclip) ]]; then
  echo "[-] Install xclip first"
  exit 1
fi

if [[ -z $(command -v dict) ]]; then
  echo "[-] Install dict first"
  exit 1
fi

main
