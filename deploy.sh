#!/bin/bash	
# https://docs.travis-ci.com/user/deployment/custom/#git
ls .
eval "$(ssh-agent -s)"
chmod 600 id_rsa
ssh-add id_rsa
ssh -t $USER@digital-leman.com "git pull ${DIRECTORY} && docker-compose --project-directory ${DIRECTORY} up -d reverse-proxy"