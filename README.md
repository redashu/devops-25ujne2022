## OS filesystem 

###  Linux

## terminal 

### changing directory and pwd 

```
cd  /
baby@babykool:/$ pwd
/

```

### to view content of pwd

```
 ls
bin    dev   lib    libx32      mnt   root  snap      sys      tmp
boot   etc   lib32  lost+found  opt   run   srv       test1    usr
cdrom  home  lib64  media       proc  sbin  swapfile  testing  var
baby@babykool:/$ 

```

### changing current users desktop 
```
whoami
baby
baby@babykool:~$ cd /home/baby
baby@babykool:~$ pwd
/home/baby
baby@babykool:~$ ls
'a b c.txt'   get-docker.sh   Pictures    test111
 Desktop      images          Public      typescript
 Documents    Music           snap       'Untitled Document 1'
 Downloads    myhistory.txt   Templates   Videos
baby@babykool:~$ cd Desktop
baby@babykool:~/Desktop$ pwd
/home/baby/Desktop

```

### creating a directory 

```
 cd Desktop
baby@babykool:~/Desktop$ pwd
/home/baby/Desktop
baby@babykool:~/Desktop$ mkdir hello
baby@babykool:~/Desktop$ ls
hello  invites  linux_os.jpg  myhistory.txt  try
baby@babykool:~/Desktop$ 


```

## remove folder 

```
 ls
hello  invites  linux_os.jpg  myhistory.txt  try
baby@babykool:~/Desktop$ rmdir hello
baby@babykool:~/Desktop$ ls
invites  linux_os.jpg  myhistory.txt  try
baby@babykool:~/Desktop$ 

```
### rmdir / mkdir test

```
aby@babykool:~$ pwd
/home/baby
baby@babykool:~$ cd  /tmp
baby@babykool:/tmp$ mkdir  ashu
baby@babykool:/tmp$ ls
anydesk
ashu

```
### 

```
baby@babykool:/tmp$ pwd
/tmp
baby@babykool:/tmp$ cd  ashu
baby@babykool:/tmp/ashu$ pwd
/tmp/ashu
baby@babykool:/tmp/ashu$ cd ..
baby@babykool:/tmp$ pwd
/tmp
baby@babykool:/tmp$ rmdir  ashu
baby@babykool:
```




