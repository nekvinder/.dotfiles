deviceMac=$(bluetoothctl list | awk '{print $2}')
bluetoothctl select $deviceMac
# bluetoothctl remove 80:0C:F9:0D:C0:6E
# bluetoothctl scan on
bluetoothctl connect 80:0C:F9:0D:C0:6E
