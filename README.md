# Sharing data between vm in aws using rsync 

```
86  rsync -avp  /var/www/   root@172.31.20.202:/var/www/
   87  cd /etc/httpd/conf.d/
   88  ls
   89  rsync -avp  /etc/httpd/conf.d/   root@172.31.20.202:/etc/httpd/conf.d/
```

### load balancer 

<img src="lb.png">

