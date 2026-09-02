#!/bin/bash

tmux_output=$(tmux ls 2> /dev/null)

if [[ $? == 1 ]]; then
	echo "No available tmux sessions to search" 
	exit 1
fi


curr_tmux_sessions=$(echo $tmux_output | sed -E "s/:.+//g" )
selected_session=$(echo $curr_tmux_sessions | fzf --delimiter=' ')


if [[ $selected_session == "" ]]; then
	echo "No selected session exiting"
elif [[ $1 == "delete" || $1 == "del" || $1 == "d" ]]; then
	tmux kill-session -t $selected_session
else
	tmux attach -t $selected_session
fi




