#!/usr/bin/env bash

export IIS_EXPRESS_X64_DIR=$(toPosixPath "$PROGRAMFILES/IIS Express")
alias iis="$IIS_EXPRESS_X64_DIR/iisexpress.exe"

function startiis() {
    case $1 in
    discovery*)
        iis /config:$(cygpath -w "$SW_DISCOVERY_BASE_DIR/.vs/DiscoveryLims/config/applicationhost.config") /site:LimsWeb
    ;;
  esac
}

function stopiis() {
  r=`ps ax | grep -C 0 iisexpress | awk 'FNR==1{print $1}'`
  if [ ! -z "$r" ]
  then
    echo -e "Killing: $(colorize Bright iisexpress)$(colorize Reset) (pid: ${r})"
    kill $r
  else
    echo -e "Not running: $(colorize Bright iisexpress)$(colorize Reset)"
  fi
}