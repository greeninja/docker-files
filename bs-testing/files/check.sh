#!/bin/bash

if [ -z $check_url ]; then
  echo "check_url var is empty - quitting"
  exit 1
fi

i=1
while true; do
  d=$(date)
  echo -n "$d $i -"
  wget $check_url --timeout=10 --spider -S 2>&1 | grep 'HTTP/'
  sleep 5
  let i++
done
