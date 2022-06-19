#!/usr/bin/env bash

while read -r DEV_LANG ; do
  docker build \
    -t harbor.leryn.top/infra/code-server:${DEV_LANG} \
    -f Dockerfile \
    --build-arg="${DEV_LANG}" .
done< <(cat ./lang.txt)