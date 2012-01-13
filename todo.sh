#!/bin/bash

if [ $# -eq 0 ]
then 
	echo "Error : wrong number of paramaters"
	exit
fi

case $1 in
create)
	if [ -n "$2" ]
	then
		echo "This will create a new list with name $2"	
	else
		echo "Error: List name is missing"
	fi;;
remove)
	if [ -n "$2" ]
	then
		echo "This will delete an existing list with name $2"
	else
		echo "Error: List name is missing"
	fi;;
add)
	if [ -n "$2" ]
	then
		if [ -n "$3" ]
		then
			echo "New todo item : \"$3\" in list with name $2"
		else
			echo "Error: New todo item is missing"
		fi

	else
		echo "Error: List name is missing"
	fi;;
done)
	if [ -n "$2" ]
	then
		if [ -n "$3" ]
		then
			echo "item number $3 in list with name $2 is DONE"
		else
			echo "Error: item number is missing"
		fi
	else
		echo "Error: List name is missing"
	fi;;
undone)
	if [ -n "$2" ]
	then
		if [ -n "$3" ]
		then
			echo "item number $3 in list with name $2 is TODO"
		else
			echo "Error: item number is missing"
		fi
	else
		echo "Error: List name is missing"
	fi;;
delete)
	if [ -n "$2" ]
	then
		if [ -n "$3" ]
		then
			echo "item number $3 is deleted from list with name $2"
		else
			echo "Error: item number is missing"
		fi
	else
		echo "Error: List name is missing"
	fi;;
*)
	echo "Error : invalid parameters. Try 'todo --help' for valid options";;
esac
