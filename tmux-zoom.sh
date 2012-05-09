#!/bin/bash

current=$(tmux display-message -p '#W-#I-#P')
listado=$(tmux list-window)

[[ "$current" =~ ^(.*)-([0-9]+)-([0-9]+) ]]
current_window=${BASH_REMATCH[1]}
current_pane=${BASH_REMATCH[2]}-${BASH_REMATCH[3]}
new_zoom_window=ZOOM-$current_pane

if [[ $current_window =~ ZOOM-([0-9]+)-([0-9+]) ]]; then
  old_zoom_window=ZOOM-${BASH_REMATCH[1]}-${BASH_REMATCH[2]}
  tmux select-window -t ${BASH_REMATCH[1]} \; select-pane -t ${BASH_REMATCH[2]} \; swap-pane -s $old_zoom_window.1 \; kill-window -t $old_zoom_window
elif [[ $listado =~ $new_zoom_window ]]; then
  tmux select-window -t $new_zoom_window
else
  tmux new-window -d -n $new_zoom_window \; swap-pane -s $new_zoom_window.1 \; select-window -t $new_zoom_window
fi
