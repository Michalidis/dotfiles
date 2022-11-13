#!/bin/sh
cd ~/Atteq/marble/website
tmux new-session -d -s atteq-marble-cards
tmux send -tatteq-marble-cards:1 nvim ENTER
tmux send -tatteq-marble-cards:1 ":!tmux renamew -tatteq-marble-cards:1 Website" ENTER ENTER

cd ~/Atteq/marble/webservice
tmux new-window -t atteq-marble-cards:2 -n Webservice
tmux send -tatteq-marble-cards:2 nvim ENTER
tmux send -tatteq-marble-cards:2 ":!tmux renamew -tatteq-marble-cards:2 Webservice" ENTER ENTER
