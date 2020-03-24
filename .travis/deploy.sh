#!/bin/bash	
# https://docs.travis-ci.com/user/deployment/custom/#git	
eval "$(ssh-agent -s)"
chmod 600 .travis/deploy
ssh-add .travis/deploy
ls .travis/
#ssh -t $USER@$REGISTRY "git pull ${DIRECTORY} && docker-compose --project-directory ${DIRECTORY} up -d registry"
ssh -t $USER@$MAIN_DOMAIN "git pull ${DIRECTORY} && docker-compose --project-directory ${DIRECTORY} up -d reverse-proxy"