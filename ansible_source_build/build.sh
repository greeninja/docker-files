#!/bin/bash

docker build --no-cache . -t ansible_latest
docker run -v `pwd`/bin:/tmp/host_vol:z ansible_latest
