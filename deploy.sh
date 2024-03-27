#!/bin/bash
docker-compose up -d
CONTAINER_NAME='democontainer'
x=$(docker ps -q -f status=running -f name=$CONTAINER_NAME)
if [[ -n "$x" ]]; then
  echo 'Container exists'
else
  echo 'No container image'
fi
