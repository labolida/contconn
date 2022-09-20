#!/bin/bash

echo building the contconn docker image

docker build -t lmldocker/contconn:1.0 .

docker image ls
