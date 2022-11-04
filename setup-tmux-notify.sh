#!/usr/bin/env bash

current_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

prevbg=$(tmux show -g status-right |sed -n 's/.*bg=\([^]]*\)].*/\1/p')
script="#($current_dir/display-message.sh)"
status_right_length=$(tmux show -gv status-right-length)
[ $status_right_length -lt 100 ] && tmux set -g status-right-length 100
if ! tmux show -gv status-right |grep -q "$script"; then
    tmux set -ga status-right \
        "#[fg=#282a36,bg=${prevbg},nobold,nounderscore,noitalics]#[fg=#ff5555,bg=#282a36] $script "
fi
