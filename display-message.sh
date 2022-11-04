#!/usr/bin/env bash

current_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source $current_dir/variables.sh

main()
{
    prev_message=
    status_interval=$(tmux show -gv status-interval)
    (( flash_times = status_interval / 2 ))
    i=0; while [ $i -lt $flash_times ]; do
        message="$(cat $TMUX_NOTIFY_FILE 2>/dev/null)"
        [ -z "$message" ] && echo && break
        if [[ "$message" != "$prev_message" ]]; then
            j=0; placeholder=; while [ $j -lt ${#message} ]; do
                [ $(echo -n "${message:$j:1}" |wc -c) -eq 1 ] && placeholder+=" " || placeholder+="  "
                (( j += 1 ))
            done
        fi
        sleep 1 && echo "$message" && sleep 1 && echo "$placeholder"
        prev_message="$message"
        (( i += 1 ))
    done
}

main
