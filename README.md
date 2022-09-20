# contconn - Containers Connectivity Tester MicroService

This project aims to create a docker container image to test connectivity between containers.

You could deploy multiple containers using Bridge drive to better understand it
or test it on a more complex scenario with kubernetes
using Types as ClusterIP, NodePort, LoadBalancing..



# Testing with browser

http://127.0.0.1:8321/


http://127.0.0.1:8321/setName?name=001

http://127.0.0.1:8321/getName


http://127.0.0.1:8321/database?host=localhost&port=3306&databasename=dbname&user=root&password=root

http://127.0.0.1:8321/exit


# Testing with containers


curl http://127.0.0.1:8325/setName?name=X005
curl http://127.0.0.1:8326/setName?name==X006


curl http://127.0.0.1:8325/getName
curl http://127.0.0.1:8326/getName



## Testing the connectovity with both containers using different ip addresses

Attention: using port 8321, NOT THE EXPOSED!!!

curl http://192.161.0.5:8321/getName

curl http://127.0.0.1:8325/call?url=http://192.161.0.6:8321/getName
	





# docker run

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





# docker service

docker service create --name contconn005  -d  \
 -p 8325:8321                                 \
  --replicas=3                                \
 --limit-cpu="2"                              \
 --limit-memory="1g"                          \
 lmldocker/contconn:1.0





# Kubernetes

## deploy

kubectl apply -f proxy-reverse-deployment.yaml
kubectl delete -f proxy-reverse-deployment.yaml




## service expose


kubectl expose deploy reverse-proxy-spring-boot-deployment --type ClusterIP 
 - It exposes on the ClusterIP


kubectl expose deploy contconn-deployment --type NodePort --port 8321
 - It exposes on the port of the workernode

kubectl delete service contconn-deployment




kubectl get deployments,pods,svc



 - If the service is exposed on node, then:

minikube service contconn-deployment --url

http://172.17.0.12:30194

