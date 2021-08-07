#!/usr/bin/env bash

function sw() {

  local dir=$SW_REPO_BASE_DIR

  if [ "$1" = "etl" ]; then
    case $2 in
      create)
        __sw_createEtl $3
        return 0
        ;;
      *)
        err 'what command?'
        return 1
    esac
  fi

  case $2 in
    discovery*)
      dir=$SW_REPO_BASE_DIR/"$2"/LimsWeb/src
      ;;
    platform)
      dir=$SW_REPO_BASE_DIR/platform/PlatformWeb/src
      ;;
    stackwavets*)
      dir=$SW_REPO_BASE_DIR/$2
      ;;
    infrastructure)
      dir=$SW_REPO_BASE_DIR/stackwave-infrastructure1-6
      ;;
    *)
      err 'what repo?'
      return 1
      ;;
  esac

  case $1 in
    goto)
      cd $dir
      ;;
    stub)
      if [ -d $dir/../../Build ]; then
        cd $(realpath $dir/../../Build)
        ./setup_stub_db.bat
        ./setup_test_db.bat
        cd -
        return 0
      else
        err 'no stubs yo'
        return 0
      fi
      ;;
    *)
      err 'what command?'
      return 0
  esac
}