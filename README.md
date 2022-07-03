# io REDIRECTION 

### stdout 

```
baby@babykool:~$ cal 
     July 2022        
Su Mo Tu We Th Fr Sa  
                1  2  
 3  4  5  6  7  8  9  
10 11 12 13 14 15 16  
17 18 19 20 21 22 23  
24 25 26 27 28 29 30  
31                    
baby@babykool:~$ echo $?
0
baby@babykool:~$ cal  >output.txt 
baby@babykool:~$ ls
'a b c.txt'   Downloads       Music        Public      test111
 Desktop      get-docker.sh   output.txt   snap       'Untitled Document 1'
 Documents    images          Pictures     Templates   Videos
baby@babykool:~$ cat output.txt 
     July 2022        
Su Mo Tu We Th Fr Sa  
                1  2  
 3  4  5  6  7  8  9  
10 11 12 13 14 15 16  
17 18 19 20 21 22 23  
24
25 26 27 28 29 30  
31                    

```
### checking overwrite 
```
baby@babykool:~$ whoami >output.txt 
baby@babykool:~$ cat output.txt 
baby

```

### append output 
  
  ```
  uptime  >>output.txt 
baby@babykool:~$ cat output.txt 
baby
 10:49:26 up 17 min,  1 user,  load average: 0.30, 0.32, 0.20
baby@babykool:~$ pwd
/home/baby
baby@babykool:~$ pwd   >>output.txt 
baby@babykool:~$ cat output.txt 
baby
 10:49:26 up 17 min,  1 user,  load average: 0.30, 0.32, 0.20
/home/baby

  ```

### STDERR 

## overwrite 

```
kkkk  >output.txt 
kkkk: command not found
baby@babykool:~$ cat output.txt 
baby@babykool:~$ kkkk  2>output.txt 
baby@babykool:~$ cat output.txt 
kkkk: command not found
baby@babykool:~$ 

```

### STDERR append 

```
jjjjjjjjj  2>>output.txt 
baby@babykool:~$ cat output.txt 
kkkk: command not found
jjjjjjjjj: command not found

```

### BOTH STDERR & STDOUT

```
kkkk &>output.txt 
baby@babykool:~$ 
baby@babykool:~$ cal &>output.txt 
baby@babykool:~$ 
baby@babykool:~$ cal &>>output.txt 
baby@babykool:~$ kkk   &>>output.txt
baby@babykool:~$ 
baby@babykool:~$ cat output.txt 
     July 2022        
Su Mo Tu We Th Fr Sa  
                1  2  
 3  4  5  6  7  8  9  
10 11 12 13 14 15 16  
17 18 19 20 21 22 23  
24 25 26 27 28 29 30  
31                    
     July 2022        
Su Mo Tu We Th Fr Sa  
                1  2  
 3  4  5  6  7  8  9  
10 11 12 13 14 15 16  

```

