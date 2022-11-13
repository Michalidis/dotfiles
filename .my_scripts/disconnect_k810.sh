notify-send "Keyboard K810" "Attempting to disconnect . . .";
KB_MAC_ADDR=$(bluetoothctl devices | grep K810 | head -n1 | cut -d " " -f2);
notify-send "Keyboard K810" "Disconnecting from keyboard with MAC ADDRESS ${KB_MAC_ADDR} . . .";
bluetoothctl disconnect ${KB_MAC_ADDR};
notify-send "Keyboard K810" "Untrusting keyboard with MAC ADDRESS ${KB_MAC_ADDR} . . .";
bluetoothctl untrust ${KB_MAC_ADDR};
notify-send "Keyboard K810" "Removing keyboard with MAC ADDRESS ${KB_MAC_ADDR} . . .";
bluetoothctl remove ${KB_MAC_ADDR};
notify-send "Keyboard K810" "Finished!";
