#!/bin/bash

if [ $# -ne 1 ]
then 
	echo "Error : wrong number of paramaters"
	exit
fi

case $1 in
create)
	echo "This will create a new list";;
remove)
	echo "This will remove an existing list";;
add)
	echo "This will add a new todo item in a given list";;
done)
	echo "This will mark as done a given item in a given list";;
delete)
	echo "This will delete a given item from a given list";;
*)
	echo "Error : invalid parameters. Try 'todo --help' for valid options";;
esac
