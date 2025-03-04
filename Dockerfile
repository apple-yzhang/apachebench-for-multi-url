FROM --platform=linux/amd64 redhat/ubi8:8.10

RUN mkdir /build && yum install -y gcc make apr-devel httpd-devel openssl-devel
COPY ab.c /build

RUN gcc -I/usr/include/apr-1 -I/usr/include/httpd -I/usr/include/openssl /build/ab.c -o /build/ab -L /usr/lib64/ -lm -lapr-1 -laprutil-1 -lssl -lcrypto -ldl
