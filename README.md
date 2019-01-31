# quentinburgniard.com

## Introduction
A big project to administrate my websites, based on containerization. The idea is to give me flexibily and agility. The heart of the system is a nginx reverse proxy. It redirect http request to docker containers.

## Get started
Create a swarm with one node. It's only useful to use `docker secret`.

[Create a swarm - Docker Documentation](https://docs.docker.com/engine/swarm/swarm-tutorial/create-swarm/)

```
docker swarm init
```

## Only one node ?
High Availability is not so important for me : the websites are only personal projects. In case of service failure, the Nginx Amplify Agent notify me.

## Docker secrets
Docker secrets is the best way to store and share sensitive data between containers.

[Manage sensitive data with Docker secrets  - Docker Documentation](https://docs.docker.com/engine/swarm/secrets/)

```
*** | docker secret create mariadb-root-password -
*** | docker secret create mariadb-user -
*** | docker secret create mariadb-password -
```

## MariaDB Server

```
docker run -d -e MYSQL_ROOT_PASSWORD_FILE=mariadb-root-password -e MYSQL_USER_FILE=mariadb-user -e MYSQL_PASSWORD_FILE=mariadb-password -v /etc/mysql/my.cnf:/etc/mysql/my.cnf -v /var/lib/mysql:/var/lib/mysql --network quentinburgniard.com --name mariadb --restart always mariadb
```

## OpenVPN server
https://github.com/kylemanna/docker-openvpn

```
docker volume create --name openvpn
docker run -v openvpn:/etc/openvpn --log-driver=none --rm kylemanna/openvpn ovpn_genconfig -u udp://vpn.quentinburgniard.com
docker run -v openvpn:/etc/openvpn --log-driver=none --rm -it kylemanna/openvpn ovpn_initpki
docker run --name openvpn -v openvpn:/etc/openvpn -d -p 1194:1194/udp --cap-add=NET_ADMIN kylemanna/openvpn
docker run -v openvpn:/etc/openvpn --log-driver=none --rm -it kylemanna/openvpn easyrsa build-client-full tambour nopass
docker run -v openvpn:/etc/openvpn --log-driver=none --rm kylemanna/openvpn ovpn_getclient tambour > tambour.ovpn
```

## API with WordPress and [Advanced Custom Fields](https://www.advancedcustomfields.com/)
```
docker run --name api-wordpress -e WORDPRESS_DB_HOST=mariadb -e WORDPRESS_DB_USER_FILE=/run/secrets/mariadb-user -e WORDPRESS_DB_PASSWORD_FILE=/run/secrets/mariadb-password -e WORDPRESS_DB_NAME=api-wordpress -d wordpress
```