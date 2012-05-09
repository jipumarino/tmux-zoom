Panes zooming in tmux
----------------

I install it in my personal bin directory:

    mkdir p ~/bin
    wget https://raw.github.com/jipumarino/tmux-zoom/master/tmux-zoom.rb -O ~/bin/tmux-zoom.rb
    chmod +x ~/bin/tmux-zoom.rb

And then set it up in tmux: ~/.tmux.conf

    bind C-k run "tmux_zoom.rb"

