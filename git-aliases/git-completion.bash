#!/usr/bin/env bash

# enable auto-complete for git branches on alias `gbbc`
_git_gbbc()
{
  _git_branch
}

# enable auto-complete for git branches on alias `gbc`
_git_gbc()
{
  _git_branch
}

# enable auto-complete for git branches on alias `createMergeBranch`
_git_create_merge()
{
  _git_branch
}

# enable auto-complete for git branches on alias `moveCommit`
_git_move_commit()
{
  _git_branch
}

# enable auto-complete for git ignore languages
_git_ignore()
{
  args=("$(cat $USER_SCRIPTS_DIR/git-aliases/_git_ignore__args | sed -e 's|\n$| |g')")
  COMPREPLY=($(compgen -W "$(echo ${args[@]})" -- "$cur"))
}
