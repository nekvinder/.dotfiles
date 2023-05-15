export DP2="HDMI-1-1"
export DP1="eDP1"
dir="~/polybar"
killall -q polybar
while pgrep -x polybar >/dev/null; do sleep 1; done
rm /tmp/plog*
MONITOR="$DP1" polybar main -c "$dir/user_bars.ini" >> /dev/null 2>&1 &
sleep 2
MONITOR="$DP2" polybar secondary -c "$dir/user_bars.ini" >> /dev/null 2>&1 &
