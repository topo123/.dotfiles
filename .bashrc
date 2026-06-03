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


PS1='[\u@\h \W]\$ '
