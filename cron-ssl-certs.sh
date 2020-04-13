#!/bin/sh
docker-compose -f reverse-proxy/docker-compose.yml up -d --force-recreate ssl-certs-prod && docker-compose -f reverse-proxy/docker-compose.yml up -d reverse-proxy