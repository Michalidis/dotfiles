#!/bin/sh
cd ~/Atteq/magazines-telkac
tmux new-session -d -s atteq-telkac
tmux send -tatteq-telkac:1 nvim ENTER
tmux send -tatteq-telkac:1 ":!tmux renamew -tatteq-telkac:1 Telkac" ENTER ENTER

