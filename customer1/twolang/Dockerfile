FROM oraclelinux:8.4
RUN yum install python3 java-1.8.0-openjdk.x86_64  java-1.8.0-openjdk-devel.x86_64 -y && mkdir -p /code/{python,java}
COPY hello.py /code/python/
ADD abc.java  /code/java/ 
WORKDIR /code
COPY lang.sh /code/
RUN chmod +x lang.sh
ENTRYPOINT ["./lang.sh"]
