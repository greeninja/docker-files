#!/bin/sh

while true; do
  iozone -s 5g -r 8k /storage
done
