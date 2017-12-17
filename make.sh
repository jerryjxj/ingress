#!/bin/bash
# coding: utf-8
export REGISTRY=hyper.cd/k8s
export DOCKER=docker
export BASEIMAGE=hyper.cd/k8s/nginx:1.13.7
export GOHOSTOS=linux
export ARCH=amd64

GOARCH=$ARCH
GOOS=linux
PKG=k8s.io/ingress-nginx
DEST_PATH=/go_root/src/k8s.io/ingress-nginx
PROJ_PATH=$(pwd)
docker run -it \
 -e CGO_ENABLED=0 \
 -e GOOS=${GOOS} \
 -e GOARCH=${GOARCH} \
 -e GOPATH=/go_root \
 -v ${PROJ_PATH}:${DEST_PATH} \
 golang:1.8.5-alpine \
 go build -a -installsuffix cgo \
        -ldflags "-s -w " \
        -o ${DEST_PATH}/rootfs/nginx-ingress-controller ${PKG}/cmd/nginx

make container
make push
