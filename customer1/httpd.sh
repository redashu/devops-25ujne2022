#!/bin/bash

if  [  "$deploy" == "webapp1"  ]
then
	cp -rf /myapp/app1/*  /var/www/html/
	httpd -DFOREGROUND

elif  [  "$deploy" == "webapp2"  ]
then
	cp -rf /myapp/app2/*  /var/www/html/
	httpd -DFOREGROUND

else 
	echo "You have supplied wrong variable value "  >/var/www/html/index.html
	httpd -DFOREGROUND

fi 
