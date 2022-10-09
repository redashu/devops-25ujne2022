#!/bin/bash 

if  [ "$lang" == "python" ]
then
	python3  python/hello.py # run 

elif  [ "$lang" == "java" ]
then
	cd  java
	javac abc.java # compile  
	java myclass # run

else 
	echo "Sorry you have not selected any Language "
	sleep 5 

fi 

	

