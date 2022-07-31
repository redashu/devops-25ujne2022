#!/usr/bin/bash


if  [  "$1" == "cal"  ]
then
	whoami
elif  [  "$1" == "whoami" ]
then
	cal

elif [  $# -eq 0  ]
then
	echo "please pass some argument "
	sleep 1
else 
	echo "sorry you have entered wrong input"
fi
