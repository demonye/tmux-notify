#!/usr/bin/env bash

current_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source $current_dir/variables.sh

main()
{
    message=$(cat $TMUX_NOTIFY_FILE 2>/dev/null)
    i=0; placeholder=""
    while [ $i -lt ${#message} ]; do
        [ $(echo -n "${message:$i:1}" |wc -c) -eq 1 ] && placeholder+="*" || placeholder+="**"
        i=$(($i + 1))
    done
    if [ -n "$message" ]; then
        for i in 1 2 3; do
            echo $message && sleep 1.5 && echo "$placeholder" && sleep 1.5
        done
    fi
}

main
