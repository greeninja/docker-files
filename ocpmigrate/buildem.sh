#!/bin/bash

tag=$1
scriptdir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

if [ -z "$tag" ]; then
  echo "No tag supplied, exiting"
  exit 1
fi

for i in `ls`; do
  echo "Building $i"
  echo "Work directory = $scriptdir/$i"
  cd $scriptdir/$i
  docker build . --no-cache -t greeninja/$i:$tag
  docker push greeninja/$i:$tag
done
