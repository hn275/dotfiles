#!/bin/sh
# shell script to prepend i3status with more stuff

bin=/home/haln/Repositories/i3status/bin
cpu_temp=$(acpi -t | awk '{print $4 " " $6}')
cpu_usage="$($bin/cpu_usage $(mpstat | awk 'FNR == 4 { print $13 }')) %"

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
    echo "VOL $(eval vol) | BRI $(eval brightness) | TEMP ${cpu_temp} | CPU ${cpu_usage} | $line" || exit 1
done
