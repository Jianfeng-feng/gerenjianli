#!/bin/zsh
# 启动本地 8080 端口的 HTTP 服务器，并自动打开浏览器
python3 -m http.server 8080 &
sleep 1
open http://localhost:8080 