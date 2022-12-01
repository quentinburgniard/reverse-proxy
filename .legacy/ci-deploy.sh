#!/bin/bash
# https://docs.travis-ci.com/user/deployment/custom/#git
eval "$(ssh-agent -s)"
chmod 600 id_rsa
ssh-add id_rsa
ssh -t "${USER}@digitalleman.com" "cd $DIRECTORY && git pull && docker-compose up -d reverse-proxy && docker exec reverse-proxy nginx -s reload"