# Panes zooming in tmux

Install it in your personal bin directory (make sure to add it to your PATH):

    mkdir -p ~/bin
    wget https://raw.github.com/jipumarino/tmux-zoom/master/tmux-zoom.sh -O ~/bin/tmux-zoom.sh
    chmod +x ~/bin/tmux-zoom.sh

And then set it up in ~/.tmux.conf

    bind C-k run "tmux-zoom.sh"
