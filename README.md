# devops-25ujne2022

### Linux target 

<img src="ln.png" />

### aws cloud target 

<img src="cl.png" />

## creating container image without dockerfile 

```
[root@mobi-dockerserver ~]# docker  run -it --name c1 oraclelinux:8.4  
[root@67a521c5b7fe /]# yum install httpd -y
Oracle Linux 8 BaseOS Latest (x86_64)                                               105 MB/s |  50 MB     00:00    
Oracle Linux 8 Application Stream (x86_64)                                          132 MB/s |  38 MB     00:00    
Last metadata expiration check: 0:00:10 ago on Mon Sep 19 06:43:23 2022.
Dependencies resolved.
====================================================================================================================
 Package                Arch       Version                                              Repository             Size
====================================================================================================================
Installing:
 httpd                  x86_64     2.4.37-47.0.2.module+el8.6.0+20724+119b489d.2        ol8_appstream         1.4 M
Installing dependencies:
 apr                    x86_64     1.6.3-12.el8                                         ol8_appstream         129 k
 apr-util               x86_64     1.6.1-6.el8                                          ol8_appstream         105 k
 httpd-filesystem       noarch     2.4.37-47.0.2.module+el8.6.0+20724+119b489d.2        ol8_appstream          41 k
 httpd-tools            x86_64     2.4.37-47.0.2.module+el8.6.0+20724+119b489d.2        ol8_appstream         108 k
 mailcap                noarch     2.1.48-3.el8                                         ol8_baseos_latest      39 k
 mod_http2              x86_64     1.15.7-5.module+el8.6.0+20548+01710940               ol8_appstream         154 k
 oracle-logos-httpd     noarch     84.5-1.0.1.el8                                       ol8_baseos_latest      29 k
Enabling module streams:
 httpd                             2.4                                                                             

Transaction Summary
====================================================================================================================
Install  8 Packages

Total download size: 2.0 M
Installed size: 5.4 M
Downloading Packages:
(1/8): mailcap-2.1.48-3.el8.noarch.rpm                                               23 kB/s |  39 kB     00:01    
(2/8): oracle-logos-httpd-84.5-1.0.1.el8.noarch.rpm                                  16 kB/s |  29 kB     00:01    
(3/8): apr-1.6.3-12.el8.x86_64.rpm                                                   48 kB/s | 129 kB     00:02    
(4/8): apr-util-1.6.1-6.el8.x86_64.rpm                                               58 kB/s | 105 kB     00:01    
(5/8): httpd-filesystem-2.4.37-47.0.2.module+el8.6.0+20724+119b489d.2.noarch.rpm     26 kB/s |  41 kB     00:01    
(6/8): httpd-2.4.37-47.0.2.module+el8.6.0+20724+119b489d.2.x86_64.rpm               514 kB/s | 1.4 MB     00:02    
(7/8): httpd-tools-2.4.37-47.0.2.module+el8.6.0+20724+119b489d.2.x86_64.rpm          68 kB/s | 108 kB     00:01    
(8/8): mod_http2-1.15.7-5.module+el8.6.0+20548+01710940.x86_64.rpm                   85 kB/s | 154 kB     00:01    
--------------------------------------------------------------------------------------------------------------------
Total                                                                               336 kB/s | 2.0 MB     00:06     
Running transaction check
Transaction check succeeded.
Running transaction test
Transaction test succeeded.
Running transaction
  Preparing        :                                                                                            1/1 
  Installing       : apr-1.6.3-12.el8.x86_64                                                                    1/8 
  Running scriptlet: apr-1.6.3-12.el8.x86_64                                                                    1/8 
  Installing       : apr-util-1.6.1-6.el8.x86_64                                                                2/8 
  Running scriptlet: apr-util-1.6.1-6.el8.x86_64                                                                2/8 
  Installing       : httpd-tools-2.4.37-47.0.2.module+el8.6.0+20724+119b489d.2.x86_64                           3/8 
  Running scriptlet: httpd-filesystem-2.4.37-47.0.2.module+el8.6.0+20724+119b489d.2.noarch                      4/8 
  Installing       : httpd-filesystem-2.4.37-47.0.2.module+el8.6.0+20724+119b489d.2.noarch                      4/8 
  Installing       : oracle-logos-httpd-84.5-1.0.1.el8.noarch                                                   5/8 
  Installing       : mailcap-2.1.48-3.el8.noarch                                                                6/8 
  Installing       : mod_http2-1.15.7-5.module+el8.6.0+20548+01710940.x86_64                                    7/8 
  Installing       : httpd-2.4.37-47.0.2.module+el8.6.0+20724+119b489d.2.x86_64                                 8/8 
  Running scriptlet: httpd-2.4.37-47.0.2.module+el8.6.0+20724+119b489d.2.x86_64                                 8/8 
  Verifying        : mailcap-2.1.48-3.el8.noarch                                                                1/8 
  Verifying        : oracle-logos-httpd-84.5-1.0.1.el8.noarch                                                   2/8 
  Verifying        : apr-1.6.3-12.el8.x86_64                                                                    3/8 
  Verifying        : apr-util-1.6.1-6.el8.x86_64                                                                4/8 
  Verifying        : httpd-2.4.37-47.0.2.module+el8.6.0+20724+119b489d.2.x86_64                                 5/8 
  Verifying        : httpd-filesystem-2.4.37-47.0.2.module+el8.6.0+20724+119b489d.2.noarch                      6/8 
  Verifying        : httpd-tools-2.4.37-47.0.2.module+el8.6.0+20724+119b489d.2.x86_64                           7/8 
  Verifying        : mod_http2-1.15.7-5.module+el8.6.0+20548+01710940.x86_64                                    8/8 

Installed:
  apr-1.6.3-12.el8.x86_64                                                                                           
  apr-util-1.6.1-6.el8.x86_64                                                                                       
  httpd-2.4.37-47.0.2.module+el8.6.0+20724+119b489d.2.x86_64                                                        
  httpd-filesystem-2.4.37-47.0.2.module+el8.6.0+20724+119b489d.2.noarch                                             
  httpd-tools-2.4.37-47.0.2.module+el8.6.0+20724+119b489d.2.x86_64                                                  
  mailcap-2.1.48-3.el8.noarch                                                                                       
  mod_http2-1.15.7-5.module+el8.6.0+20548+01710940.x86_64                                                           
  oracle-logos-httpd-84.5-1.0.1.el8.noarch                                                                          

Complete!
[root@67a521c5b7fe /]# 
[root@67a521c5b7fe /]# 
[root@67a521c5b7fe /]# 
[root@67a521c5b7fe /]# 
[root@67a521c5b7fe /]# 
[root@67a521c5b7fe /]# ls
bin  boot  dev  etc  home  lib  lib64  media  mnt  opt  proc  root  run  sbin  srv  sys  tmp  usr  var
[root@67a521c5b7fe /]# ls
bin  boot  dev  etc  home  lib  lib64  media  mnt  opt  proc  root  run  sbin  srv  sys  tmp  usr  var
[root@67a521c5b7fe /]# exit
[root@mobi-dockerserver ~]# ls
index.html
[root@mobi-dockerserver ~]# docker  start c1 
c1
[root@mobi-dockerserver ~]# docker  cp  index.html  c1:/var/www/html/
[root@mobi-dockerserver ~]# docker  exec -it c1 bash 
[root@67a521c5b7fe /]# rpm -q httpd
httpd-2.4.37-47.0.2.module+el8.6.0+20724+119b489d.2.x86_64
[root@67a521c5b7fe /]# ls /var/www/html/
index.html
[root@67a521c5b7fe /]# exit
exit
[root@mobi-dockerserver ~]# docker  commit  c1  ashuhttp:v2 
sha256:6349fc74338c6cec64c47a28bc069d21c5a677ad6bf633f7131f3034611ae8ee
[root@mobi-dockerserver ~]# docker  images 
REPOSITORY                    TAG       IMAGE ID       CREATED         SIZE
ashuhttp                      v2        6349fc74338c   9 seconds ago   442MB
dockerashu/mobicustomer       v2        53222f9c883d   2 days ago      445MB
dockerashu/mobicustomer       v1        23191d19ae55   2 days ago      445MB
ashuhttpd                     v1        3d78a3a3ad55   3 days ago      442MB
dockerashu/ashuapp            mobiv11   d964f6e99947   5 days ago      144MB
roy-app                       0.0.1     d964f6e99947   5 days ago      144MB
sofiaaraujo/sofia-test-repo   mobiv11   d964f6e99947   5 days ago      144MB
nunoinx                       appv1     1c2f3f4a4b78   5 days ago      144MB
alpine                        latest    9c6f07244728   5 weeks ago     5.54MB
oraclelinux                   8.4       97e22ab49eea   10 months ago   246MB
centos                        latest    5d0da3dc9764   12 months ago   231MB
[root@mobi-dockerserver ~]# 

```



