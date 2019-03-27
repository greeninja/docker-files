#!/bin/bash

docker build --no-cache . -t ansible_latest
c=$?
if [ $c -eq 0 ]; then
  docker run -it -e HOME=$HOME -u $(id -u):$(id -g) -v $HOME:$HOME ansible_latest bash
else
  echo "Build errored with $c"
fi
