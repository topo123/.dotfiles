#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

screenshot(){
	screenshot_mode=$(echo "Clipboard|Save" | rofi -sep '|' -dmenu)
	if [[ $screenshot_mode == "Clipboard" ]]; then
		grim -g "$(slurp)" - | wl-copy
		echo "Saving screenshot to clipboard"
	else
		file_name=$(rofi -dmenu -p "Please Enter Screenshot Name" -l)
		grim -g "$(slurp)" "$HOME/Screenshots/$file_name"
	fi
}

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '
