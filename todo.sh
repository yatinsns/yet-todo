#!/bin/bash

todoDir="$HOME/.todo/"
if [ ! -d $todoDir ]
then
	`mkdir $todoDir`
fi

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
		if [ -f "$todoDir/$2" ]
		then
			echo "Error : List with name $2 already exists."
		else
			`touch $todoDir/$2`
		fi
	else
		echo "Error: List name is missing"
	fi;;
remove)
	if [ -n "$2" ]
	then
		echo "This will delete an existing list with name $2"
		if [ -f "$todoDir/$2" ]
		then
			`rm -f $todoDir/$2`
		else
			echo "Error : List with name $2 does not exist"
		fi
	else
		echo "Error: List name is missing"
	fi;;
add)
	if [ -n "$2" ]
	then
		if [ ! -f $todoDir/$2 ]
		then
			echo "Error : List with name $2 does not exist"
			exit
		fi

		if [ -n "$3" ]
		then
			echo "New todo item : \"$3\" in list with name $2"
			echo "TODO $3" >> "$todoDir/$2"
		else
			echo "Error: New todo item is missing"
		fi

	else
		echo "Error: List name is missing"
	fi;;
done)
	if [ -n "$2" ]
	then
		if [ ! -f $todoDir/$2  ]
		then
			echo "Error : List with name $2 does not exist"
		fi

		if [ -n "$3" ]
		then
			echo "item number $3 in list with name $2 is DONE"
			awk -f ./awk/status.awk line=$3 status="DONE" $todoDir/$2 > $todoDir/$2.tmp
			mv $todoDir/$2.tmp $todoDir/$2
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
			awk -f ./awk/status.awk line=$3 status="TODO" $todoDir/$2 > $todoDir/$2.tmp
			mv $todoDir/$2.tmp $todoDir/$2
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
show)
	if [ -n "$2" ]
	then
		if [ -f $todoDir/$2  ]
		then
			cat $todoDir/$2
		else
			echo "Error : List with name $2 does not exist"
		fi
	else
		echo "Error : List name is missing"
	fi;;
*)
	echo "Error : invalid parameters. Try 'todo --help' for valid options";;
esac
