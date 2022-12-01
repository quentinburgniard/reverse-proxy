#!/bin/bash
fail=$false
# Docker Status
services=("api" "cloud" "cv" "discover-me" "hestia" "invoice-generator" "lavoieducoeur" "portfolio" "reverse-proxy")

for service in "${services[@]}"
do
  running=$(docker inspect --format='{{json .State.Running}}' $service)
  echo $running
  if [ "$running" = "false" ]; then
    echo "Docker Status Failed $service"
    fail=$true
  fi
done

# HTTP Status
services=("api.quentinburgniard.fr" "cv.quentinburgniard.fr" "discover-me.quentinburgniard.fr" "invoice-generator.quentinburgniard.fr" "lavoieducoeur.quentinburgniard.fr" "quentinburgniard.fr")

for service in "${services[@]}"
do
  status=$(curl -k -I -so /dev/null -w '%{response_code}' https://$service)
  echo $status
  if [ "$status" != "200" ]; then
    echo "HTTP Status Failed $service"
    fail=$true
  fi
done

if [ $fail ]; then
  exit 1
  echo fail
fi