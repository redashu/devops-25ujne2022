### To test permissions 

### create directory with root user 

```
root@babykool:~# mkdir  /project 
root@babykool:~# 
root@babykool:~# ls  -ld  /project/
drwxr-xr-x 2 root root 4096 Jul 31 12:13 /project/
root@babykool:~# 

```

### for testing -- non root user 

```
baby@babykool:~$ whoami
baby
baby@babykool:~$ cd  /project/
baby@babykool:/project$ ls
baby@babykool:/project$ mkdir bb
mkdir: cannot create directory ‘bb’: Permission denied

```

### removing permissions for others 

```
root@babykool:/project# chmod  o-x   /project/
root@babykool:/project# 
root@babykool:/project# ls -ld  /project/
drwxr-xr-- 5 root root 4096 Jul 31 12:21 /project/
root@babykool:/project# 


```

### testing with others 

```
baby@babykool:~$ cd /project/ 
bash: cd: /project/: Permission denied
baby@babykool:~$ 



```

### Now testing group permission 

```
root@babykool:/project# chmod  g-rx    /project/
root@babykool:/project# 
root@babykool:/project# ls -ld  /project/
drwx---rwx 5 root root 4096 Jul 31 12:28 /project/
root@babykool:/project# 



```

### adding an existing user to some group 

```
root@babykool:/project# groupadd   manager
root@babykool:/project# 
root@babykool:/project# ls -ld /project/
drwx---rwx 5 root root 4096 Jul 31 12:28 /project/
root@babykool:/project# 
root@babykool:/project# chgrp  manager  /project/
root@babykool:/project# 
root@babykool:/project# ls -ld /project/
drwx---rwx 5 root manager 4096 Jul 31 12:28 /project/
root@babykool:/project# 
root@babykool:/project# 
root@babykool:/project# ls /home
baby  bhanu  Jack  jill  mrinal  training
root@babykool:/project# 
root@babykool:/project# 
root@babykool:/project# usermod  -a -G manager  mrinal 
root@babykool:/project# grep -i manager /etc/group 
manager:x:1008:mrinal
root@babykool:/project# 

```

### final command to test 

```
oot@babykool:/project# ls -ld /project/
d--------- 6 root manager 4096 Jul 31 12:32 /project/
root@babykool:/project# chmod  u+rwx,g+rx,o+rx  /project/ 
root@babykool:/project# 
root@babykool:/project# ls -ld /project/
drwxr-xr-x 6 root manager 4096 Jul 31 12:32 /project/
root@babykool:/project# 

```

### --
```
root@babykool:/project# chmod  a-rwx  /project/ 
root@babykool:/project# 
root@babykool:/project# ls -ld /project/
d--------- 6 root manager 4096 Jul 31 12:32 /project/
root@babykool:/project# 
root@babykool:/project# 
root@babykool:/project# chmod  a+rx  /project/ 
root@babykool:/project# 
root@babykool:/project# ls -ld /project/
dr-xr-xr-x 6 root manager 4096 Jul 31 12:32 /project/
root@babykool:/project# 


```

