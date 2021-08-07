#!/usr/bin/env bash

_goto_completions() {
  local repo_list=("$(ls -d $SW_REPO_BASE_DIR/discovery* | sed -e 's|.*/\(.*\)$|\1|g')" "stackwavets" "stackwavets-lims" "infrastructure" "platform")

  case $cur in
    *)
      COMPREPLY=($(compgen -W "$(echo ${repo_list[@]})" -- "$cur"))
      ;;
  esac

  return 0
}

_stub_completions() {
  local repo_list=("$(ls -d $SW_REPO_BASE_DIR/discovery* | sed -e 's|.*/\(.*\)$|\1|g')" "platform")

  case $cur in
    *)
      COMPREPLY=($(compgen -W "$(echo ${repo_list[@]})" -- "$cur"))
      ;;
  esac

  return 0
}

_etl_completions() {
  case $cur in
    *)
      COMPREPLY=($(compgen -W "create" -- "$cur"))
      ;;
  esac

  return 0
}

_sw_completions() {
  COMPREPLY=()
  local cur prev command=${COMP_WORDS[1]}
  cur=${COMP_WORDS[COMP_CWORD]}
  prev=${COMP_WORDS[COMP_CWORD-1]}

  if [ $COMP_CWORD -gt 2 ]; then
    local arg=${COMP_WORDS[COMP_CWORD-1]}
    COMPREPLY=()
    return 0
  fi

  case $command in
    goto)
      _goto_completions $COMP_WORDS
      ;;
    stub)
      _stub_completions $COMP_WORDS
      ;;
    etl)
      _etl_completions $COMP_WORDS
      ;;
    *)
      COMPREPLY=($(compgen -W "goto stub etl" -- "$cur"))
      ;;
  esac

  return 0
}

complete -F _sw_completions sw