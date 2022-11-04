#!/usr/bin/env bash

current_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source $current_dir/variables.sh

main()
{
    message="$(cat $TMUX_NOTIFY_FILE 2>/dev/null)"
    i=0; placeholder=""
    while [ $i -lt ${#message} ]; do
        [ $(echo -n "${message:$i:1}" |wc -c) -eq 1 ] && placeholder+=" " || placeholder+="  "
        i=$(($i + 1))
    done
    if [ -n "$message" ]; then
        i=0; while [ $i -lt 5 ]; do
            sleep 1 && echo "$message" && sleep 1 && echo "$placeholder"
            ((i += 1))
        done
    fi
}

main
