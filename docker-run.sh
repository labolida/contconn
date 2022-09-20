#!/bin/bash



docker run --name contconn005    -d                \
 -p 8325:8321                                      \
 --network labolida-network-001 --ip 192.161.0.5   \
 --restart=always                                  \
 --cpus="1"                                        \
 --memory="1g" --memory-reservation="900m"         \
 lmldocker/contconn:1.0




docker run --name contconn006    -d                 \
 -p 8326:8321                                       \
 --network labolida-network-001 --ip 192.161.0.6    \
 --restart=always                                   \
 --cpus="1"                                         \
 --memory="1g" --memory-reservation="900m"          \
 lmldocker/contconn:1.0



