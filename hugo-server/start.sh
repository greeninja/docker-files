#!/bin/bash

docker run -e "IP=10.44.249.159" -p 8080:1313 -v /home/nick.campion/git/git.inf.glo.gb/docs:/docs:z greeninja/hugo-server
