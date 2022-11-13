#!/bin/bash

notify-send "Keyboard K810" "Detecting keyboard MAC ADDRESS . . .";
KB_MAC_ADDR=$(hcitool -i hci0 scan | grep K810 | head -n1 | cut -d "	" -f2);
notify-send "Keyboard K810" "MAC ADDRESS ${KB_MAC_ADDR} detected!";

notify-send "Keyboard K810" "Unblocking keyboard with MAC ADDRESS ${KB_MAC_ADDR} . . .";
bluetoothctl unblock ${KB_MAC_ADDR};


notify-send "Keyboard K810" "Pairing with keyboard with MAC ADDRESS ${KB_MAC_ADDR} . . .";
bluetoothctl pair ${KB_MAC_ADDR};

notify-send "Keyboard K810" "Trusting keyboard with MAC ADDRESS ${KB_MAC_ADDR} . . .";
bluetoothctl trust ${KB_MAC_ADDR};

notify-send "Keyboard K810" "Connecting to keyboard with MAC ADDRESS ${KB_MAC_ADDR} . . .";
bluetoothctl connect ${KB_MAC_ADDR};

notify-send "Keyboard K810" "Finished!";
