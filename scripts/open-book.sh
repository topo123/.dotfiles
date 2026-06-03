#!/bin/bash

cd $HOME/Textbooks

url_head="file:///home/petera/Textbooks/"
selected_book=$(find . -type f -name *.pdf | sed -E 's/\.\/.+\///g' | rofi -dmenu)
relative_book_path=$(find . -type f -name "$selected_book")


firefox --private-window "$url_head$relative_book_path"
