#!/usr/bin/env bash

current_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

prevbg=$(tmux show -g status-right |sed -n 's/.*bg=\([^]]*\)].*/\1/p')
script="#($current_dir/display-message.sh)"
tmux set-option -ga status-right \
    "#[fg=#282a36,bg=${prevbg},nobold,nounderscore,noitalics]#[fg=#ff5555,bg=#282a36] $script "
