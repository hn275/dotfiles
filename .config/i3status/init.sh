#!/bin/sh
# shell script to prepend i3status with more stuff

bin="$XDG_CONFIG_HOME/i3status/scripts/bin"
cpu_temp="$($bin/cpu_temp)"
cpu_usage="$($bin/cpu_usage)"
ram_usage="$($bin/ram_usage)"
disk_space="$($bin/disk_space)"
now() {
    date +'%a %d-%m-%Y %R'
}

# brightnesss
brightness(){
    b="$(brightnessctl | grep -Po '\(\K[^)^\%]*') %"
    echo $b
}

# volume
vol() {
    mute=$(pactl get-sink-mute @DEFAULT_SINK@ | awk 'FNR == 1 { print $2 }')
    if [ $mute != "no" ];then
        echo "muted"
        return
    fi
    v="$(amixer | awk 'FNR == 6 { print $5 }' | grep -Po '\[\K[^]%]*') %"
    echo $v
}

i3status | while :
do
    read line
    echo "$line|VOL $(eval vol)|${cpu_temp}|${ram_usage}|${cpu_usage}|${disk_space}|$(eval now)|$line" || exit 1
done
