#!/bin/bash
docker restart ssl-certs-prod
docker exec reverse-proxy nginx -s reload