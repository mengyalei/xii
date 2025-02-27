#!/bin/bash

# 编译xii助手
cd ../assistant
gf build -n xii_mac -a amd64  -s darwin
gf build -n xii_linux -a amd64  -s linux

# 迁移xii助手
cd ../
rm -rf ./release/linux
rm -rf ./release/mac
rm -f ./release/xii_linux.zip
rm -f ./release/xii_mac.zip

mkdir ./release/linux
mkdir ./release/mac

mv ./assistant/temp/darwin_amd64/xii_mac ./release/mac/xii
mv ./assistant/temp/linux_amd64/xii_linux ./release/linux/xii

# 创建目录
mkdir ./release/linux/data
mkdir ./release/mac/data

mkdir ./release/linux/www
mkdir ./release/mac/www

mkdir ./release/linux/logs
mkdir ./release/mac/logs

mkdir ./release/linux/env
mkdir ./release/mac/env

# 复制文件
cp -r ./repo ./release/linux/repo
cp -r ./repo ./release/mac/repo
cp -r ./script/manual.sh ./release/mac/manual.sh
cp -r ./script/manual.sh ./release/linux/manual.sh

# 打包
cd ./release
zip -r xii_linux.zip ./linux
zip -r xii_mac.zip ./mac
rm -rf ./linux
rm -rf ./mac
