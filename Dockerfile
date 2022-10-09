FROM oraclelinux:8.4
LABEL name=ashutoshh
LABEL email=ashutoshh@linux.com
ENV deploy=webapp
RUN yum install httpd -y && mkdir -p /myapp/{app1,app2}
COPY app1  /myapp/app1/
COPY app2  /myapp/app2/
COPY httpd.sh /myapp/
WORKDIR /myapp
#  changing directory like cd command 
RUN chmod +x  httpd.sh 
ENTRYPOINT ["./httpd.sh"]
