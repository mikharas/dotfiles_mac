cur_brightness=$(brightness -l | grep -Eo "0+\.[0-9]*")

if [[ $1 == "+" ]]; then
    new_brightness=$(echo "$cur_brightness + 0.05" | bc)
    echo $new_brightness
else
    new_brightness=$(echo "$cur_brightness - 0.05" | bc)
    echo $new_brightness
fi

brightness $new_brightness
