#!/bin/sh

prjName='abc-web'

cd /deploy

if [ ! -d "www/${prjName}" ];then
  echo 'wd: git clone'
  cd www
  git clone http://gogs:3000/wangding/${prjName}.git
  cd ${prjName}
else
  echo 'wd: git pull'
  cd www/${prjName}
  pwd
  git pull origin master --rebase
fi

echo 'wd: stop abcweb container'
/usr/bin/docker stop abcweb

echo 'wd: del abcweb container'
/usr/bin/docker rm abcweb

echo 'wd: del abcweb-img:latest image'
/usr/bin/docker rmi abcweb-img:latest

echo 'wd: build abcweb-img:latest image'
/usr/bin/docker build . -t abcweb-img:latest --rm=true

echo 'wd: start abcweb container'
/usr/bin/docker run -d --name=abcweb -p 8888:8080 abcweb-img:latest
