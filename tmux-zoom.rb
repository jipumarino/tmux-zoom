#!/usr/bin/env ruby

current = `tmux display-message -p '#W-#I-#P' \\; list-window`
current.match /^(.*)-(\d+)-(\d+)\n/
current_window = $1
current_pane = "#{$2}-#{$3}"
new_zoom_window = "ZOOM-#{current_pane}"
listado = current

if current_window.match /^ZOOM-(\d+)-(\d+)$/
  old_zoom_window = "ZOOM-#{$1}-#{$2}"
  `tmux select-window -t #{$1} \\; select-pane -t #{$2} \\; swap-pane -s #{old_zoom_window}.1 \\; kill-window -t #{old_zoom_window}`
elsif listado.match new_zoom_window
  `tmux select-window -t #{new_zoom_window}`
else
  `tmux new-window -d -n #{new_zoom_window} \\; swap-pane -s #{new_zoom_window}.1 \\; select-window -t #{new_zoom_window}`
end