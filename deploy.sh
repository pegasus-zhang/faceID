#!/bin/bash

# 默认的用户名和IP地址
USER="titan"
IP="192.168.31.219"

# 解析传入的参数
while [[ $# -gt 0 ]]; do
    case "$1" in
        --user=*)
            USER="${1#*=}"
            shift
            ;;
        --ip=*)
            IP="${1#*=}"
            shift
            ;;
        --first-run)
            FIRST_RUN=true
            shift
            ;;
        *)
            shift
            ;;
    esac
done
# 检查是否是首次更新
if [ "$FIRST_RUN" == "true" ]; then
    echo "首次更新，执行初始化操作..."
    mkdir -p faceID_deploy 
    cp -r config weights workspace lib ros1_interface faceID_deploy/
    mkdir -p faceID_deploy/data
    cp -r data/known_people faceID_deploy/data/
    rsync -avz --progress faceID_deploy/* $USER@$IP:/home/$USER/02_projects/faceID/
else
    echo "不是首次更新,只执行同步操作..."
    cp -r lib faceID_deploy/
    rsync -avz --progress faceID_deploy/* $USER@$IP:/home/$USER/02_projects/faceID/
fi