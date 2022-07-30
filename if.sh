#!/usr/bin/bash


if  [  "$1" == "cal"  ]
then
	whoami
elif  [  "$1" == "whoami" ]
then
	cal
else 
	echo "sorry you have entered wrong input"
fi
