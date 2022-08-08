# devops-25ujne2022

### Linux target 

<img src="ln.png" />

### aws cloud target 

<img src="cl.png" />

## storage in linux 

### to check list of block storage devices

```
[root@node2 ~]# lsblk 
NAME    MAJ:MIN RM  SIZE RO TYPE MOUNTPOINT
xvda    202:0    0  100G  0 disk 
`-xvda1 202:1    0  100G  0 part /
[root@node2 ~]# 


```

### OR 

```
[root@node2 ~]# fdisk -l 
Disk /dev/xvda: 100 GiB, 107374182400 bytes, 209715200 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disklabel type: gpt
Disk identifier: E620869C-E891-4722-8B5F-759EEBAE8607

Device       Start       End   Sectors  Size Type
/dev/xvda1    4096 209715166 209711071  100G Linux filesystem
/dev/xvda128  2048      4095      2048    1M BIOS boot

Partition table entries are not in disk order.
[root@node2 ~]# 

```


### Now create volume in your same avzone where your vm is running and attach it to the same vm

### recheck 

```
[root@node2 ~]# lsblk 
NAME    MAJ:MIN RM  SIZE RO TYPE MOUNTPOINT
xvda    202:0    0  100G  0 disk 
`-xvda1 202:1    0  100G  0 part /
xvdf    202:80   0    5G  0 disk 
[root@node2 ~]# 


```

### Now creating partition using GPT table 

### step 1:  creating partition --- 

```
[root@node2 ~]# gdisk /dev/xvdf  
GPT fdisk (gdisk) version 0.8.10

Partition table scan:
  MBR: not present
  BSD: not present
  APM: not present
  GPT: not present

Creating new GPT entries.

Command (? for help): p
Disk /dev/xvdf: 10485760 sectors, 5.0 GiB
Logical sector size: 512 bytes
Disk identifier (GUID): 24434F01-45B0-42A6-AC43-2DE83707AD6C
Partition table holds up to 128 entries
First usable sector is 34, last usable sector is 10485726
Partitions will be aligned on 2048-sector boundaries
Total free space is 10485693 sectors (5.0 GiB)

Number  Start (sector)    End (sector)  Size       Code  Name

Command (? for help): n
Partition number (1-128, default 1): 
First sector (34-10485726, default = 2048) or {+-}size{KMGTP}: 
Last sector (2048-10485726, default = 10485726) or {+-}size{KMGTP}: +2G
Current type is 'Linux filesystem'
Hex code or GUID (L to show codes, Enter = 8300): 
Changed type of partition to 'Linux filesystem'

Command (? for help): p
Disk /dev/xvdf: 10485760 sectors, 5.0 GiB
Logical sector size: 512 bytes
Disk identifier (GUID): 24434F01-45B0-42A6-AC43-2DE83707AD6C
Partition table holds up to 128 entries
First usable sector is 34, last usable sector is 10485726
Partitions will be aligned on 2048-sector boundaries
Total free space is 6291389 sectors (3.0 GiB)

Number  Start (sector)    End (sector)  Size       Code  Name
   1            2048         4196351   2.0 GiB     8300  Linux filesystem

Command (? for help): 

```

### to save partition 

```
Total free space is 6291389 sectors (3.0 GiB)

Number  Start (sector)    End (sector)  Size       Code  Name
   1            2048         4196351   2.0 GiB     8300  Linux filesystem

Command (? for help): wq

Final checks complete. About to write GPT data. THIS WILL OVERWRITE EXISTING
PARTITIONS!!

Do you want to proceed? (Y/N): y
OK; writing new GUID partition table (GPT) to /dev/xvdf.
The operation has completed successfully.
[root@node2 ~]# 
[root@node2 ~]# 

```

### step 2  -- make filesystem of partition 

```
[root@node2 ~]# mkfs.
mkfs.cramfs  mkfs.ext2    mkfs.ext3    mkfs.ext4    mkfs.fat     mkfs.minix   mkfs.msdos   mkfs.vfat    mkfs.xfs     
[root@node2 ~]# mkfs.xfs   /dev/xvdf1 
meta-data=/dev/xvdf1             isize=512    agcount=4, agsize=131072 blks
         =                       sectsz=512   attr=2, projid32bit=1
         =                       crc=1        finobt=1, sparse=0
data     =                       bsize=4096   blocks=524288, imaxpct=25
         =                       sunit=0      swidth=0 blks
naming   =version 2              bsize=4096   ascii-ci=0 ftype=1
log      =internal log           bsize=4096   blocks=2560, version=2
         =                       sectsz=512   sunit=0 blks, lazy-count=1
realtime =none                   extsz=4096   blocks=0, rtextents=0
[root@node2 ~]#  


```

