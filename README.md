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

	It exposes on the ClusterIP


	kubectl expose deploy contconn-deployment --type NodePort --port 8321
 
	It exposes on the port of the workernode

	kubectl delete service contconn-deployment




	kubectl get deployments,pods,svc



If the service is exposed on node, then:


URL from node inside minikube

	minikube service contconn-deployment --url

	http://172.17.0.12:30194




### namespace

	kubectl create -f ./kube-namespace.yaml
	imperative mode: kubectl create namespace tauro-namespace



POD

	kubectl run contconn007 --image=lmldocker/contconn:1.0 --namespace=tauro-namespace
	kubectl get pods --namespace=tauro-namespace


	kubectl create deployment contconn-deploy-tauro --image=lmldocker/contconn  -n=tauro-namespace --replicas=2


Expose service

		kubectl expose pod contconn007 --namespace=tauro-namespace --type NodePort --port 8321

		minikube service contconn007 --namespace=tauro-namespace --url


	http://172.17.0.12:32511
	http://172.17.0.12:30743


DELETE

	kubectl delete service/contconn007 --namespace=tauro-namespace
	kubectl delete pod/contconn007 --namespace=tauro-namespace






# LOCAL IMAGE REGISTRY

	http://192.168.1.9:5000/v2/_catalog
	docker push 192.168.1.9:5000/image-aldebaran-tauro
	minikube start --insecure-registry=192.168.1.9:5000





	ClusterIP: 
		Exposes the Service on a cluster-internal IP. Choosing this value makes the Service only reachable from within the cluster. This is the default ServiceType.
	NodePort: 
		Exposes the Service on each Node's IP at a static port (the NodePort). A ClusterIP Service, to which the NodePort Service routes, is automatically created. You'll be able to contact the NodePort Service, from outside the cluster, by requesting <NodeIP>:<NodePort>.
	LoadBalancer: 
		Exposes the Service externally using a cloud provider's load balancer. NodePort and ClusterIP Services, to which the external load balancer routes, are automatically created.
	ExternalName: 
		Maps the Service to the contents of the externalName field (e.g. foo.bar.example.com), by returning a CNAME record with its value. No proxying of any kind is set up.

			https://kubernetes.io/docs/concepts/services-networking/service/






	http://172.17.0.11:30194/call?url=http://172.17.0.11:30743/getName


	minikube service contconn-service-v01 --url
	http://172.17.0.11:8321



# SERVICE expose LoadBalancer

	kubectl expose deployment hello-world --type=LoadBalancer --name=my-service




# PORT-FORWARD

	kubectl port-forward -n contconn-port-forward pod/contconn-deployment-v01-645bd5c86c-28tts --namespace=tauro-namespace 8329:8321


# TTY

	kubectl exec -it contconn-deployment-v02-d59648bc5-mvdnc --namespace=tauro-namespace -- /bin/bash


kubectl exec -it pod/contconn-deployment-01-555b56f75-fw2bv --namespace=contconn-namespace-01 -- /bin/bash




# NSLOOKUP ALPINE TTY

kubectl run alpine --image=alpine -i --tty

kubectl run alpine --image=alpine --namespace=contconn-namespace-01 -i --tty

nslookup contconn-deployment-01


kubectl exec pod/coredns-64897985d-87nvc --namespace=kube-system  -it -- /bin/bash


kubectl exec pod/contconn-deployment-01-555b56f75-fw2bv --namespace=contconn-namespace-01  -it -- /bin/bash


http://contconn-service-05.contconn-namespace-01:8321


# TEST using domainname as service(NotExposed/ClusterIp) on another namespace

http://172.17.0.11:31801

http://172.17.0.11:31801/call?url=http://contconn-service-08.contconn-namespace-02:8321



# LoadBalancer

http://172.17.0.11:32441/setName?name=accessA
http://172.17.0.11:32441/getName



# ContConn refact

contconn-namespace-01   service/contconn-service-01         NodePort    10.109.246.245   <none>        8321:31801/TCP           85m
contconn-namespace-01   service/contconn-service-02         NodePort    10.107.94.96     <none>        8321:30836/TCP           79m
contconn-namespace-01   service/contconn-service-05         ClusterIP   10.107.222.64    <none>        8321/TCP                 79m
contconn-namespace-01   service/contconn-service-06         ClusterIP   10.104.14.28     <none>        8321/TCP                 79m
contconn-namespace-02   service/contconn-service-03         NodePort    10.97.182.195    <none>        8321:30155/TCP           79m
contconn-namespace-02   service/contconn-service-04         NodePort    10.105.134.201   <none>        8321:30958/TCP           79m
contconn-namespace-02   service/contconn-service-07         ClusterIP   10.101.150.81    <none>        8321/TCP                 79m
contconn-namespace-02   service/contconn-service-08         ClusterIP   10.105.106.5     <none>        8321/TCP                 79m

http://172.17.0.11:31801
http://172.17.0.11:30836
http://172.17.0.11:30155
http://172.17.0.11:30958




curl http://172.17.0.11:32465


minikube service contconn-service-01 --namespace=contconn-namespace-01 --url




kubectl delete -f contconn-01.yaml
kubectl delete -f contconn-02.yaml
kubectl delete -f contconn-03.yaml
kubectl delete -f contconn-04.yaml
kubectl delete -f contconn-05.yaml
kubectl delete -f contconn-06.yaml
kubectl delete -f contconn-07.yaml
kubectl delete -f contconn-08.yaml



Switch context

	kubectl config set-context --current --namespace=tauro-namespace 
	kubectl config set-context --current --namespace=default




Role-based access control (RBAC)

