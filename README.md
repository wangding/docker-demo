# 16-gogs-drone-ci

gogs + drone ci

## start gogs

gogs use v0.11.29, latest version webhook not work

docker run -d \
  -e TZ="Asia/Shanghai" \
  -v /data  \
  --net host \
  --restart=always \
  --name=gogs \
  gogs/gogs:0.11.29

- 默认端口为 3000，使用宿主的 IP 地址
- 配置 gogs，使用 sqllite 数据库
- 注册创建账户 wangding，第一个账户默认为管理员账户
- 创建空的测试仓库 demo
- 克隆 demo 仓库，`git clone http://192.168.174.133:3000/wangding/demo.git`
- `cd demo && echo 'hello' > a.txt`
- `git add .`
- `git commit -m "add a.txt"`
- `git push`
- 检查 gogs 上的 demo 仓库，有最新的提交

## start drone

docker run -d \
  -v /data \
  -e DRONE_AGENTS_ENABLED=true \
  -e DRONE_GOGS_SERVER=http://192.168.174.133:3000 \
  -e DRONE_RPC_SECRET=mydrone666 \
  -e DRONE_SERVER_HOST=192.168.174.133:8888 \
  -e DRONE_SERVER_PROTO=http \
  -e DRONE_USER_CREATE=username:wangding,admin:true \
  -e TZ="Asia/Shanghai" \
  -p 8888:80 \
  --restart=always \
  --name=drone \
  drone/drone:1

- 注意 DRONE_GOGS_SERVER 和 DRONE_SERVER_HOST 两个参数的 IP 地址，使用宿主的 IP 地址
- 端口号是 8888
- 访问 drone 服务，http://192.168.174.133:8888
- 用 gogs 的 wangding 账户登录
- 可以看到 demo 仓库，激活 demo 仓库的自动化构建，构选 project setting: trusted，允许 runner 构建 docker 镜像
- 检查 gogs demo 仓库的 webhook 配置，drone 自动添加了 webhook 配置

## start drone-runner

docker run -d \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -e DRONE_RPC_PROTO=http \
  -e DRONE_RPC_HOST=192.168.174.133:8888 \
  -e DRONE_RPC_SECRET=mydrone666 \
  -e DRONE_RUNNER_CAPACITY=2 \
  -e DRONE_RUNNER_NAME=runner-docker \
  -e TZ="Asia/Shanghai" \
  -p 9999:3000 \
  --restart=always \
  --name=runner-docker \
  drone/drone-runner-docker:1

- 注意 DRONE_RPC_HOST 参数的 IP 地址，使用宿主的 IP 地址

## 完成一个 web-app 的自动化构建

具体代码见 demo 文件夹
- app.js 是一个简单的 web-app，监听 8080 端口
- Dockerfile 将该 web-app 构建成一个 Docker 镜像
- .drone.yml 自动化构建脚本，用来生成镜像，并运行之
- clean.sh 用来清除上一次构建的镜像和容器
- 提交 demo 文件夹下的代码，检查 drone 服务的构建结果
- 观察宿主机的 docker 容器，`docker ps -a`，多了一个 abcweb 容器
- docker inspect abcweb，查到该容器的 IP 地址
- curl 访问 abcweb 容器
- 修改 app.js 代码，再次提交，会触发新的构建
- curl 访问 abcweb 容器看到最新的构建效果
