#!/usr/bin/env bash


function colorize() {
    local mainjs=$(realpath $USER_SCRIPTS_DIR/colors.js)
    A=($@)
    echo -e "$($mainjs ${A[0]})${A[@]:1}"
}

function err() {
  echo -e "$(colorize Red err:)$(colorize Reset) $1" 1>&2
}

function warn() {
  echo -e "$(colorize Yellow warn:)$(colorize Reset) $1" 1>&2
}

function info() {
  echo -e "$(colorize Blue info:)$(colorize Reset) $1" 1>&2
}