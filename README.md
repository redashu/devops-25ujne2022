# devops-25ujne2022

### Linux target 

<img src="ln.png" />

### aws cloud target 

<img src="cl.png" />

## Container Restart policy 
### Container restart policy 

[check_here](https://docs.docker.com/config/containers/start-containers-automatically/)

### how to check containr restart policy 

```
[root@ip-172-31-91-220 ~]# docker  inspect  c1   --format='{{.HostConfig.RestartPolicy.Name}}'
no
[root
```

### COmpose file for restart policy attached

```
[root@ip-172-31-91-220 ~]# cat docker-compose.yaml 
version: '3.8'
services:
  ashuapp1:
    image: c88
    container_name: ashuc12
    restart: always # mentionoed 
```
