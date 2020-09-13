#!/bin/bash
# Docker Status
services=("api" "cloud" "cv" "discover-me" "hestia" "invoice-generator" "lavoieducoeur" "portfolio" "reverse-proxy")

for service in "${services[@]}"
do
  running=$(docker inspect --format='{{json .State.Running}}' $service)
  if [ $running = "false" ]; then
    echo "Docker Status Failed"
    exit 1
  fi
done

# HTTP Status
# services=("cv.quentinburgniard.fr" "discover-me.quentinburgniard.fr" "lavoieducoeur.quentinburgniard.fr" "quentinburgniard.fr")

# sleep 1m

# for service in "${services[@]}"
# do
#   curl -k -I https://$service
#   status=$(curl -k -I -so /dev/null -w '%{response_code}' https://$service)
#   if [ $status != "200" ]; then
#     echo "HTTP Status Failed"
#     exit 1
#   fi
# done