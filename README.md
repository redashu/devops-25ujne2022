## How to setup apache httpd web server in amaazon LInux over ec2 

### step 1 

```
yum install httpd  git 
```

### step 2 download some sample code from Github 

```
git clone https://github.com/schoolofdevops/html-sample-app

```

### step 3  copy code of website to apache httpd server locaiton 

```
[root@ip-172-31-17-34 ~]# cp -rf  html-sample-app/*   /var/www/html/
[root@ip-172-31-17-34 ~]# 
[root@ip-172-31-17-34 ~]# 
[root@ip-172-31-17-34 ~]# cd  /var/www/html/
[root@ip-172-31-17-34 html]# ls
assets         generic.html         images      LICENSE.txt
elements.html  html5up-phantom.zip  index.html  README.txt
[root@ip-172-31-17-34 html]# 


```

### final step to start httpd server service 

```
root@ip-172-31-17-34 html]# systemctl start  httpd
[root@ip-172-31-17-34 html]# systemctl status  httpd
● httpd.service - The Apache HTTP Server
   Loaded: loaded (/usr/lib/systemd/system/httpd.service; disabled; vendor preset: disabled)
   Active: active (running) since Sun 2022-07-24 05:26:04 UTC; 11s ago
     Docs: man:httpd.service(8)
 Main PID: 4677 (ht
```

