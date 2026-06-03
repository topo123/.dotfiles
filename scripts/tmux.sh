#!/bin/bash

curr_tmux_sessions=$(tmux ls | sed -E "s/:.+//g" )
echo $curr_tmux_sessions
selected_session=$(echo $curr_tmux_sessions | rofi -sep  ' ' -dmenu)
tmux attach -t $selected_session



