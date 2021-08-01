#!/bin/sh

id=$(docker ps --filter "name=abcweb" -q)

if [ ! -z "$id"  ]; then
  docker stop abcweb
  docker rm abcweb
  docker rmi abcweb-img
fi
