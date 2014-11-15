### docker-mumble

#### About

docker-mumble is a containerized murmur server to be run on docker.

#### Usage

To run with no server password an an automatically generated superuser pass:

```bash
$ MURMUR=$(docker run -p 65738:64738 -p 64738:64738/udp \
    -itd ateoto/mumble:1.2.8)
$ docker logs $MURMUR | grep \'SuperUser\'
```

The first line runs the murmur server and stores the container id as MURMUR. 
The second line greps the logs for the SuperUser pass.

To run the server with a password and your own superuser pass you can pass environment variables to the container.


```bash
$ docker run -p 65738:64738 -p 64738:64738/udp \
    -e MURMUR_SERVER_PASS=myserverpassword \
    -e MURMUR_SUPER_USER_PASS=notagoodpass \
    -itd ateoto/mumble:1.2.8
```