# devops-25ujne2022

### Linux target 

<img src="ln.png" />

### aws cloud target 

<img src="cl.png" />

## Container Restart policy 
### Container restart policy 

[check_here](https://docs.docker.com/config/containers/start-containers-automatically/)

### create container -- with restart policy 

```
docker  run -itd --name ashuc9  --restart  always  alpine
```


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


### Control groups 

```
 docker  run -itd --name c9 --memory 100M   --restart always alpine ping fb.com
```

### -- giving cpu-shares to containers 

```
[ec2-user@ip-172-31-91-220 ~]$ docker run --help  |  grep -i cpu 
      --cpu-period int                 Limit CPU CFS (Completely Fair Scheduler) period
      --cpu-quota int                  Limit CPU CFS (Completely Fair Scheduler) quota
      --cpu-rt-period int              Limit CPU real-time period in microseconds
      --cpu-rt-runtime int             Limit CPU real-time runtime in microseconds
  -c, --cpu-shares int                 CPU shares (relative weight)
      --cpus decimal                   Number of CPUs
      --cpuset-cpus string             CPUs in which to allow execution (0-3, 0,1)
      --cpuset-mems string             MEMs in which to allow execution (0-3, 0,1)
[ec2-user@ip-172-31-91-220 ~]$ docker  run -itd --name ashuc10 --memory 200M --cpuset-cpus=0 --cpu-shares=200  alpine 
0aa94caacd0493d03e83cc7be9af2a41306c17f6bc40c0a60f372b95fa541f5d
[ec2-user@ip-172-31-91-220 ~]$ 

```

