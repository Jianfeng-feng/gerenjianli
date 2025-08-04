#!/bin/zsh
# 启动本地 8080 端口的 HTTP 服务器，并自动打开浏览器

# 检查并释放 8080 端口
echo "检查 8080 端口占用情况..."
if lsof -i :8080 > /dev/null 2>&1; then
    echo "8080 端口被占用，正在释放..."
    lsof -ti:8080 | xargs kill -9
    sleep 1
fi

# 启动 HTTP 服务器
echo "启动 HTTP 服务器..."
python3 -m http.server 8080 &
sleep 2

# 检查服务器是否成功启动
if lsof -i :8080 > /dev/null 2>&1; then
    echo "服务器启动成功！正在打开浏览器..."
    open http://localhost:8080
else
    echo "服务器启动失败，请检查端口占用情况"
fi 