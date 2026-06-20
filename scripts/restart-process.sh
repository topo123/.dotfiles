#!/bin/bash

process_id=$(pgrep $1)

if [[ $process_id == "" ]]; then
	hyprctl dispatch "hl.dsp.exec_cmd(\"$1\")"
else
	killall -SIGUSR2 $1
fi
