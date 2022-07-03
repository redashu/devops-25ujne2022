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

### OUTPUT redirection without file 

### demo 1

```
baby@babykool:~$ cal >output.txt 
baby@babykool:~$ wc  -l  output.txt 
8 output.txt
baby@babykool:~$ wc  -w  output.txt 
41 output.txt
baby@babykool:~$ wc  -c  output.txt 
188 output.txt
baby@babykool:~$ 
```

### matching pattern IN rows 

```
baby@babykool:~$ cat output.txt 
     July 2022        
Su Mo Tu We Th Fr Sa  
                1  2  
 3  4  5  6  7  8  9  
10 11 12 13 14 15 16  
17 18 19 20 21 22 23  
24 25 26 27 28 29 30  
31                    
baby@babykool:~$ grep 3 output.txt 
 3  4  5  6  7  8  9  
10 11 12 13 14 15 16  
17 18 19 20 21 22 23  
24 25 26 27 28 29 30  
31                   
```

### grep for word match 

```
grep -w  2  output.txt 
                1  2  
```

### demo2

```
cat /tmp/hello.txt 
hii hello 
sdffkdsf ;ls

dfds Hello skdjfdsf

sdfjds HELLO 
sdfjds HELLO 
dskfsdf
sdfjds HELLO 
ksdjflkdsjfds helloksdjfldsjfdsf ksdjlf
baby@babykool:~$ grep  hello  /tmp/hello.txt 
hii hello 
ksdjflkdsjfds helloksdjfldsjfdsf ksdjlf
baby@babykool:~$ grep -w  hello  /tmp/hello.txt 
hii hello 

```



