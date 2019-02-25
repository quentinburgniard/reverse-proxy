# quentinburgniard.com

## Introduction
A big project to administrate my websites, based on containerization. The idea is to give me flexibily and agility. The heart of the system is a nginx reverse proxy. It redirect http request to docker containers.

## Get started
Create a network, the default bridge network is limited https://docs.docker.com/network/bridge/#manage-a-user-defined-bridge

```
docker network create quentinburgniard.com
```

## Nginx Reverse Proxy

# The location of nginx.conf depends on the package system used to install NGINX and the operating system. It is typically one of /usr/local/nginx/conf, /etc/nginx, or /usr/local/etc/nginx.

```
git clone https://github.com/quentinburgniard/nginx-reverse-proxy.git /etc/nginx/
```

https://docs.nginx.com/nginx/admin-guide/security-controls/controlling-access-by-geoip/

https://docs.nginx.com/nginx/admin-guide/security-controls/configuring-http-basic-authentication/#complete-example

https://docs.nginx.com/nginx/admin-guide/security-controls/configuring-http-basic-authentication/#combining-basic-authentication-with-access-restriction-by-ip-address

https://github.com/nginxinc/docker-nginx-amplify/blob/master/README.md#2-how-to-build-and-run-an-amplify-enabled-nginx-image

```
git clone https://github.com/nginxinc/docker-nginx-amplify.git
cd docker-nginx-amplify
docker build -t nginx-amplify .
```

### The location of nginx.conf depends on the package system used to install NGINX and the operating system. It is typically one of /usr/local/nginx/conf, /etc/nginx, or /usr/local/etc/nginx.

```
docker run -d \
--network quentinburgniard.com \
-p 80:80 \
-p 443:443 \
--restart always \
-v /etc/nginx/nginx.conf:/etc/nginx/nginx.conf:ro \
-v /etc/letsencrypt:/etc/letsencrypt:ro \
-e "API_KEY=***" \
-e "AMPLIFY_IMAGENAME=quentinburgniard.com" \
--name nginx-amplify \
nginx-amplify
```

## MariaDB Server

# mariadb-conf
https://spin.atomicobject.com/2010/08/23/on-the-importance-of-character-sets-and-character-encodings-in-mysql/
git clone https://github.com/quentinburgniard/mariadb-conf.git /etc/mysql/my.cnf

```
docker run -d \
--network quentinburgniard.com \
--restart always \
-v /etc/mysql/my.cnf:/etc/mysql/my.cnf \
-v /var/lib/mysql:/var/lib/mysql \
-e "MYSQL_ROOT_PASSWORD=***" \
-e "MYSQL_USER=***" \
-e "MYSQL_PASSWORD=***" \
--name mariadb \
mariadb
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
docker run -d \
--network quentinburgniard.com \
--restart always \
-v ${HOME}/quentinburgniard.com/api-wordpress:/var/www/html \
-u www-data:www-data \
-e "WORDPRESS_DB_HOST=mariadb" \
-e "WORDPRESS_DB_NAME=api-wordpress" \
-e "WORDPRESS_DB_USER=***" \
-e "WORDPRESS_DB_PASSWORD=***" \
-e "WORDPRESS_CONFIG_EXTRA=define( 'WP_POST_REVISIONS', 5 ); define( 'WP_AUTO_UPDATE_CORE', true );" \
--name api-wordpress \
wordpress
```


Optionnal : use phpMyAdmin
```
docker run -d \
--network quentinburgniard.com \
--restart always \
-e "PMA_HOST=mariadb" \
-e "PMA_USER=root" \
-e "PMA_PASSWORD=***" \
-e "PMA_ABSOLUTE_URI=https://sql.quentinburgniard.com" \
--name phpmyadmin \
phpmyadmin/phpmyadmin
```


## Certificates