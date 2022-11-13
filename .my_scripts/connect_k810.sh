#!/bin/sh
cd ~/.my_scripts/
notify-send "Keyboard K810" "Starting scan . . .";
tmux new-session -d -s connect
tmux send -tconnect:1 "bluetoothctl scan on" ENTER
sleep 15
notify-send "Keyboard K810" "Stopping scan . . .";
tmux send -tconnect:1 "C-c" ENTER

cd ~/.my_scripts/
tmux send -tconnect:1 "./_connect_k810.sh" ENTER

