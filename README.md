# devops-25ujne2022

### Linux target 

<img src="ln.png" />

### aws cloud target 

<img src="cl.png" />

## Docker steps scripting -- compose -- doing scripting for docker steps 

### COmpose file -- YAML / JSON 

## Demo 1 

```
[root@mobi-dockerserver mydata]# cat  docker-compose.yaml 
version: '3.8'
services:
  ashuapp1:
    image: alpine
    container_name: ashuc111
    command: ping fb.com
```

### to run file of compose 

```
[root@mobi-dockerserver mydata]# docker-compose up -d
[+] Running 1/1
 ⠿ Container ashuc111  Started                                                                                               0.6s
[root@mobi-dockerserver mydata]# docker-compose ps
NAME                COMMAND             SERVICE             STATUS              PORTS
ashuc111            "ping fb.com"       ashuapp1            running             
```

### Demo 2 

```
[root@mobi-dockerserver mydata]# cat docker-compose.yaml 
version: '3.8'
services:
  ashuapp2:
    image: busybox
    container_name: ashux4 
    command: sleep 1000
  ashuapp1:
    image: alpine
    container_name: ashuc111
    command: ping fb.com
```

### more commands to know 

```
docker-compose up -d  # to create everything which is written in file 

====
[root@mobi-dockerserver mydata]# docker-compose  ps
NAME                COMMAND             SERVICE             STATUS              PORTS
ashuc111            "ping fb.com"       ashuapp1            running             
ashux4              "sleep 1000"        ashuapp2            running             
[root@mobi-dockerserver mydata]# docker-compose  stop 
[+] Running 2/2
 ⠿ Container ashux4    Stopped                                                                                              10.2s
 ⠿ Container ashuc111  Stopped                                                                                              10.3s
[root@mobi-dockerserver mydata]# docker-compose  ps
NAME                COMMAND             SERVICE             STATUS              PORTS
ashuc111            "ping fb.com"       ashuapp1            exited (137)        
ashux4              "sleep 1000"        ashuapp2            exited (137)        
[root@mobi-dockerserver mydata]# docker-compose  start
[+] Running 2/2
 ⠿ Container ashuc111  Started                                                                                               0.7s
 ⠿ Container ashux4    Started                                                                                               0.7s
[root@mobi-dockerserver mydata]# docker-compose  ps
NAME                COMMAND             SERVICE             STATUS              PORTS
ashuc111            "ping fb.com"       ashuapp1            running             
ashux4              "sleep 1000"        ashuapp2            running             
[root@mobi-dockerserver mydata]# docker-compose  down 
[+] Running 3/3
 ⠿ Container ashux4        Removed                                                                                          10.3s
 ⠿ Container ashuc111      Removed                                                                                          10.3s
 ⠿ Network mydata_default  Removed                   
```

### more commands 

```
[root@mobi-dockerserver mydata]# docker-compose  stop ashuapp1
[+] Running 1/1
 ⠿ Container ashuc111  Stopped                                                                                              10.2s
[root@mobi-dockerserver mydata]# docker-compose  ps
NAME                COMMAND             SERVICE             STATUS              PORTS
ashuc111            "ping fb.com"       ashuapp1            exited (137)        
ashux4              "sleep 1000"        ashuapp2            running             
[root@mobi-dockerserver mydata]# 

```

### Demo 3 -- dockerfile with compose 

```
[root@mobi-dockerserver mydata]# cat docker-compose.yaml 
version: '3.8'
services:
  ashuapp3:
    image: ashuimg:v1 
    build: . # calling dockerfile in current location
    container_name: ashuxc3
  ashuapp2:
    image: busybox
    container_name: ashux4 
    command: sleep 1000
  ashuapp1:
    image: alpine
    container_name: ashuc111
    command: ping fb.com
```

### lets run it 

```
[root@mobi-dockerserver mydata]# docker-compose up -d
[+] Running 0/0
 ⠿ ashuapp3 Error                                                                                                            0.1s
[+] Building 0.1s (5/5) FINISHED                                                                                                  
 => [internal] load build definition from Dockerfile                                                                         0.0s
 => => transferring dockerfile: 92B                                                                                          0.0s
 => [internal] load .dockerignore                                                                                            0.0s
 => => transferring context: 2B                                                                                              0.0s
 => [internal] load metadata for docker.io/library/alpine:latest                                                             0.0s
 => CACHED [1/1] FROM docker.io/library/alpine                                                                               0.0s
 => exporting to image                                                                                                       0.0s
 => => exporting layers                                                                                                      0.0s
 => => writing image sha256:c25543a59e758b642c5ba9110306569e56d7c6e075817de2b2c3b3dc7d28119d                                 0.0s
 => => naming to docker.io/library/ashuimg:v1                                                                                0.0s
[+] Running 4/4
 ⠿ Network mydata_default  Created                                                                                           0.0s
 ⠿ Container ashuxc3       Started                                                                                           1.0s
 ⠿ Container ashux4        Started                                                                                           0.8s
 ⠿ Container ashuc111      Started                                                                                           1.1s
[root@mobi-dockerserver mydata]# docker-compose ps
NAME                COMMAND             SERVICE             STATUS              PORTS
ashuc111            "ping fb.com"       ashuapp1            running             
ashux4              "sleep 1000"        ashuapp2            running             
ashuxc3             "ping fb.com"       ashuapp3            running             
[root@mobi-dockerserver mydata]# docker-compose images
Container           Repository          Tag                 Image Id            Size
ashuc111            alpine              latest              9c6f07244728        5.54MB
ashux4              busybox             latest              2bd29714875d        1.24MB
ashuxc3             ashuimg             v1                  c25543a59e75        5.54MB
```

