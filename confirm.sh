#!/usr/bin/env bash

# result=$(confirm "are you sure?")
# $> are you sure? [y/N]: 
# if [[ $result -eq 0 ]]
# then
#   echo "no"
# fi
# # defaults to no
# # > 0 - no
# # > 1 - yes
function confirm() {
    while true; do
        read -p "$(colorize Yellow)$1$(colorize Reset) [y/$(colorize Bold)N$(colorize Reset)]: " yn
        case $yn in
            [Yy]* ) echo 1; break;;
            [Nn]* | *) echo 0; break;;
        esac
    done
}