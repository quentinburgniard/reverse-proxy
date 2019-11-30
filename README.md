# Digital Léman

## Introduction
A big project to administrate my websites, based on containerization. The idea is to give me flexibily and agility. The heart of the system is a nginx reverse proxy. It redirect http request to docker containers.

## Get started
- add the config file to docker daemon
- Copy hosts locate in reverse-proxy/dev/hosts

## Nginx Amplify
```
git clone https://github.com/nginxinc/docker-nginx-amplify.git
cd docker-nginx-amplify
docker build -t nginx-amplify .
```

## Configure the default logging driver

`sudo cp docker-daemon.yml /etc/docker/daemon.yml`

## Source


https://docs.nginx.com/nginx/admin-guide/security-controls/controlling-access-by-geoip/

https://docs.nginx.com/nginx/admin-guide/security-controls/configuring-http-basic-authentication/#complete-example

https://docs.nginx.com/nginx/admin-guide/security-controls/configuring-http-basic-authentication/#combining-basic-authentication-with-access-restriction-by-ip-address

https://github.com/nginxinc/docker-nginx-amplify/blob/master/README.md#2-how-to-build-and-run-an-amplify-enabled-nginx-image
