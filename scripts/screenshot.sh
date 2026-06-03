#!/bin/bash

	screenshot_mode=$(echo "Clipboard|Save" | rofi -sep '|' -dmenu)
	if [[ $screenshot_mode == "Clipboard" ]]; then
		grim -g "$(slurp)" - | wl-copy
		echo "Saving screenshot to clipboard"
	else
		file_name=$(rofi -dmenu -p "Please Enter Screenshot Name" -l)
		grim -g "$(slurp)" "$HOME/Screenshots/$file_name"
	fi