### step 3 Mount the formatted partition 

```
[root@node2 ~]# ls  /
bin  boot  dev  etc  home  lib  lib64  local  media  mnt  opt  proc  root  run  sbin  srv  sys  tmp  usr  var
[root@node2 ~]# 
[root@node2 ~]# cd /mnt/
[root@node2 mnt]# ls
[root@node2 mnt]# mkdir  videos 
[root@node2 mnt]# 
[root@node2 mnt]# 
[root@node2 mnt]# mount  /dev/xvdf1  /mnt/videos
[root@node2 mnt]# 

```


### done -- now we can check it 

```
[root@node2 mnt]# lsblk 
NAME    MAJ:MIN RM  SIZE RO TYPE MOUNTPOINT
xvda    202:0    0  100G  0 disk 
`-xvda1 202:1    0  100G  0 part /
xvdf    202:80   0    5G  0 disk 
|-xvdf1 202:81   0    2G  0 part /mnt/videos
`-xvdf2 202:82   0    1G  0 part 
[root@node2 mnt]# 


```

### method 2 -- 

```
[root@node2 mnt]# df  
Filesystem     1K-blocks    Used Available Use% Mounted on
devtmpfs         4059684       0   4059684   0% /dev
tmpfs            4068688       0   4068688   0% /dev/shm
tmpfs            4068688     564   4068124   1% /run
tmpfs            4068688       0   4068688   0% /sys/fs/cgroup
/dev/xvda1     104845292 6444492  98400800   7% /
tmpfs             813740       0    813740   0% /run/user/1000
/dev/xvdf1       2086912   35092   2051820   2% /mnt/videos
[root@node2 mnt]# df  -h
Filesystem      Size  Used Avail Use% Mounted on
devtmpfs        3.9G     0  3.9G   0% /dev
tmpfs           3.9G     0  3.9G   0% /dev/shm
tmpfs           3.9G  564K  3.9G   1% /run
tmpfs           3.9G     0  3.9G   0% /sys/fs/cgroup
/dev/xvda1      100G  6.2G   94G   7% /
tmpfs           795M     0  795M   0% /run/user/1000
/dev/xvdf1      2.0G   35M  2.0G   2% /mnt/videos
[root@node2 mnt]# df  -hT
Filesystem     Type      Size  Used Avail Use% Mounted on
devtmpfs       devtmpfs  3.9G     0  3.9G   0% /dev
tmpfs          tmpfs     3.9G     0  3.9G   0% /dev/shm
tmpfs          tmpfs     3.9G  564K  3.9G   1% /run
tmpfs          tmpfs     3.9G     0  3.9G   0% /sys/fs/cgroup
/dev/xvda1     xfs       100G  6.2G   94G   7% /
tmpfs          tmpfs     795M     0  795M   0% /run/user/1000
/dev/xvdf1     xfs       2.0G   35M  2.0G   2% /mnt/videos
[root@node2 mnt]# 

```

### lets write some data 

```
[root@node2 mnt]# cd /mnt/videos/
[root@node2 videos]# ls
[root@node2 videos]# mkdir  hello{1..10}
[root@node2 videos]# ls
hello1  hello10  hello2  hello3  hello4  hello5  hello6  hello7  hello8  hello9
[root@node2 videos]# touch abc{1..20}.txt 
[root@node2 videos]# ls
abc1.txt   abc12.txt  abc15.txt  abc18.txt  abc20.txt  abc5.txt  abc8.txt  hello10  hello4  hello7
abc10.txt  abc13.txt  abc16.txt  abc19.txt  abc3.txt   abc6.txt  abc9.txt  hello2   hello5  hello8
abc11.txt  abc14.txt  abc17.txt  abc2.txt   abc4.txt   abc7.txt  hello1    hello3   hello6  hello9
[root@node2 videos]# 

```

