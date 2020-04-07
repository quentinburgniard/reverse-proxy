#!/bin/bash	
# https://docs.travis-ci.com/user/deployment/custom/#git
eval "$(ssh-agent -s)"
chmod 600 .travis/id_rsa
ssh-add .travis/id_rsa
ssh -t ${USER}@digital-leman.com "cd $DIRECTORY && git pull && docker-compose up -d reverse-proxy"