#!/bin/bash


docker service create --name contconn005  -d  \
 -p 8325:8321                                 \
  --replicas=3                                \
 --limit-cpu="2"                              \
 --limit-memory="1g"                          \
 lmldocker/contconn:1.0

# docker service inspect contconn005
# docker service ps contconn005
# docker service logs contconn005
# docker service rm contconn005

# DOCKER SWARM -- will rebalance a service across all nodes that match its requirements and constraints.
# docker service update --force contconn005
# https://docs.docker.com/engine/swarm/ingress/

