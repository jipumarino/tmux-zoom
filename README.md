# Panes zooming in tmux

Install it in your personal bin directory (make sure to add it to your PATH):

    mkdir p ~/bin
    wget https://raw.github.com/jipumarino/tmux-zoom/master/tmux-zoom.rb -O ~/bin/tmux-zoom.rb
    chmod +x ~/bin/tmux-zoom.rb

And then set it up in ~/.tmux.conf

    bind C-k run "tmux-zoom.rb"

Dependencies: tmux, ruby