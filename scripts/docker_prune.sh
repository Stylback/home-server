#!/bin/bash

docker image prune -a -f
docker system prune --volumes -f
