#!/bin/bash

declare -A lib_dirs
lib_dirs["Novels"]="$HOME/Calibre Library"
lib_dirs["Textbooks"]="$HOME/Textbooks"

if [[ ! -p "books" ]]; then
	mkfifo books
fi

if [[ ! -d $HOME/ebook-additions ]]; then
	mkdir $HOME/ebook-additions
fi

library=$(echo ${!lib_dirs[@]} | rofi -dmenu -sep ' ')

exit_sig() {
	killall inotifywait
}

trap exit_sig SIGINT SIGTERM

inotifywait -m -e create $HOME/ebook-additions > books &

book_tile=""

while read -r book; do
	echo $book
done < books



#calibre --with-library ${lib_dirs[$library]}


