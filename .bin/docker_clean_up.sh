#!/bin/bash

docker rm -f $(docker ps -aq) 2>/dev/null
docker rmi -f $(docker images -f "dangling=true" -q) 2>/dev/null
