#!/bin/bash
# coding: utf-8
export TAG=1.13.7
export REGISTRY=hyper.cd/k8s
export DOCKER=docker
export BASEIMAGE=ubuntu:16.04
make container
make push 


