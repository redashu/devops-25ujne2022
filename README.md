# devops-25ujne2022

### user management 

### deleting user 

```
ubuntu@devops-test:~$ grep -i u1  /etc/passwd
u1:x:1006:1006:,,,:/home/u1:/bin/bash
ubuntu@devops-test:~$ 
ubuntu@devops-test:~$ sudo userdel  -r u1 
userdel: u1 mail spool (/var/mail/u1) not found
ubuntu@devops-test:~$ 

```

### password of users in linux are stored in 

```
ubuntu@devops-test:~$ vim /etc/shadow
ubuntu@devops-test:~$ sudo vim /etc/shadow
ubuntu@devops-test:~$ sudo grep bhupesh  /etc/shadow
bhupesh:$6$/P8T1/Rxqr7YmU8t$TuneD66.V.6/n6GYuJYcVQWsj5bmfRIfbRN0cRXcDQV2Ps9ENFUc5B9dRVBCM8lX7nqWed1UfTw4B.FUtCk2c1:19177:0:99999:7:::
ubuntu@devops-test:~$ 

```

