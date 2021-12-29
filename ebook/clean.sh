#!/bin/sh

id=$(docker ps --filter "name=ebook" -q)

if [ ! -z "$id"  ]; then
  docker stop ebook
  docker rm ebook
  docker rmi ebook-img
fi
