# tmux-notify

## Setup

Add these 2 lines in the bottom of your .tmux.conf, then press `<prefix> + I` to install
```
set -g @plugin 'demonye/tmux-notify'
run '~/.tmux/plugins/tmux-notify/setup-tmux-notify.sh'
```

## Send notification

### Add this alias in your .bashrc or .zshrc, source it or re-login the terminal.
```
alias tnotify='~/.tmux/plugins/tmux-notify/tmux-notify.sh'
```

### Run this to show a notification in the tmux status bar.
```
tnoitify 'This is a test message!'
```

### Clear the notification
```
tnotify --clear
```
