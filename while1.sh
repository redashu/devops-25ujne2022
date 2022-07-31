#!/usr/bin/bash


#cat /etc/os-release |  grep -i ubuntu  &>/dev/null
#status=`echo $?`
nou=`cat /etc/passwd | wc -l`

while [ $nou -gt 50 ]  
do
	uptime
	sleep 1
	nou=`expr $nou - 1` 
	echo $nou
done
