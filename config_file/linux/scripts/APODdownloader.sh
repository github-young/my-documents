#!/bin/bash

## Global Variables

WDIR=$(pwd)
_timeNow=$(date +"%y%m%d")
version=0.1
_base="https://apod.nasa.gov/apod/"
_testRun=false

## Help information

usage="NAME
    APOD Downloader -- A bash script to download APOD.

SYNOPSIS
    ./APODdownloader.sh [OPTIONs] [VALUEs]

OPTIONS
    -h  show this help text
    -y  year:\t 2-digits int
    -m  month:\t 2-digits int
    -d  date:\t 2-digits int
    -v  show the version
    -t  test run; print message but download nothing

EXAMPLE
    ./APODdownloader.sh -y 19 -m 12 -d 31\t # a single day
    ./APODdownloader.sh -y 19 -m 12      \t # whole month
    ./APODdownloader.sh -y 19            \t # whole year

REQUIREMENTS
    awk, curl, sed, wget"

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
    echo "[+] Test running..."
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

## Functions

downloader() {
  _url="${_base}ap${_year}${_month}${_date}.html"
  imgLink=$(curl -s $_url | grep -i "img src" | sed -e 's/^.*=//g' | sed -e 's/\"//g')
  imgName=$(echo ${imgLink} | awk -F\/ '{ print $3 }')
  downloadLink="${_base}${imgLink}"
  saveName="${WDIR}/${_year}${_month}${_date}_${imgName}"
  echo "  [!] SaveName is: ${saveName}"
  if [[ ${#saveName} -gt ${#WDIR}+8 ]]; then
    # echo ${_url}
    # echo ${imgName}
    # echo ${downloadLink}
    echo "  [>] Downloading to: ${saveName}"
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

judgeInputDate() {
  _dateInput=$(echo "${_month}/${_date}/20${_year}")
  #echo "[!] Input date is: ${_dateInput}"
  date -d "${_dateInput}" > /dev/null 2>&1
  if [[ $? != 0 ]]; then
    echo "[-] FATAL: Invalid input date!"
    exit 1
  fi
}

judgeCurrentDate() {
  _timeInput=$(echo "${_year}${_month}${_date}")
  #echo "[!] Input date is: ${_timeInput}"
  if [[ ${_timeInput} > ${_timeNow} ]]; then
    echo "[-] I cannot download future!"
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
        judgeInputDate
        judgeCurrentDate
        downloader -y ${_year} -m ${_month} -d ${_date}
      done
    done
  elif [[ -n "${_month}" && -z "${_date}" ]]; then
    # jugdeProceed
    for _date in {01..31}; do
      judgeInputDate
      judgeCurrentDate
      downloader -y ${_year} -m ${_month} -d ${_date}
    done
  elif [[ -n "${_month}" && -n "${_date}" ]]; then
    judgeInputDate
    judgeCurrentDate
    downloader -y ${_year} -m ${_month} -d ${_date}
  fi
  echo "[+] Done."
}

main
