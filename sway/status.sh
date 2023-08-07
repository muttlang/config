#title_bar=$(swaymsg -t subscribe -m '["window"]' | jq -r '.container.name')

source /etc/os-release;

# Produces "21 days", for example
uptime_formatted=$(uptime | cut -d ',' -f1  | cut -d ' ' -f4,5)

vol=$(awk -F"[][]" '/Left:/ { print $2 }' <(amixer sget Master))

# The abbreviated weekday (e.g., "Sat"), followed by the ISO-formatted date
# like 2018-10-06 and the time (e.g., 14:01)
date_formatted=$(TZ='Europe/London' date "+%a %F %H:%M")

# Get the Linux version but remove the "-1-ARCH" part
linux_version=$(uname -r ) #| cut -d '-' -f1)

# Returns the battery status: "Full", "Discharging", or "Charging".
battery_status=$(cat /sys/class/power_supply/BAT0/capacity | awk '{print $0"%"}')

# Emojis and characters for the status bar
# 💎 💻 💡 🔌 ⚡ 📁 \|
echo  "$uptime_formatted ↑ | $NAME 🖥️ | $linux_version 🐧 | $vol 🔊 | $battery_status 🔋 | $date_formatted | "
