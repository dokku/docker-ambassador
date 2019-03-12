# docker-ambassador

[![dokku/ambassador](http://dockeri.co/image/dokku/ambassador)](https://registry.hub.docker.com/u/dokku/ambassador/)

A maintained version of the [ambassador linking](https://github.com/SvenDowideit/dockerfiles/tree/master/ambassador) pattern.

This ambassador image can be used to automatically proxy all exposed ports from the linked container, or to proxy a specified port at a specific IP address or hostname.

## Use Docker linking to autoattach to all exposed ports

```shell
# start a container that exposes a port
docker run --rm --name nginx.1 nginx

# run the ambassador 
docker run --rm -ti --link nginx.1 -p 9999:80 -p 8888:443 ambassador
```

Running the ambassador container will result in output lke the following.

```
Connecting to 172.17.0.4:80 172.17.0.4:443...
2016/01/12 13:03:14 socat[19] E connect(5, AF=2 172.17.0.4:443, 16): Connection refused
```

You can also proxy exposed ports from more than one container by using more than one --link, but only if there is no duplication of exposed container ports.

## Specify host and port

This will allow you Dynamically map a container port after its been created.

For example:

```shell
# start a container that exposes a port
docker run --rm --name nginx.1 nginx
```

In the above example, nginx is running, but no-one can make requests to it. By running:

```shell
# Assuming the nginx.1 container is on IP `172.17.0.4`
docker run --rm -p 9999:80 ambassador 172.17.0.4 80
```

You will now be able to make requests to the web server on `http://localhost:9999`

## Credit

Thanks to Sven Dowideit for providing the initial implementation.
