#!/bin/bash

if [[ $EUID == 0 ]]; then
	TARGET_USER="${SUDO_USER:-sudo}"
	TARGET_HOME="/home/$TARGET_USER"
else
	TARGET_USER="$USER"
	TARGET_HOME="$HOME"
fi

DOTFILES="$TARGET_HOME/.dotfiles/"

declare -A install_directories
declare -A install_files

#install directories array
install_directories["hypr"]="$TARGET_HOME/.config/hypr"
install_directories["kitty"]="$TARGET_HOME/.config/kitty"
install_directories["rofi"]="$TARGET_HOME/.config/rofi"
install_directories["tmux"]="$TARGET_HOME/.config/tmux"
install_directories["waybar"]="$TARGET_HOME/.config/waybar"
install_directories["nvim"]="$TARGET_HOME/.config/nvim"

#install files array
install_files["gtk3-colors.css"]="$TARGET_HOME/.config/gtk3-colors.css"
install_files+=(["scripts/create-project.sh"]="/usr/local/bin/create-project.sh" \
	["scripts/open-book.sh"]="/usr/local/bin/open-book.sh" \
	["scripts/screenshot.sh"]="/usr/local/bin/screenshot.sh" \
	["scripts/tmux.sh"]="/usr/local/bin/tmux.sh" \
)

install_all_configs()
{
	for directory in  "${!install_directories[@]}"; do

		if [[ -L ${install_directories[$directory]} || -d ${install_directories[$directory]} ]];  then
			echo "The $directory config already exists in ${install_directories[$directory]}"
		else
			echo "Installing the $directory config to ${install_directories[$directory]}"
			ln -s $DOTFILES/$directory ${install_directories[$directory]}
		fi

	done

	for file in "${!install_files[@]}"; do

		if [[ -L ${install_files[$file]} || -d ${install_files[$file]} ]];  then
			echo "The $file config already exists in ${install_files[$file]}"
		else
			echo "Installing the $file to ${install_files[$file]}"
			ln -s $DOTFILES/$file ${install_files[$file]}
		fi

	done

}

install_config_directories()
{
	for directory in "${!install_directories[@]}"; do
		read -p "Do you want to install $directory? [y/n]? " dir

		if [[ $dir == "y" || $dir == "yes" ]]; then

			if [[ -L ${install_directories[$directory]} || -d ${install_directories[$directory]} ]];  then
				echo "The $directory config already exists in ${install_directories[$directory]}"
			else
				echo "Installing the $directory to ${install_directories[$directory]}"
				ln -s $DOTFILES/$directory ${install_directories[$directory]}
			fi

		elif [[ $dir == "n" || $dir == "no" ]]; then
			echo "Not installing the $directory to ${install_directories[$directory]}"
		else
			echo "Valid option was not provided"
		fi

	done
}

install_config_files()
{
	for file in "${!install_files[@]}"; do
		read -p "Do you want to install $file? [y/n]? " confirm

		if [[ $confirm == "y" || $confirm == "yes" ]]; then

			if [[ -L ${install_files[$file]} || -d ${install_files[$file]} ]];  then
				echo "The $directory config already exists in ${install_files[$file]}"
			else
				echo "Installing the $file to ${install_files[$file]}"
				ln -s $DOTFILES/$file ${install_files[$file]}
			fi

		elif [[ $confirm == "n" || $confirm == "no" ]]; then
			echo "Not installing the $file to ${install_files[$file]}"
		else
			echo "Valid option was not provided"
		fi

	done
}

read -p "Do you want to install every config file and directory?" install_all

if [[ $install_all == 'y' || $install_all == 'yes' ]]; then
	install_all_configs
else
	install_config_directories
	install_config_files
fi
