#!/bin/bash	
# https://docs.travis-ci.com/user/deployment/custom/#git	
eval "$(ssh-agent -s)"
chmod 600 .travis/deploy
ssh-add .travis/deploy
ssh -t $USER@registry.quentinburgniard.com "git pull ${DIRECTORY} && docker-compose --project-directory ${DIRECTORY} up -d registry"
ssh -t $USER@digital-leman.com "git pull ${DIRECTORY} && docker-compose --project-directory ${DIRECTORY} up -d reverse-proxy"