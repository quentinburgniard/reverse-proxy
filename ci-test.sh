#!/bin/bash
docker inspect --format='{{json .Config}}' reverse-proxy