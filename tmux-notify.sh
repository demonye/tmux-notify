#!/usr/bin/env bash

current_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source $current_dir/variables.sh

if [[ "$1" = "--clear" ]]; then
    echo > $TMUX_NOTIFY_FILE
else
    echo "$*" > $TMUX_NOTIFY_FILE
fi
