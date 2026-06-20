#
# ~/.bashrc
#

export PROJECTS="/home/petera/projects"

find-projects()
{
	project_type=$(ls $PROJECTS | fzf)
	project_dir=$(ls $PROJECTS/$project_type | fzf)
	cd "$PROJECTS/$project_type/$project_dir"
}

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
export dotfiles="$HOME/.dotfiles"
alias reload="source $HOME/.bashrc"

fg_color="\[\e[38;2;204;196;165m\]"
bracket_color="\[\e[38;2;113;124;128m\]"
reset='\[\e[0m\]'


PS1="$bracket_color\T$reset 󰣇  $fg_color\u$reset 󰉋 $bracket_color($reset$fg_color\w$reset$bracket_color)$reset  "
