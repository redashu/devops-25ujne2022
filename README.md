# devops-25ujne2022

### Linux target 

<img src="ln.png" />

### aws cloud target 

<img src="cl.png" />

## Note: once you restart your system / vm partition will be unmounted 

### lets check it 

```
[root@node2 ~]# df -hT
Filesystem     Type      Size  Used Avail Use% Mounted on
devtmpfs       devtmpfs  3.9G     0  3.9G   0% /dev
tmpfs          tmpfs     3.9G     0  3.9G   0% /dev/shm
tmpfs          tmpfs     3.9G  564K  3.9G   1% /run
tmpfs          tmpfs     3.9G     0  3.9G   0% /sys/fs/cgroup
/dev/xvda1     xfs       100G  6.2G   94G   7% /
tmpfs          tmpfs     795M     0  795M   0% /run/user/1000

===
[root@node2 ~]# ls /mnt/videos/

===
[root@node2 ~]# mount  /dev/xvdf1 /mnt/videos/

====
[root@node2 ~]# ls /mnt/videos/
abc1.txt   abc12.txt  abc15.txt  abc18.txt  abc20.txt  abc5.txt  abc8.txt  hello10  hello4  hello7  hii1  hii4
abc10.txt  abc13.txt  abc16.txt  abc19.txt  abc3.txt   abc6.txt  abc9.txt  hello2   hello5  hello8  hii2
abc11.txt  abc14.txt  abc17.txt  abc2.txt   abc4.txt   abc7.txt  hello1    hello3   hello6  hello9  hii3
[root@node2 ~]# 


```

### to do permanent mounting --

```
[root@node2 ~]# cat /etc/fstab 
#
UUID=111667cd-96f8-41ba-bb2d-7c558ae6ad71     /           xfs    defaults,noatime  1   1
/dev/xvdf1 /mnt/videos/   xfs   defaults  0   0 

```

### Note: you must check mounting in FS 

```
[root@node2 ~]# umount  /mnt/videos/
[root@node2 ~]# df -hT
Filesystem     Type      Size  Used Avail Use% Mounted on
devtmpfs       devtmpfs  3.9G     0  3.9G   0% /dev
tmpfs          tmpfs     3.9G     0  3.9G   0% /dev/shm
tmpfs          tmpfs     3.9G  568K  3.9G   1% /run
tmpfs          tmpfs     3.9G     0  3.9G   0% /sys/fs/cgroup
/dev/xvda1     xfs       100G  6.2G   94G   7% /
tmpfs          tmpfs     795M     0  795M   0% /run/user/1000
[root@node2 ~]# 
[root@node2 ~]# 
[root@node2 ~]# mount -a 
[root@node2 ~]# df -hT
Filesystem     Type      Size  Used Avail Use% Mounted on
devtmpfs       devtmpfs  3.9G     0  3.9G   0% /dev
tmpfs          tmpfs     3.9G     0  3.9G   0% /dev/shm
tmpfs          tmpfs     3.9G  568K  3.9G   1% /run
tmpfs          tmpfs     3.9G     0  3.9G   0% /sys/fs/cgroup
/dev/xvda1     xfs       100G  6.2G   94G   7% /
tmpfs          tmpfs     795M     0  795M   0% /run/user/1000
/dev/xvdf1     xfs       2.0G   35M  2.0G   2% /mnt/videos
[root@node2 ~]# 

```

### Now formating partition using ext4. 

```
[root@node2 ~]# mkfs.
mkfs.cramfs  mkfs.ext2    mkfs.ext3    mkfs.ext4    mkfs.fat     mkfs.minix   mkfs.msdos   mkfs.vfat    mkfs.xfs     
[root@node2 ~]# mkfs.ext4   /dev/xvdf1  
mke2fs 1.42.9 (28-Dec-2013)
/dev/xvdf1 is mounted; will not make a filesystem here!
[root@node2 ~]# 
[root@node2 ~]# mkfs.ext4   /dev/xvdf2
mke2fs 1.42.9 (28-Dec-2013)
Filesystem label=
OS type: Linux
Block size=4096 (log=2)
Fragment size=4096 (log=2)
Stride=0 blocks, Stripe width=0 blocks
65536 inodes, 262144 blocks
13107 blocks (5.00%) reserved for the super user
First data block=0
Maximum filesystem blocks=268435456
8 block groups
32768 blocks per group, 32768 fragments per group
8192 inodes per group
Superblock backups stored on blocks: 
	32768, 98304, 163840, 229376

Allocating group tables: done                            
Writing inode tables: done                            
Creating journal (8192 blocks): done
Writing superblocks and filesystem accounting information: done

[root@node2 ~]# mkdir  /mnt/data
[root@node2 ~]# mount  /dev/xvdf2  /mnt/data/
[root@node2 ~]# df -hT
Filesystem     Type      Size  Used Avail Use% Mounted on
devtmpfs       devtmpfs  3.9G     0  3.9G   0% /dev
tmpfs          tmpfs     3.9G     0  3.9G   0% /dev/shm
tmpfs          tmpfs     3.9G  568K  3.9G   1% /run
tmpfs          tmpfs     3.9G     0  3.9G   0% /sys/fs/cgroup
/dev/xvda1     xfs       100G  6.2G   94G   7% /
tmpfs          tmpfs     795M     0  795M   0% /run/user/1000
/dev/xvdf1     xfs       2.0G   35M  2.0G   2% /mnt/videos
/dev/xvdf2     ext4      974M   24K  907M   1% /mnt/data
```

### cross checking fstab 

```
[root@node2 ~]# cat /etc/fstab 
#
UUID=111667cd-96f8-41ba-bb2d-7c558ae6ad71     /           xfs    defaults,noatime  1   1
/dev/xvdf1 /mnt/videos/   xfs   defaults  0   0 
/dev/xvdf2  /mnt/data/  ext4  defaults 0 0 
[root@node2 ~]# 

```

### 

```
[root@node2 ~]# df -hT 
Filesystem     Type      Size  Used Avail Use% Mounted on
devtmpfs       devtmpfs  3.9G     0  3.9G   0% /dev
tmpfs          tmpfs     3.9G     0  3.9G   0% /dev/shm
tmpfs          tmpfs     3.9G  568K  3.9G   1% /run
tmpfs          tmpfs     3.9G     0  3.9G   0% /sys/fs/cgroup
/dev/xvda1     xfs       100G  6.2G   94G   7% /
tmpfs          tmpfs     795M     0  795M   0% /run/user/1000
/dev/xvdf1     xfs       2.0G   35M  2.0G   2% /mnt/videos
[root@node2 ~]# mount   /mnt/data/
[root@node2 ~]# df -hT 
Filesystem     Type      Size  Used Avail Use% Mounted on
devtmpfs       devtmpfs  3.9G     0  3.9G   0% /dev
tmpfs          tmpfs     3.9G     0  3.9G   0% /dev/shm
tmpfs          tmpfs     3.9G  568K  3.9G   1% /run
tmpfs          tmpfs     3.9G     0  3.9G   0% /sys/fs/cgroup
/dev/xvda1     xfs       100G  6.2G   94G   7% /
tmpfs          tmpfs     795M     0  795M   0% /run/user/1000
/dev/xvdf1     xfs       2.0G   35M  2.0G   2% /mnt/videos
/dev/xvdf2     ext4      974M   24K  907M   1% /mnt/data
[root@node2 ~]# 

```

### Blog link 

[click_here](http://troubleshoot4opensource.blogspot.com/)


