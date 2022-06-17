{ echo "XIDeviceEnabled XISlaveKeyboard"; inputplug -d -c /bin/echo; } |
while read event
do
        case $event in
        XIDeviceEnabled*XISlaveKeyboard*)
                xset r rate 200 40
                ;;
        esac
done &
