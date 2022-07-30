#!/usr/bin/bash

#echo $1
#echo $2
echo $@
echo $# # number of input given by user 
# using for loop which will collect data in pic one by one 
echo "Now using for loop to print "
sleep 2 
# for can take input data from files / manual input OR from inline input also
# for x in `cat /etc/passwd`
for x  in  $@
do
	$x &>/dev/nul
	status=`echo $?`
	if [ $status -eq 0  ]
	then 
		echo "you command $x is valid please wait for output"
		sleep 1
		$x
		echo "______________________________________________"
		echo "______________________________________________"
		echo "______________________________________________"
	else 
		echo "your command $x is not in my system so please check"
		sleep 1
		echo "______________________________________________"
		echo "______________________________________________"
		echo "______________________________________________"
		
	fi 
done
