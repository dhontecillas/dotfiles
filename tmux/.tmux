set -g prefix C-u
bind C-u send-prefix
unbind C-b

unbind ^A
bind ^A select-pane -t :.+

set -g default-terminal "screen-256color"

setw -g mode-keys vi

tmux select-layout 3922,317x74,0,0{200x74,0,0,3,116x74,201,0[116x36,201,0,2,116x37,201,37,1]}
