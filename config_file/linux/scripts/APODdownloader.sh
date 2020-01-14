#!/bin/bash

WDIR=$(pwd)

usage="NAME
    APOD Downloader -- A bash script to download APOD.

SYNOPSIS
    ./downloader.sh [OPTIONs] [VALUEs]

OPTIONS
    -h  show this help text
    -y  year:\t 2-digits int
    -m  month:\t 2-digits int
    -d  date:\t 2-digits int
    -v  show the version
    -t  test run; print message but download nothing

EXAMPLE
    ./downloader.sh -y 19 -m 12 -d 31\t # a single day
    ./downloader.sh -y 19 -m 12      \t # whole month
    ./downloader.sh -y 19            \t # whole year

REQUIREMENTS
    awk, curl, sed, wget"

version=0.1

_base="https://apod.nasa.gov/apod/"
_testRun=false

while getopts vhy:m:d:t option; do
  case "$option" in
  v)
    echo "$version"
    exit
    ;;
  h)
    echo -e "$usage"
    exit
    ;;
  y)
    _year=$OPTARG
    ;;
  m)
    _month=$OPTARG
    ;;
  d)
    _date=$OPTARG
    ;;
  t)
    _testRun=true
    ;;
  :)
    printf "missing argument for -%s\n" "$OPTARG" >&2
    echo "$usage" >&2
    exit 1
    ;;
  \?)
    printf "illegal option: -%s\n" "$OPTARG" >&2
    echo -e "Type\n./ClipDict.sh -h\nfor help" >&2
    exit 1
    ;;
  esac
done
shift $((OPTIND - 1))

downloader() {

  _url="${_base}ap${_year}${_month}${_date}.html"

  imgName=$(curl -s $_url | grep -i "img src" | sed -e 's/^.*=//g' | sed -e 's/\"//g' | awk -F\/ '{ print $3 }')

  downloadLink="${_base}image/${_year}${_month}/${imgName}"
  saveName="${WDIR}/${_year}${_month}${_date}_${imgName}"

  echo "${saveName}"
  if [[ ${#saveName} -gt ${#WDIR}+8 ]]; then
    # echo ${_url}
    # echo ${imgName}
    # echo ${downloadLink}
    echo "Downloading: ${saveName}"
    if [[ ${_testRun} == false ]]; then
    wget -q ${downloadLink} -O "${saveName}" 2>&1
    fi
  fi
}

jugdeProceed() {
  _proceedFlag="N"
  echo "[-] WARNING: downloading ONE year/month APOD. Proceed?[y/N]"
  read _proceedFlag
  echo ${_proceedFlag}
  if [[ ${_proceedFlag} == "N" ]]; then
    exit 1
  fi
}

main() {
  echo "[+] APOD downloader starts."
  echo "Year: ${_year}"
  echo "Month: ${_month}"
  echo "Date: ${_date}"
  if [[ -z "${_year}" ]]; then
    echo "[-] FATAL: Year not specified."
    exit 1
  fi
  if [[ -z "${_month}" && -z "${_date}" ]]; then
    # jugdeProceed
    for _month in {01..12}; do
      for _date in {01..31}; do
        downloader -y ${_year} -m ${_month} -d ${_date}
      done
    done
  elif [[ -n "${_month}" && -z "${_date}" ]]; then
    # jugdeProceed
    for _date in {01..31}; do
      downloader -y ${_year} -m ${_month} -d ${_date}
    done
  elif [[ -n "${_month}" && -n "${_date}" ]]; then
    downloader -y ${_year} -m ${_month} -d ${_date}
  fi
}

main
