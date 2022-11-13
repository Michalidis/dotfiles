#!/bin/sh
cd ~/Atteq/magazines-zoznam/frontend
tmux new-session -d -s atteq-magazines-sportky
tmux send -tatteq-magazines-sportky:1 nvim ENTER
tmux send -tatteq-magazines-sportky:1 ":!tmux renamew -tatteq-magazines-sportky:1 Frontend" ENTER ENTER

cd ~/Atteq/magazines-zoznam/admin
tmux new-window -t atteq-magazines-sportky:2 -n Admin
tmux send -tatteq-magazines-sportky:2 nvim ENTER
tmux send -tatteq-magazines-sportky:2 ":!tmux renamew -tatteq-magazines-sportky:2 Admin" ENTER ENTER

cd ~/Atteq/gearman
tmux new-window -t atteq-magazines-sportky:3 -n Gearman-server
tmux send -tatteq-magazines-sportky:3 "java -jar ~/Atteq/gearman/java-gearman-service-0.6.6.jar" ENTER
tmux send -tatteq-magazines-sportky:2 ":!tmux renamew -tatteq-magazines-sportky:3 Gearman" ENTER ENTER

cd ~/Atteq/sportky-service-layer
tmux split-window -tatteq-magazines-sportky:3 -h
tmux send -tatteq-magazines-sportky:3 nvim ENTER
tmux send-keys -tatteq-magazines-sportky:3 ft
tmux send -tatteq-magazines-sportky:3 "PROFILE=michalidis_settings APPLICATION_PACKAGE_PATH=~/Atteq/magazines-zoznam/frontend python3 service/gearman_worker.py gearman worker" ENTER
tmux send-keys -tatteq-magazines-sportky:3 C-y C-n ft
tmux send -tatteq-magazines-sportky:2 ":!tmux renamew -tatteq-magazines-sportky:3 Gearman" ENTER ENTER
