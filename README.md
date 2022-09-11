# devops-25ujne2022

### Linux target 

<img src="ln.png" />

### aws cloud target 

<img src="cl.png" />

## Docker CE version 


### we are gonna use 20.x version 

### installation docs 
[link](https://docs.docker.com/engine/install/)

### Install docker server 

```
[root@docker-server ~]# yum  install docker  -y
Failed to set locale, defaulting to C
Loaded plugins: extras_suggestions, langpacks, priorities, update-motd
amzn2-core                                                                                              | 3.7 kB  00:00:00     
Resolving Dependencies
--> Running transaction check
---> Package docker.x86_64 0:20.10.17-1.amzn2 will be installed
--> Processing Dependency: runc >= 1.0.0 for package: docker-20.10.17-1.amzn2.x86_64
--> Processing Dependency: libcgroup >= 0.40.rc1-5.15 for package: docker-20.10.17-1.amzn2.x86_64
--> Processing Dependency: containerd >= 1.3.2 for package: docker-20.10.17-1.amzn2.x86_64
--> Processing Dependency: pigz for package: docker-20.10.17-1.amzn2.x86_64
--> Running transaction check
---> Package containerd.x86_64 0:1.6.6-1.amzn2 will be installed
---> Package libcgroup.x86_64 0:0.41-21.amzn2 will be installed
---> Package pigz.x86_64 0:2.3.4-1.amzn2.0.1 will be installed
---> Package runc.x86_64 0:1.1.3-1.amzn2 will be installed
--> Finished Dependency Resolution
```

### start docker service 

```
[root@docker-server ~]# systemctl start  docker 
[root@docker-server ~]# systemctl status  docker 
● docker.service - Docker Application Container Engine
   Loaded: loaded (/usr/lib/systemd/system/docker.service; disabled; vendor preset: disabled)
   Active: active (running) since Sun 2022-09-11 05:32:58 UTC; 4s ago
     Docs: https://docs.docker.com
  Process: 3510 ExecStartPre=/usr/libexec/docker/docker-setup-runtimes.sh (code=exited, status=0/SUCCESS)
  Process: 3509 ExecStartPre=/bin/mkdir -p /run/docker (code=exited, status=0/SUCCESS)
 Main PID: 3513 (dockerd)
    Tasks: 7

```

## Docker instruction 

### version 

```
[root@docker-server ~]# docker  version 
Client:
 Version:           20.10.17
 API version:       1.41
 Go version:        go1.18.3
 Git commit:        100c701
 Built:             Thu Jun 16 20:08:47 2022
 OS/Arch:           linux/amd64
 Context:           default
 Experimental:      true

Server:
 Engine:
  Version:          20.10.17
  API version:      1.41 (minimum version 1.12)
  Go version:       go1.18.3
  Git commit:       a89b842
  Built:            Thu Jun 16 20:09:24 2022
  OS/Arch:          linux/amd64
  Experimental:     false
 containerd:
  Version:          1.6.6
```

### Note: never use docker as root user 


### adding non root user to docker gorup 

```
[ec2-user@ip-172-31-92-193 ~]$ grep docker  /etc/group
docker:x:992:
[ec2-user@ip-172-31-92-193 ~]$ sudo usermod -a -G docker  ec2-user
[ec2-user@ip-172-31-92-193 ~]$ grep docker  /etc/group
docker:x:992:ec2-user
[ec2-user@ip-172-31-92-193 ~]$ 
```

### Note : close terminal in case of local system or logout via ssh in case of remote vm 

###

```
[ec2-user@docker-server ~]$ docker version 
Client:
 Version:           20.10.17
 API version:       1.41
 Go version:        go1.18.3
 Git commit:        100c701
 Built:             Thu Jun 16 20:08:47 2022
 OS/Arch:           linux/amd64
 Context:           default
 Experimental:      true

Server:
 Engine:
  Version:          20.10.17
  API version:      1.41 (minimum version 1.12)
  Go version:       go1.18.3
  Git commit:       a89b842
  Built:            Thu Jun 16 20:09:24 2022
```

### check again 

```
  12  useradd u1
   13  su - u1
   14  grep docker  /etc/group 
   15  usermod -aG docker  u1 
   16  su - u1
   17  history 
[root@docker-server ~]# useradd -G docker u2
[root@docker-server ~]# 
[root@docker-server ~]# 
[root@docker-server ~]# grep docker  /etc/group 
docker:x:992:ec2-user,u1,u2

```






