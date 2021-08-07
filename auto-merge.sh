#!/usr/bin/env bash

function __autoMerge_merge() {
    local source_branch=$1
    local dest_branches=()

    case $source_branch in
        release/v8.4)
            dest_branches+=( "epic/phage-panning" "epic/sequence-analysis" "release/SRK-v2.0" "release/v9.0" )
            ;;
        epic/phage-panning)
            dest_branches+=( "release/SRK-v2.0" "release/v9.0" )
            ;;
        release/SRK-v2.0)
            dest_branches+=( "release/SRK-v3.0" )
            ;;
    esac

    for branch in ${dest_branches[@]}; do
        echo "$(echo -n "git checkout $branch && git pull") && git merge $source_branch"
        __autoMerge_merge $branch
    done
}

function auto_merge() {
    local current_branch=$(git rev-parse --abbrev-ref HEAD)

    echo "Automatically merging \"$current_branch\" (current branch) to dependents"
    echo "git fetch"
    __autoMerge_merge $current_branch
    echo "git checkout $current_branch"
}

# createMergeBranch "$1"

# #!/bin/sh
# # Automatically merge the last commit through the following branches:
# # 2.1 -} 2.2 -} 2.3 -} master

# CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD)
# LAST_COMMIT=$(git rev-list -1 HEAD)

# echo Automatically merging commit $LAST_COMMIT from $CURRENT_BRANCH rippling to master

# case $CURRENT_BRANCH in
# 2.1)
#   git checkout 2.2 ＆＆ git merge $CURRENT_BRANCH
#   git checkout 2.3 ＆＆ git merge 2.2
#   git checkout master ＆＆ git merge 2.3
#   git checkout $CURRENT_BRANCH
#   ;;
# 2.2)
#   git checkout 2.3 ＆＆ git merge 2.2
#   git checkout master ＆＆ git merge 2.3
#   git checkout $CURRENT_BRANCH
#   ;;
# 2.3)
#   git checkout master ＆＆ git merge 2.3
#   git checkout $CURRENT_BRANCH
#   ;;
# esac