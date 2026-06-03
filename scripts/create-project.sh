#!/bin/bash

read -p "Do you want to create a new project type [y/n]? " ans

if [[ $ans == "y" || $ans == "yes" ]]; then
	read -p "Provide the project type name: " ans
	mkdir $PROJECTS/$ans
elif [[ !($ans == "n" || $ans == "no") ]]; then
	echo "Invalid option provided"
fi

echo "Project Types you can create from."

mapfile -t TYPES < <(ls $PROJECTS)

for (( i=0; i<${#TYPES[@]}; i=i+1 )); do
	echo "$(( $i + 1 )). ${TYPES[$i]}"
done


read -p "Select a number from listed below to select what type of project you would like to create: " wrong_index
read -p "Please type the name of the project directory: " proj_dir_name


index=$(( $wrong_index - 1 ))
selected_type=${TYPES[$index]}

echo $index $selected_type

create_cpp_proj() 
{
	mkdir $PROJECTS/$selected_type/$proj_dir_name && cd $PROJECTS/$selected_type/$proj_dir_name

	git init 
	touch CMakeLists.txt .gitignore
	mkdir src include

	printf '%s\n' \
	"project($proj_dir_name)" \
	"cmake_minimum_required(VERSION 3.5)" \
	"set(cmake_version 4.3)" \
	"set(cmake_cxx_standard 17)" \
	"set(cmake_cxx_standard_required on)" \
	"set(cmake_cxx_compiler g++)" \
	"set(cmake_export_compile_commands on)" \
	"set(cmake_cxx_flags \"\${cmake_cxx_flags} -g\")" >> CMakeLists.txt 

	echo "build/" >> .gitignore
}

if [[ $selected_type == "cpp" ]]; then
	create_cpp_proj
fi


