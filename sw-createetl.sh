#!/usr/bin/env bash

function __sw_createEtl() {
  local fileName="$(date +"%Y%m%d%H%M")_$1.sql"
  info "opening $fileName"
  open $fileName
  return 0
}